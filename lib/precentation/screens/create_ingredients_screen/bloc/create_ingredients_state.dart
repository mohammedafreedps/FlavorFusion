sealed class CreateIngredientsCountState {}

final class CreateIngredientsCountInitial extends CreateIngredientsCountState {}

class ShowIngredientAndQuantityState extends CreateIngredientsCountState {
  List ingredients;
  List quantitys;
  ShowIngredientAndQuantityState(
      {required this.ingredients, required this.quantitys});
}

class EditIngredientsAndQuantityState extends CreateIngredientsCountState {
  List ingredient;
  List quantity;
  EditIngredientsAndQuantityState(
      {required this.ingredient, required this.quantity});
}
