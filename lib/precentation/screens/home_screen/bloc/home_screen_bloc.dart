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

      for (var i = 0; i < hrecipies.length; i++) {
        QuerySnapshot<Map<String, dynamic>> record = await FirebaseFirestore
            .instance
            .collection('recipes')
            .doc(hrecipies[i].docId)
            .collection('comments')
            .get();
        hrecipies[i].commentCount = record.size;
        print(hrecipies[i].commentCount);
      }

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

    on<SearchingEvent>((event, emit) {
      List<RecipeFromFireBaseModel> searchRecipieResult = hrecipies
          .where((recip) => recip.recipeTitle
              .toLowerCase()
              .contains(event.query.toLowerCase().trim()))
          .toList();
      print(searchRecipieResult);
      emit(SearchRecipieResultState(searchResults: searchRecipieResult));
    });

    on<CategorySearchEvent>((event, emit) {
      List<RecipeFromFireBaseModel> searchResults = [];
      hcategorySelected[event.index] = !hcategorySelected[event.index];
      if (hcategorySelected.contains(true)) {
        for (int i = 0; i < hcategorySelected.length; i++) {
          if (hcategorySelected[i] == true) {
            List<RecipeFromFireBaseModel> searchRecipieResult = hrecipies
                .where((recip) => recip.category
                    .toLowerCase()
                    .contains(hcategoryItemName[i].toLowerCase().trim()))
                .toList();
            searchResults.addAll(searchRecipieResult);
          }
        }
      } else {
        searchResults.addAll(hrecipies);
      }

      emit(CategorySearchResultsState(searchResults: searchResults));
    });
  }
}
