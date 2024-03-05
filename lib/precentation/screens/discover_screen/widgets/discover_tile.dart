import 'package:flavorfusion/constants/colors.dart';
import 'package:flutter/material.dart';

Widget discoverTile(String src, String title, double screenWidth) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 10),
    child: AspectRatio(
      aspectRatio: 1 / 1,
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
