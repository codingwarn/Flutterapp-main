import 'package:equatable/equatable.dart';

abstract class PhotoEvent extends Equatable {
  const PhotoEvent();

  @override
  List<Object> get props => [];
}

class FetchPhotos extends PhotoEvent {
  const FetchPhotos();
}

class FetchMorePhotos extends PhotoEvent {
  const FetchMorePhotos();
}

class RefreshPhotos extends PhotoEvent {
  const RefreshPhotos();
}