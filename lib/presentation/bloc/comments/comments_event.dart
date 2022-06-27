abstract class CommentsEvent {}

class CommentsLoadEvent extends CommentsEvent {
  final int w;

  CommentsLoadEvent(this.w);
}