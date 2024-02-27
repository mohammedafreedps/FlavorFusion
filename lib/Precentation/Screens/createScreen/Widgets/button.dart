import 'package:flavorfusion/Constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

Widget button({required BuildContext context, required double screenWidth, required String text,required Widget page}) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(70),
    child: GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context)=>page));
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
