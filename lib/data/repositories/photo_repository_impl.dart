import 'package:injectable/injectable.dart';
import 'package:flutter_gallery_app/data/datasources/photo_remote_data_source.dart';
import 'package:flutter_gallery_app/domain/entities/photo.dart';
import 'package:flutter_gallery_app/domain/repositories/photo_repository.dart';

@Injectable(as: PhotoRepository)
class PhotoRepositoryImpl implements PhotoRepository {
  final PhotoRemoteDataSource _remoteDataSource;

  PhotoRepositoryImpl(this._remoteDataSource);

  @override
  Future<List<Photo>> getPhotos({int page = 1, int limit = 10}) async {
    try {
      final photoModels = await _remoteDataSource.getPhotos(page: page, limit: limit);
      return photoModels.map((model) => model.toEntity()).toList();
    } catch (e) {
      throw Exception('Failed to get photos: $e');
    }
  }
}