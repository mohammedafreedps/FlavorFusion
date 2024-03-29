import 'package:flavorfusion/precentation/screens/create_ingredients_screen/bloc/create_ingredients_bloc.dart';
import 'package:flavorfusion/precentation/screens/create_ingredients_screen/bloc/create_ingredients_state.dart';
import 'package:flavorfusion/precentation/screens/create_ingredients_screen/widgets/entered_ingredients_and_quantity.dart';
import 'package:flavorfusion/precentation/style_manager/text_style_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Widget ingredientsVisible(bool isIngredientsVisible, double screenWidht) {
  return Visibility(
    visible: isIngredientsVisible,
    child: SizedBox(
      height: screenWidht * 0.5,
      child:
          BlocBuilder<CreateIngredientsCountBloc, CreateIngredientsCountState>(
        builder: (context, state) {
          if (state is ShowIngredientAndQuantityState) {
            return ListView.builder(
                itemCount: state.ingredients.length,
                itemBuilder: ((context, index) {
                  return enteredIngredientsAndQuantity(
                      context,
                      index,
                      state.ingredients[index],
                      state.quantitys[index],
                      screenWidht);
                }));
          }
          if (state is EditIngredientsAndQuantityState) {
            return ListView.builder(
                itemCount: state.ingredient.length,
                itemBuilder: ((context, index) {
                  return enteredIngredientsAndQuantity(
                      context,
                      index,
                      state.ingredient[index],
                      state.quantity[index],
                      screenWidht);
                }));
          }
          return ListView.builder(
              itemCount: 1,
              itemBuilder: (BuildContext context, intex) {
                return Center(
                    child: Text(
                  'Nothing added',
                  style: titleSmallTextStyle(screenWidht),
                ));
              });
        },
      ),
    ),
  );
}
