import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flavorfusion/data/repository/comments_model.dart';
import 'package:flavorfusion/data/temp_value_holder.dart';
import 'package:flavorfusion/precentation/screens/commant_screen/bloc/comment_event.dart';
import 'package:flavorfusion/precentation/screens/commant_screen/bloc/comment_state.dart';

class CommentBloc extends Bloc<CommentEvent, CommentState> {
  CommentBloc() : super(CommentInitial()) {
    on<CommentEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<PostCommentButtonClikedEvent>((event, emit) async {
      emit(CommentUploadingState());
      hrecipies.clear();
      FirebaseFirestore.instance
          .collection('recipes')
          .doc(event.docId)
          .collection('comments')
          .add({'comment': event.comment, 'commentedby': huser!.email, 'time' : event.dateTime});
      emit(CommentAddedState());
    });

    on<LoadCommentsEvent>((event, emit) async {
      emit(CommentUploadingState());
      QuerySnapshot<Map<String, dynamic>> record = await FirebaseFirestore
          .instance
          .collection('recipes')
          .doc(event.docId)
          .collection('comments')
          .get();
      List<CommentModel> comment = record.docs
          .map((doc) => CommentModel.fromMap(doc.id, doc.data()))
          .toList();
      hcommentCount.add(record.size);
      print(hcommentCount.length);
      emit(CommentsOnPostState(comments: comment));
    });

    on<DeleteCommentButtonClikedEvent>((event, emit) async {
      emit(CommentUploadingState());
      final commentDocRef = FirebaseFirestore.instance
          .collection('recipes')
          .doc(event.docId)
          .collection('comments')
          .doc(event.commentId);
      try {
        await commentDocRef.delete();
        emit(CommentDeletedState());
      } on FirebaseException catch (e) {
        print(e);
      }
    });
  }
}
