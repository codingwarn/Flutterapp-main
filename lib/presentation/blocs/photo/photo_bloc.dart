import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_gallery_app/domain/usecases/get_photos_usecase.dart';
import 'package:flutter_gallery_app/presentation/blocs/photo/photo_event.dart';
import 'package:flutter_gallery_app/presentation/blocs/photo/photo_state.dart';

@injectable
class PhotoBloc extends Bloc<PhotoEvent, PhotoState> {
  final GetPhotosUseCase _getPhotosUseCase;
  static const int _photosPerPage = 10;

  PhotoBloc(this._getPhotosUseCase) : super(const PhotoState()) {
    on<FetchPhotos>(_onFetchPhotos);
    on<FetchMorePhotos>(_onFetchMorePhotos);
    on<RefreshPhotos>(_onRefreshPhotos);
  }

  Future<void> _onFetchPhotos(FetchPhotos event, Emitter<PhotoState> emit) async {
    emit(state.copyWith(status: PhotoStatus.loading));
    try {
      final photos = await _getPhotosUseCase.execute(page: 1, limit: _photosPerPage);
      emit(state.copyWith(
        status: PhotoStatus.loaded,
        photos: photos,
        hasReachedMax: photos.length < _photosPerPage,
        currentPage: 1,
        errorMessage: null,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: PhotoStatus.error,
        errorMessage: e.toString(),
      ));
    }
  }

  Future<void> _onFetchMorePhotos(FetchMorePhotos event, Emitter<PhotoState> emit) async {
    if (state.hasReachedMax) return;
    
    try {
      final nextPage = state.currentPage + 1;
      final morePhotos = await _getPhotosUseCase.execute(page: nextPage, limit: _photosPerPage);
      
      if (morePhotos.isEmpty) {
        emit(state.copyWith(hasReachedMax: true));
      } else {
        emit(state.copyWith(
          status: PhotoStatus.loaded,
          photos: [...state.photos, ...morePhotos],
          hasReachedMax: morePhotos.length < _photosPerPage,
          currentPage: nextPage,
          errorMessage: null,
        ));
      }
    } catch (e) {
      emit(state.copyWith(
        status: PhotoStatus.error,
        errorMessage: e.toString(),
      ));
    }
  }

  Future<void> _onRefreshPhotos(RefreshPhotos event, Emitter<PhotoState> emit) async {
    emit(const PhotoState(status: PhotoStatus.loading));
    try {
      final photos = await _getPhotosUseCase.execute(page: 1, limit: _photosPerPage);
      emit(PhotoState(
        status: PhotoStatus.loaded,
        photos: photos,
        hasReachedMax: photos.length < _photosPerPage,
        currentPage: 1,
      ));
    } catch (e) {
      emit(PhotoState(
        status: PhotoStatus.error,
        errorMessage: e.toString(),
      ));
    }
  }
}