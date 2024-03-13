

sealed class CommentEvent {}

class PostCommentButtonClikedEvent extends CommentEvent {
  String docId;
  String comment;
  DateTime dateTime;
  PostCommentButtonClikedEvent({required this.docId, required this.comment, required this.dateTime});
}

class LoadCommentsEvent extends CommentEvent {
  String docId;
  LoadCommentsEvent({required this.docId});
}

class DeleteCommentButtonClikedEvent extends CommentEvent {
  String docId;
  String commentId;
  DeleteCommentButtonClikedEvent({required this.docId, required this.commentId});
}
