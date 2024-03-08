
sealed class SavedRecipesState {}

final class SavedRecipesInitial extends SavedRecipesState {}

class SavedRecipesListState extends SavedRecipesState{
  List savedRecipes;
  SavedRecipesListState({required this.savedRecipes});
}

class RemovedSavedRecipeState extends SavedRecipesState{}