import 'package:flavorfusion/precentation/style_manager/text_style_manager.dart';
import 'package:flutter/material.dart';

Widget settingButtons(double screenWidth, String text) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: screenWidth * 0.03),
    child: GestureDetector(
      onTap: () {},
      child: Text(
        text,
        style: titleSmallTextStyle(screenWidth),
      ),
    ),
  );
}
