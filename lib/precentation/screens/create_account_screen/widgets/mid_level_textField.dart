import 'package:flavorfusion/constants/colors.dart';
import 'package:flutter/material.dart';

Widget midLevelTextField(String text, double screenWidth, bool isTextObscure,
    TextEditingController controller) {
  return Column(
    children: [
      Text(
        text,
        style: TextStyle(
            color: secondaryColor,
            fontWeight: FontWeight.w300,
            fontSize: screenWidth * 0.04),
      ),
      TextField(
        controller: controller,
        keyboardType: TextInputType.emailAddress,
        obscureText: isTextObscure,
        style: TextStyle(color: baseColor),
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