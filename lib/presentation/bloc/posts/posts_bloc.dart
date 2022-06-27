import 'package:test_app/data/models/news_db.dart';
import 'posts_event.dart';
import 'posts_state.dart';
import '../../../services/posts/posts_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  final PostsRepository postsRepository;
  PostsBloc({required this.postsRepository}) : super(PostsEmptyState()) {
    on<PostsLoadEvent>(
      (event, emit) async {
        emit(PostsLoadingState());

        try {
          final List<NewsList> loadedPostsList = await postsRepository.getAllNewsList();
          emit(PostsLoadedState(loadedPosts: loadedPostsList));
        } catch (_) {
          emit(PostsErrorState());
        }
      },
    );
  }
}