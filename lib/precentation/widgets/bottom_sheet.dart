import 'package:flavorfusion/constants/colors.dart';
import 'package:flavorfusion/precentation/style_manager/text_style_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

Future bottomSheet(String message, BuildContext context, double screenWidth,
    double screenHeight) {
  return showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
            height: screenHeight * 0.07,
            width: screenWidth,
            color: baseColor,
            child: Center(
                child: Text(
              message,
              style: titleSmallTextStyle(screenWidth),
            )));
      });
}
