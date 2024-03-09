class CommentModel {
  String commentId;
  String commentedBy;
  String comment;
  CommentModel({required this.commentId,required this.commentedBy, required this.comment});

  factory CommentModel.fromMap(String commentId, Map<String, dynamic> map) {
    return CommentModel(commentId: commentId, commentedBy: map['commentedby'], comment: map['comment']);
  }
}
