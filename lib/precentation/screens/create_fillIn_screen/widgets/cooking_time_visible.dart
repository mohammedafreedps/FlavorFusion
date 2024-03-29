import 'package:flavorfusion/data/temp_value_holder.dart';
import 'package:flavorfusion/precentation/style_manager/text_style_manager.dart';
import 'package:flutter/material.dart';

Widget cookingTimeVisible(bool isCookingTimeVisible, double screenWidht) {
  return Visibility(
    visible: isCookingTimeVisible,
    child: SizedBox(
      height: screenWidht * 0.1,
      child: Text(
        'PrepTime: $hprepTime CookTime: $hcookTime TotalTime: $htotalTime',
        style: titleSmallTextStyle(screenWidht),
      ),
    ),
  );
}
