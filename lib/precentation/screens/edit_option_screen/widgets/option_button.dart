import 'package:flavorfusion/precentation/style_manager/text_style_manager.dart';
import 'package:flutter/material.dart';

Widget optionButton(
    BuildContext context, String text, double screenWidth, Widget page) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
          context, MaterialPageRoute(builder: (BuildContext context) => page));
    },
    child: Text(
      text,
      style: titleMidiumTextStyle(screenWidth),
    ),
  );
}