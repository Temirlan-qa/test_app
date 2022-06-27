import '../../data/models/gallery_db.dart';
import 'services_api_provider.dart';

class GalleryListRepository {
  final GalleryListProvider _GalleryListProvider = GalleryListProvider();
  Future<List<GalleryList>> getAllGalleryList() => _GalleryListProvider.getGalleryList();
}