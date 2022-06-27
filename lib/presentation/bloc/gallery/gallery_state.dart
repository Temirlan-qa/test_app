import '../../../data/models/gallery_db.dart';

abstract class GalleryState {}

class GalleryEmptyState extends GalleryState {}

class GalleryLoadingState extends GalleryState {}

class GalleryLoadedState extends GalleryState {
  List<GalleryList> loadedGallery;
  GalleryLoadedState({
    required this.loadedGallery,
  });
}

class GalleryErrorState extends GalleryState {}