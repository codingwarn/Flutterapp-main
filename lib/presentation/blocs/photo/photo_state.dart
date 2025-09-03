import 'package:equatable/equatable.dart';
import 'package:flutter_gallery_app/domain/entities/photo.dart';

enum PhotoStatus { initial, loading, loaded, error }

class PhotoState extends Equatable {
  final List<Photo> photos;
  final PhotoStatus status;
  final String? errorMessage;
  final bool hasReachedMax;
  final int currentPage;

  const PhotoState({
    this.photos = const [],
    this.status = PhotoStatus.initial,
    this.errorMessage,
    this.hasReachedMax = false,
    this.currentPage = 1,
  });

  PhotoState copyWith({
    List<Photo>? photos,
    PhotoStatus? status,
    String? errorMessage,
    bool? hasReachedMax,
    int? currentPage,
  }) {
    return PhotoState(
      photos: photos ?? this.photos,
      status: status ?? this.status,
      errorMessage: errorMessage,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      currentPage: currentPage ?? this.currentPage,
    );
  }

  @override
  List<Object?> get props => [photos, status, errorMessage, hasReachedMax, currentPage];
}