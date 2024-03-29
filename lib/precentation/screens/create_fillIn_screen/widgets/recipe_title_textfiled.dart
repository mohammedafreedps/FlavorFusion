import 'package:flavorfusion/precentation/screens/create_fillIn_screen/widgets/create_text_field.dart';
import 'package:flavorfusion/precentation/style_manager/text_style_manager.dart';
import 'package:flutter/material.dart';

Widget recipeTileTextfield(
    TextEditingController recipeTitleController, double screenWidth) {
  return Column(
    children: [
      Text(
        'Recipe Title',
        style: titleMidiumTextStyle(screenWidth),
      ),
      createTextField(recipeTitleController),
    ],
  );
}
