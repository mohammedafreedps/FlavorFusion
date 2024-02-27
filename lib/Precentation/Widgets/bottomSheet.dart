import 'package:flavorfusion/Constants/colors.dart';
import 'package:flavorfusion/Precentation/styleManager/textStyleManager.dart';
import 'package:flutter/material.dart';

Future bottomSheet(String message, BuildContext context, double screenWidth,double screenHeight){
  return showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return Container(
                    height: screenHeight * 0.07,
                    width: screenWidth,
                    color: baseColor,
                    child: Center(
                        child: Text(
                            message,style: titleSmallTextStyle(screenWidth),)));
              });
}