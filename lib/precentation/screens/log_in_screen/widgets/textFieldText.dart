
import 'package:flavorfusion/constants/colors.dart';
import 'package:flavorfusion/precentation/style_manager/text_style_manager.dart';
import 'package:flutter/material.dart';

Widget midLevelTextField(String text, double screenWidth, bool isTextObscure,
    TextEditingController controller) {
  return Column(
    children: [
      Text(text, style: titleMidiumTextStyle(screenWidth)),
      TextField(
        controller: controller,
        keyboardType: TextInputType.emailAddress,
        obscureText: isTextObscure,
        style: TextStyle(color: secondaryColor),
        cursorColor: baseColor,
        decoration: InputDecoration(
            enabledBorder:
                UnderlineInputBorder(borderSide: BorderSide(color: baseColor)),
            focusedBorder:
                UnderlineInputBorder(borderSide: BorderSide(color: baseColor))),
      )
    ],
  );
}