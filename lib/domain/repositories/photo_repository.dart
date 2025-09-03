import 'package:flutter_gallery_app/domain/entities/photo.dart';

abstract class PhotoRepository {
  Future<List<Photo>> getPhotos({int page = 1, int limit = 10});
}