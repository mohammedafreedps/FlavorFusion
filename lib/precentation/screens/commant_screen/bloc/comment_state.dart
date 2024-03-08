
import 'package:flavorfusion/data/repository/comments_model.dart';

sealed class CommentState {}

final class CommentInitial extends CommentState {}

class CommentUploadingState extends CommentState{}

class CommentsOnPostState extends CommentState{
  List<CommentModel> comments;
  CommentsOnPostState({required this.comments});
}

class CommentAddedState extends CommentState{}