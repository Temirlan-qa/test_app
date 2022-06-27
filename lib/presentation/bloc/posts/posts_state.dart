import 'package:test_app/data/models/news_db.dart';

abstract class PostsState {}

class PostsEmptyState extends PostsState {}

class PostsLoadingState extends PostsState {}

class PostsLoadedState extends PostsState {
  List<NewsList> loadedPosts;
  PostsLoadedState({
    required this.loadedPosts,
  });
}

class PostsErrorState extends PostsState {}