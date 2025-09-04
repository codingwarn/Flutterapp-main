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
      } else if (response.statusCode == 403) {
        throw Exception(
            'Access forbidden (403). The API may be blocking requests from this environment.');
      } else if (response.statusCode == 404) {
        throw Exception('Endpoint not found: /photos');
      } else {
        throw Exception('Failed to load photos (status: ${response.statusCode}).');
      }
    } catch (e) {
      throw Exception('Failed to load photos: $e');
    }
  }
}