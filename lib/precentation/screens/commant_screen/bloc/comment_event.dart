
sealed class CommentEvent {}

class PostCommentButtonClikedEvent extends CommentEvent{
  String docId;
  String comment;
  PostCommentButtonClikedEvent({required this.docId,required this.comment});
}

class LoadCommentsEvent extends CommentEvent {
  String docId;
  LoadCommentsEvent({required this.docId});
}