import 'package:cached_network_image/cached_network_image.dart';
import 'package:flavorfusion/constants/colors.dart';
import 'package:flavorfusion/precentation/widgets/image_place_holder_text.dart';
import 'package:flutter/material.dart';

Widget discoverTile(int index, String src, String title, double screenWidth) {
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
                      child: CachedNetworkImage(
                        fit: BoxFit.cover,
                        imageUrl: src,
                        placeholder: (context, url) =>
                            imagePlaceHolderText(screenWidth),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      )),
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
