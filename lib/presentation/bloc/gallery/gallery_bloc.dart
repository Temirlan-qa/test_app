import '../../../data/models/gallery_db.dart';
import '../../../services/gallery/gallery_repository.dart';
import 'gallery_event.dart';
import 'gallery_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GalleryBloc extends Bloc<GalleryEvent, GalleryState> {
  final GalleryListRepository galleryRepository;
  GalleryBloc({required this.galleryRepository}) : super(GalleryEmptyState()) {
    on<GalleryLoadEvent>(
      (event, emit) async {
        emit(GalleryLoadingState());

        try {
          final List<GalleryList> loadedGallerysList = await galleryRepository.getAllGalleryList();
          emit(GalleryLoadedState(loadedGallery: loadedGallerysList));
        } catch (_) {
          emit(GalleryErrorState());
        }
      },
    );
  }
}