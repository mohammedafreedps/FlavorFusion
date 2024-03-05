import 'package:flavorfusion/constants/colors.dart';
import 'package:flavorfusion/precentation/screens/create_ingredients_screen/bloc/create_ingredients_bloc.dart';
import 'package:flavorfusion/precentation/screens/create_ingredients_screen/bloc/create_ingredients_event.dart';
import 'package:flavorfusion/precentation/style_manager/text_style_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Widget enteredIngredientsAndQuantity(BuildContext context, int index,
    String ing, String qan, double screenWidth) {
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            ing,
            style: titleSmallTextStyle(screenWidth),
          ),
          Text(
            qan,
            style: titleSmallTextStyle(screenWidth),
          ),
          IconButton(
              onPressed: () {
                context
                    .read<CreateIngredientsCountBloc>()
                    .add(DeleteIngredientButtonClickedEvent(index: index));
              },
              icon: Icon(
                Icons.delete,
                color: secondaryColor,
              ))
        ],
      ),
      const Divider()
    ],
  );
}