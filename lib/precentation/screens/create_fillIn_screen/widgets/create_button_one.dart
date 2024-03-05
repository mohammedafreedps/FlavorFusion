import 'package:flavorfusion/constants/colors.dart';
import 'package:flutter/material.dart';

Widget createButtonOne(String text, BuildContext context, double screenWidth,
    {Function? function}) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(70),
    child: GestureDetector(
      onTap: () {
        if (function != null) {
          function();
        }
      },
      child: Container(
        width: screenWidth * 0.3,
        height: screenWidth * 0.12,
        color: baseColor,
        child: Center(
            child: Text(
          text,
          style: TextStyle(
              color: acsentColor,
              fontSize: screenWidth * 0.04,
              fontWeight: FontWeight.w400),
        )),
      ),
    ),
  );
}