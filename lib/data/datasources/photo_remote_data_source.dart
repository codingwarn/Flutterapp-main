import 'package:injectable/injectable.dart';
import 'package:flutter_gallery_app/core/network/api_client.dart';
import 'package:flutter_gallery_app/data/models/photo_model.dart';

abstract class PhotoRemoteDataSource {
  Future<List<PhotoModel>> getPhotos({int page = 1, int limit = 10});
}

@Injectable(as: PhotoRemoteDataSource)
class PhotoRemoteDataSourceImpl implements PhotoRemoteDataSource {
  final ApiClient _apiClient;

  PhotoRemoteDataSourceImpl(this._apiClient);

  @override
  Future<List<PhotoModel>> getPhotos({int page = 1, int limit = 10}) async {
    try {
      final response = await _apiClient.get(
        '/photos',
        queryParameters: {
          '_page': page,
          '_limit': limit,
        },
      );

      if (response.statusCode == 200) {
        return (response.data as List)
            .map((json) => PhotoModel.fromJson(json))
            .toList();
      } else {
        throw Exception('Failed to load photos');
      }
    } catch (e) {
      throw Exception('Failed to load photos: $e');
    }
  }
}