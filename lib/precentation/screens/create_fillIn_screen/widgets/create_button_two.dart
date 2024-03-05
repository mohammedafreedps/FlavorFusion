import 'package:flavorfusion/constants/colors.dart';
import 'package:flutter/material.dart';

Widget createButtonTwo(String text, BuildContext context, double screenWidth,
    {Widget? page}) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(70),
    child: GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => page!));
      },
      child: Container(
        width: screenWidth * 0.4,
        height: screenWidth * 0.12,
        color: baseColor,
        child: Center(
            child: Text(
          text,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: acsentColor,
              fontSize: screenWidth * 0.04,
              fontWeight: FontWeight.w400),
        )),
      ),
    ),
  );
}