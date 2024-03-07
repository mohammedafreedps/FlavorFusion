
import 'package:flavorfusion/data/repository/recipe_from_firebase_model.dart';

sealed class HomeScreenState {}

final class HomeScreenInitial extends HomeScreenState {}

class AllDatasLoadedState extends HomeScreenState{
  List<RecipeFromFireBaseModel> recipies;
  AllDatasLoadedState({required this.recipies});
}

class LikeCheckState extends HomeScreenState{}