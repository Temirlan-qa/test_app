import '../../data/models/comments_db.dart';
import 'services_api_provider.dart';

class CommentsListRepository {
  final CommentsListProvider _commentsListProvider = CommentsListProvider();
  Future<List<CommentsList>> getAllCommentsList(int w) => _commentsListProvider.getCommentsList(w);
}