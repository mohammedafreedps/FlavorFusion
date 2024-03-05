import 'package:flavorfusion/constants/colors.dart';
import 'package:flavorfusion/precentation/screens/create_ingredients_screen/bloc/create_ingredients_bloc.dart';
import 'package:flavorfusion/precentation/screens/create_ingredients_screen/bloc/create_ingredients_event.dart';
import 'package:flavorfusion/precentation/style_manager/text_style_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Widget ingredientsAdd(
    BuildContext context,
    double screenWidth,
    TextEditingController ingredientController,
    TextEditingController quantityController) {
  return Column(
    children: [
      AspectRatio(
        aspectRatio: 1 / 1,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(screenWidth * 0.1),
          child: Container(
            color: baseColor,
            width: screenWidth * 0.3,
            height: screenWidth * 0.6,
            child: Padding(
              padding: EdgeInsets.only(
                  left: screenWidth * 0.1, right: screenWidth * 0.1),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Text(
                        'Ingredient',
                        style: titleSmallTextStyle(screenWidth),
                      ),
                      TextField(
                        controller: ingredientController,
                        style: TextStyle(color: primaryColor),
                        cursorColor: primaryColor,
                        decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: primaryColor)),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: primaryColor))),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        'Quantity',
                        style: titleSmallTextStyle(screenWidth),
                      ),
                      TextField(
                        controller: quantityController,
                        style: TextStyle(color: primaryColor),
                        cursorColor: primaryColor,
                        decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: primaryColor)),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: primaryColor))),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                          onPressed: () {
                            if (ingredientController.text.isNotEmpty &&
                                quantityController.text.isNotEmpty) {
                              context.read<CreateIngredientsCountBloc>().add(
                                  AddIngredientAndQuantityButtonClickedEvent(
                                      ingredients: ingredientController.text,
                                      quantity: quantityController.text));
                              ingredientController.text = '';
                              quantityController.text = '';
                            }
                          },
                          icon: Icon(color: secondaryColor, Icons.check)),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      SizedBox(
        height: screenWidth * 0.04,
      )
    ],
  );
}