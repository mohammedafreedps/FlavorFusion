import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flavorfusion/data/repository/saved_recipes_model.dart';
import 'package:flavorfusion/data/temp_value_holder.dart';
import 'package:flavorfusion/precentation/screens/saved_recipies/bloc/saved_recipes_event.dart';
import 'package:flavorfusion/precentation/screens/saved_recipies/bloc/saved_recipes_state.dart';

class SavedRecipesBloc extends Bloc<SavedRecipesEvent, SavedRecipesState> {
  SavedRecipesBloc() : super(SavedRecipesInitial()) {
    on<SavedRecipesEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<LoadDataInSavedRecipieEvent>((event, emit) async {
      // User? _user = await FirebaseAuth.instance.currentUser;
      QuerySnapshot<Map<String, dynamic>> record = await FirebaseFirestore.instance.collection('recipes').get();
      List<SavedRecipeModel> savedRecipes = record.docs.map((doc)=> SavedRecipeModel.fromMap(doc.id,doc.data())).toList();
      hsavedRecipes = savedRecipes.where((recipes) => recipes.wishlist.contains(huser!.email),).toList();
      // print(savedRecipes[2].wishlist);
      emit(SavedRecipesListState(savedRecipes: hsavedRecipes));
    });

    on<RemoveSavedRecipeButtonClickedEvent>((event, emit) {
      final colRef =
          FirebaseFirestore.instance.collection('recipes').doc(event.docId);
      colRef.update({
        'wishlist': FieldValue.arrayRemove([event.user.email])
      });
      emit(RemovedSavedRecipeState());
    });
  }

}
