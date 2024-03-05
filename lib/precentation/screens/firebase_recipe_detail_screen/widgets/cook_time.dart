import 'package:flavorfusion/constants/colors.dart';
import 'package:flavorfusion/precentation/style_manager/text_style_manager.dart';
import 'package:flutter/material.dart';

Widget cookTime(String title, String time, double screenWidth) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(screenWidth * 0.03),
    child: Container(
      color: baseColor,
      padding: EdgeInsets.all(screenWidth * 0.03),
      child: Column(
        children: [
          Text(
            title,
            style: titleSmallTextStyle(screenWidth)
                .copyWith(color: secondaryColor),
          ),
          Text(
            time,
            style: titleSmallTextStyle(screenWidth)
                .copyWith(color: secondaryColor),
          ),
        ],
      ),
    ),
  );
}