import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flavorfusion/data/repository/recipe_from_firebase_model.dart';
import 'package:flavorfusion/data/temp_value_holder.dart';
import 'package:flavorfusion/precentation/screens/home_screen/bloc/home_screen_event.dart';
import 'package:flavorfusion/precentation/screens/home_screen/bloc/home_screen_state.dart';

class HomeScreenBloc extends Bloc<HomeScreenEvent, HomeScreenState> {
  HomeScreenBloc() : super(HomeScreenInitial()) {
    on<HomeScreenEvent>((event, emit) {});
    on<FechDataFromFirebaseEvent>((event, emit) async {
      QuerySnapshot<Map<String, dynamic>> records =
          await FirebaseFirestore.instance.collection('recipes').get();
      List<RecipeFromFireBaseModel> recipes = records.docs
          .map((doc) => RecipeFromFireBaseModel.fromMap(doc.id, doc.data()))
          .toList();
      hrecipies.clear();
      for (int i = recipes.length - 1; i >= 0; i--) {
        hrecipies.add(recipes[i]);
        hlikes.add(recipes[i].likes);
      }
      // await Future.delayed(Duration(seconds: 1));
      emit(AllDatasLoadedState(recipies: hrecipies));
    });

    on<LikeButtonClickedEvent>((event, emit) async {
      final colRef =
          FirebaseFirestore.instance.collection('recipes').doc(event.docId);
      colRef.update({
        'likes': FieldValue.arrayUnion([event.user.email])
      });

      emit(LikeCheckState());
    });

    on<DislikeButtonClickedEvent>((event, emit) async {
      final colRef =
          FirebaseFirestore.instance.collection('recipes').doc(event.docId);
      colRef.update({
        'likes': FieldValue.arrayRemove([event.user.email])
      });

      emit(LikeCheckState());
    });

    on<WishListClickedEvent>((event, emit) {
      final colRef =
          FirebaseFirestore.instance.collection('recipes').doc(event.docId);
      colRef.update({
        'wishlist': FieldValue.arrayUnion([event.user.email])
      });
      emit(LikeCheckState());
    });

    on<RemoveWishListClickedEvent>((event, emit) {
      final colRef =
          FirebaseFirestore.instance.collection('recipes').doc(event.docId);
      colRef.update({
        'wishlist': FieldValue.arrayRemove([event.user.email])
      });
      emit(LikeCheckState());
    });
  }
}
