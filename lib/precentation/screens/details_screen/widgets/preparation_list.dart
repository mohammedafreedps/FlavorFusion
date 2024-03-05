import 'package:flavorfusion/constants/colors.dart';
import 'package:flutter/material.dart';

List<Widget> preparationList(String preparations, double screenWidth) {
  List<Widget> steps = [];
  bool check = false;
  List<String> step = preparations.split('\r\n');
  for (var i = 0; i < step.length; i++) {
    if (check == false) {
      if (step[i].startsWith('STEP')) {
        check = true;
      } else {
        steps.add(ClipRRect(
          borderRadius: BorderRadius.circular(screenWidth * 0.02),
          child: Container(
            width: screenWidth,
            padding: EdgeInsets.all(10),
            color: baseColor,
            child: Text(
              'STEP ' + (i + 1).toString(),
              style: TextStyle(
                  color: secondaryColor,
                  fontWeight: FontWeight.w300,
                  fontSize: screenWidth * 0.03),
            ),
          ),
        ));
        steps.add(SizedBox(height: screenWidth * 0.01));
      }
    }

    if (step[i].isNotEmpty) {
      Widget st = ClipRRect(
        borderRadius: BorderRadius.circular(screenWidth * 0.02),
        child: Container(
          width: screenWidth,
          padding: EdgeInsets.all(10),
          color: baseColor,
          child: Text(
            step[i],
            style: TextStyle(
                color: secondaryColor,
                fontWeight: FontWeight.w300,
                fontSize: screenWidth * 0.03),
          ),
        ),
      );
      steps.add(st);
      steps.add(SizedBox(height: screenWidth * 0.04));
    }
  }

  return steps;
}