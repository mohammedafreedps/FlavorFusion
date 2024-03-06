

import 'package:bloc/bloc.dart';
import 'package:flavorfusion/data/temp_value_holder.dart';
import 'package:flavorfusion/precentation/screens/create_ingredients_screen/bloc/create_ingredients_event.dart';
import 'package:flavorfusion/precentation/screens/create_ingredients_screen/bloc/create_ingredients_state.dart';


class CreateIngredientsCountBloc extends Bloc<CreateIngredientsCountEvent, CreateIngredientsCountState> {
  // final valueHolder = ValueHolder();
  CreateIngredientsCountBloc() : super(CreateIngredientsCountInitial()) {
    on<CreateIngredientsCountEvent>((event, emit) {
      
    });
    on<AddIngredientAndQuantityButtonClickedEvent>((event, emit) {
      hcreatedIngredents .add(event.ingredients);
      hcreatedQuantitys .add(event.quantity);
      emit(ShowIngredientAndQuantityState(ingredients: hcreatedIngredents,quantitys: hcreatedQuantitys));
    });

    on<DeleteIngredientButtonClickedEvent>((event, emit) {
      hcreatedIngredents.removeAt(event.index);
      hcreatedQuantitys.removeAt(event.index);
      emit(ShowIngredientAndQuantityState(ingredients: hcreatedIngredents, quantitys: hcreatedQuantitys));
    });

    on<EditIngredientsAndQuantityEvent>((event, emit) {
      hcreatedIngredents = event.ingredient;
      hcreatedQuantitys = event.quantity;
      emit(EditIngredientsAndQuantityState(ingredient: hcreatedIngredents, quantity: hcreatedQuantitys));
    });
  }
}
