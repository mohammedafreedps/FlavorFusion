
import 'package:firebase_auth/firebase_auth.dart';

sealed class SavedRecipesEvent {}

class LoadDataInSavedRecipieEvent extends SavedRecipesEvent{}

class RemoveSavedRecipeButtonClickedEvent extends SavedRecipesEvent{
  String docId;
  User user;
  RemoveSavedRecipeButtonClickedEvent({required this.docId,required this.user});
}