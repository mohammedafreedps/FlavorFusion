import 'package:flavorfusion/precentation/style_manager/text_style_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

Widget texts(double screenWidth, String texts) {
  return Column(
    children: [
      Text(
        texts,
        style: titleSmallTextStyle(screenWidth),
      ).animate(effects: [
        FadeEffect(curve: Curves.decelerate),
        SlideEffect(curve: Curves.decelerate),
      ])
    ],
  );
}
