class CommentModel {
  String commentedBy;
  String comment;
  CommentModel({required this.commentedBy, required this.comment});

  factory CommentModel.fromMap(Map<String, dynamic> map) {
    return CommentModel(commentedBy: map['commentedby'], comment: map['comment']);
  }
}
