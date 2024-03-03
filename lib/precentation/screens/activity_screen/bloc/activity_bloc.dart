import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flavorfusion/data/repository/recipe_from_firebase_model.dart';
import 'package:flavorfusion/data/temp_value_holder.dart';
import 'package:flavorfusion/precentation/screens/activity_screen/bloc/activity_event.dart';
import 'package:flavorfusion/precentation/screens/activity_screen/bloc/activity_state.dart';

class ActivityBloc extends Bloc<ActivityEvent, ActivityState> {
  ActivityBloc() : super(ActivityInitial()) {
    on<ActivityEvent>((event, emit) {});

    on<SortAndSetValueEvent>(((event, emit) async {
      User? _user = await FirebaseAuth.instance.currentUser;
      List<RecipeFromFireBaseModel> posterRecipes = hrecipies
          .where((recipe) => recipe.userEmail == _user!.email)
          .toList();
          print('sortand set value called');
      emit(SortedValueState(posted: posterRecipes));
    }));

    on<DeletePostButtonClickedEvent>((event, emit) async {
      emit(DeletingPostState());
      String docId = event.recipes[event.index].docId;
      String imgPath = event.recipes[event.index].imageURL;
      final docRef =
          FirebaseFirestore.instance.collection('recipes').doc(docId);
      final imageRef =
          FirebaseStorage.instance.refFromURL(imgPath);
      try {
        await imageRef.delete();
        await docRef.delete();
        emit(DeletedSuccesfullyState());
      } on FirebaseException catch (e) {
        throw e;
      }
    });
  }
}
