import 'package:flavorfusion/constants/colors.dart';
import 'package:flutter/material.dart';

Widget ingredientTextField(TextEditingController controller) {
  return TextField(
    controller: controller,
    keyboardType: TextInputType.phone,
    style: TextStyle(color: secondaryColor),
    cursorColor: acsentColor,
    decoration: InputDecoration(
        enabledBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: secondaryColor)),
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: secondaryColor))),
  );
}