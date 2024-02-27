import 'package:flavorfusion/Constants/colors.dart';
import 'package:flutter/material.dart';


TextStyle appBarTextStyle(){
  return TextStyle(
    color: secondaryColor, fontWeight: FontWeight.bold
  );
}

TextStyle titleLargeBoldTextStyle(double screenWidth) {
  return TextStyle(
      color: secondaryColor,
      fontWeight: FontWeight.bold,
      fontSize: screenWidth * 0.1);
}

TextStyle titleMidiumTextStyle(double screenWidth) {
  return TextStyle(
      color: secondaryColor,
      fontWeight: FontWeight.w300,
      fontSize: screenWidth * 0.04);
}

TextStyle titleSmallTextStyle(double screenWidth) {
  return TextStyle(
      color: acsentColor,
      fontWeight: FontWeight.w300,
      fontSize: screenWidth * 0.03);
}
