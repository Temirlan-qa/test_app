import '../../data/models/news_db.dart';
import 'services_api_provider.dart';
class PostsRepository {
  final PostsProvider _postsProvider = PostsProvider();
  Future<List<NewsList>> getAllNewsList() => _postsProvider.getNews();
}