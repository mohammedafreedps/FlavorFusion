
sealed class CreateIngredientsCountEvent {}

class AddIngredientAndQuantityButtonClickedEvent extends CreateIngredientsCountEvent {
  String ingredients;
  String quantity;
  AddIngredientAndQuantityButtonClickedEvent({required this.ingredients, required this.quantity});
}

class DeleteIngredientButtonClickedEvent extends CreateIngredientsCountEvent{
  int index;
  DeleteIngredientButtonClickedEvent({required this.index});
}

class EditIngredientsAndQuantityEvent extends CreateIngredientsCountEvent{
  List<String> ingredient;
  List<String> quantity;
  EditIngredientsAndQuantityEvent({required this.ingredient,required this.quantity});
}