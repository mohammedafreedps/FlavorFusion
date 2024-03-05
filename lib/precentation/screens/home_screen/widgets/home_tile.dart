import 'package:flavorfusion/constants/colors.dart';
import 'package:flavorfusion/precentation/style_manager/text_style_manager.dart';
import 'package:flutter/material.dart';

Widget homeTile(
    String src, String title, String postedBy, double screenWidth) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 10),
    child: AspectRatio(
      aspectRatio: 1 / 1.1,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(screenWidth * 0.06),
        child: Container(
          padding: EdgeInsets.all(30),
          height: 100,
          color: baseColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'by - ' + postedBy.replaceAll('@gmail.com', ''),
                style: titleSmallTextStyle(screenWidth),
              ),
              AspectRatio(
                aspectRatio: 1.2,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(screenWidth * 0.06),
                  child: Container(
                    color: baseColor,
                    child: Image.network(
                      src,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Text(
                overflow: TextOverflow.ellipsis,
                title,
                style: TextStyle(
                    color: secondaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: screenWidth * 0.04),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}