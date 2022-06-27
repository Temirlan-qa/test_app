import '../../../data/models/comments_db.dart';
import '../../../services/comments/comments_repository.dart';
import 'comments_event.dart';
import 'comments_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CommentsBloc extends Bloc<CommentsEvent, CommentsState> {
  final CommentsListRepository commentsRepository;
  CommentsBloc({required this.commentsRepository}) : super(CommentsEmptyState()) {
    on<CommentsLoadEvent>(
      (event, emit) async {
        emit(CommentsLoadingState());

        try {
          final List<CommentsList> loadedCommentsList = await commentsRepository.getAllCommentsList(event.w);
          emit(CommentsLoadedState(loadedComments: loadedCommentsList));
        } catch (_) {
          emit(CommentsErrorState());
        }
      },
    );
  }
}