import 'package:equatable/equatable.dart';
import 'package:flutter_gallery_app/domain/entities/photo.dart';

class PhotoModel extends Equatable {
  final int id;
  final int albumId;
  final String title;
  final String url;
  final String thumbnailUrl;

  const PhotoModel({
    required this.id,
    required this.albumId,
    required this.title,
    required this.url,
    required this.thumbnailUrl,
  });

  factory PhotoModel.fromJson(Map<String, dynamic> json) {
    return PhotoModel(
      id: json['id'],
      albumId: json['albumId'],
      title: json['title'],
      url: json['url'],
      thumbnailUrl: json['thumbnailUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'albumId': albumId,
      'title': title,
      'url': url,
      'thumbnailUrl': thumbnailUrl,
    };
  }

  Photo toEntity() {
    return Photo(
      id: id,
      albumId: albumId,
      title: title,
      url: url,
      thumbnailUrl: thumbnailUrl,
    );
  }

  @override
  List<Object?> get props => [id, albumId, title, url, thumbnailUrl];
}