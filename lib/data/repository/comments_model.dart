import 'package:cloud_firestore/cloud_firestore.dart';

class CommentModel {
  String commentId;
  String commentedBy;
  String comment;
  DateTime dateTime; 
  CommentModel({required this.commentId,required this.commentedBy, required this.comment, required this.dateTime});

  factory CommentModel.fromMap(String commentId, Map<String, dynamic> map) {
    Timestamp timeStamp = map['time'];
    DateTime dateTime = timeStamp.toDate();
    return CommentModel(commentId: commentId, commentedBy: map['commentedby'], comment: map['comment'],dateTime: dateTime);
  }
}
