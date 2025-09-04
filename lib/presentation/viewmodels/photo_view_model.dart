import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_gallery_app/domain/usecases/get_photos_usecase.dart';
import 'package:flutter_gallery_app/domain/entities/photo.dart';

enum PhotoVmStatus { initial, loading, success, error }

@injectable
class PhotoViewModel extends ChangeNotifier {
  final GetPhotosUseCase _getPhotosUseCase;

  PhotoViewModel(this._getPhotosUseCase);

  PhotoVmStatus _status = PhotoVmStatus.initial;
  List<Photo> _photos = <Photo>[];
  String? _errorMessage;

  PhotoVmStatus get status => _status;
  List<Photo> get photos => _photos;
  String? get errorMessage => _errorMessage;

  Future<void> fetch({int page = 1, int limit = 10}) async {
    _status = PhotoVmStatus.loading;
    _errorMessage = null;
    notifyListeners();

    try {
      final result = await _getPhotosUseCase.execute(page: page, limit: limit);
      _photos = result;
      _status = PhotoVmStatus.success;
    } catch (e) {
      _status = PhotoVmStatus.error;
      _errorMessage = e.toString();
    }
    notifyListeners();
  }
}


