import 'package:injectable/injectable.dart';
import 'package:flutter_gallery_app/domain/entities/photo.dart';
import 'package:flutter_gallery_app/domain/repositories/photo_repository.dart';

@injectable
class GetPhotosUseCase {
  final PhotoRepository _repository;

  GetPhotosUseCase(this._repository);

  Future<List<Photo>> execute({int page = 1, int limit = 10}) {
    return _repository.getPhotos(page: page, limit: limit);
  }
}