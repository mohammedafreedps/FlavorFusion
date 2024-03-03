
import 'package:flavorfusion/data/repository/recipe_from_firebase_model.dart';

sealed class ActivityState {}

final class ActivityInitial extends ActivityState {}

class SortedValueState extends ActivityState{
  List<RecipeFromFireBaseModel> posted;
  SortedValueState({required this.posted});
}

class DeletingPostState extends ActivityState{}

class DeletedSuccesfullyState extends ActivityState{}


