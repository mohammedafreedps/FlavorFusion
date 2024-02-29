

import 'package:bloc/bloc.dart';
import 'package:flavorfusion/data/temp_value_holder.dart';
import 'package:flavorfusion/precentation/screens/create_ingredients_screen/bloc/create_ingredients_count_event.dart';
import 'package:flavorfusion/precentation/screens/create_ingredients_screen/bloc/create_ingredients_count_state.dart';


class CreateIngredientsCountBloc extends Bloc<CreateIngredientsCountEvent, CreateIngredientsCountState> {
  final valueHolder = ValueHolder();
  CreateIngredientsCountBloc() : super(CreateIngredientsCountInitial()) {
    on<CreateIngredientsCountEvent>((event, emit) {
      
    });
    on<AddIngredientAndQuantityButtonClickedEvent>((event, emit) {
      valueHolder.createdIngredents .add(event.ingredients);
      valueHolder.createdQuantitys .add(event.quantity);
      emit(ShowIngredientAndQuantityState(ingredients: valueHolder.createdIngredents,quantitys: valueHolder.createdQuantitys));
    });

    on<DeleteIngredientButtonClickedEvent>((event, emit) {
      valueHolder.createdIngredents.removeAt(event.index);
      valueHolder.createdQuantitys.removeAt(event.index);
      emit(ShowIngredientAndQuantityState(ingredients: valueHolder.createdIngredents, quantitys: valueHolder.createdQuantitys));
    });
  }
}
