import 'package:flavorfusion/precentation/style_manager/text_style_manager.dart';
import 'package:flutter/material.dart';

Widget imagePlaceHolderText(double screenWidth) {
  return Center(
    child: Text(
      'Loading....',
      style: titleSmallTextStyle(screenWidth),
    ),
  );
}
