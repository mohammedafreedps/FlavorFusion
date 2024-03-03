
import 'package:flavorfusion/data/repository/recipe_from_firebase_model.dart';

sealed class ActivityEvent {}

class SortAndSetValueEvent extends ActivityEvent{}

class DeletePostButtonClickedEvent extends ActivityEvent{
  List<RecipeFromFireBaseModel> recipes;
  int index;
  DeletePostButtonClickedEvent({required this.index,required this.recipes});
}
