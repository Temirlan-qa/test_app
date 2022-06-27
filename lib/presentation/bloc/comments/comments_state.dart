import '../../../data/models/comments_db.dart';

abstract class CommentsState {}

class CommentsEmptyState extends CommentsState {}

class CommentsLoadingState extends CommentsState {}

class CommentsLoadedState extends CommentsState {
  List<CommentsList> loadedComments;
  CommentsLoadedState({
    required this.loadedComments,
  });
}

class CommentsErrorState extends CommentsState {}