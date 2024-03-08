import 'package:flavorfusion/constants/colors.dart';
import 'package:flavorfusion/precentation/style_manager/text_style_manager.dart';
import 'package:flutter/material.dart';

Widget commentTile(double screenWidth, String user, String comment) {
  return Padding(
    padding: EdgeInsets.only(bottom: screenWidth * 0.02),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(screenWidth * 0.05),
      child: Container(
        color: baseColor,
        padding: EdgeInsets.all(screenWidth * 0.05),
        width: screenWidth,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              user.replaceAll('@gmail.com', ''),
              style: titleSmallTextStyle(screenWidth),
            ),
            SizedBox(height: screenWidth * 0.05,),
            Text(
              comment,
              style: titleSmallTextStyle(screenWidth).copyWith(fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    ),
  );
}
