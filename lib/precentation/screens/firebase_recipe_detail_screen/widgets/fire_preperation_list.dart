import 'package:flavorfusion/constants/colors.dart';
import 'package:flavorfusion/precentation/style_manager/text_style_manager.dart';
import 'package:flutter/material.dart';

List<Widget> firePreparationList(List instructions, double screenWidth) {
  List<Widget> steps = [];

  for (int i = 0; i < instructions.length; i++) {
    Widget displayStep = ClipRRect(
      borderRadius: BorderRadius.circular(screenWidth * 0.02),
      child: Container(
        width: screenWidth,
        padding: EdgeInsets.all(10),
        color: baseColor,
        child: Text(
          'STEP ${i + 1}',
          style:
              titleSmallTextStyle(screenWidth).copyWith(color: secondaryColor),
        ),
      ),
    );
    steps.add(displayStep);
    steps.add(SizedBox(
      height: screenWidth * 0.03,
    ));
    displayStep = ClipRRect(
      borderRadius: BorderRadius.circular(screenWidth * 0.01),
      child: Container(
        width: screenWidth,
        padding: EdgeInsets.all(10),
        color: baseColor,
        child: Text(
          instructions[i],
          style:
              titleSmallTextStyle(screenWidth).copyWith(color: secondaryColor),
        ),
      ),
    );
    steps.add(displayStep);
    steps.add(SizedBox(
      height: screenWidth * 0.03,
    ));
  }

  return steps;
}