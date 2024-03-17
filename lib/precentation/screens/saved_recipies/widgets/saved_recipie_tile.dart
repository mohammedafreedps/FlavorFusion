import 'package:flavorfusion/constants/colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flavorfusion/data/temp_value_holder.dart';
import 'package:flavorfusion/precentation/screens/firebase_recipe_detail_screen/firebase_recipe_detail_screen.dart';
import 'package:flavorfusion/precentation/screens/saved_recipies/bloc/saved_recipes_bloc.dart';
import 'package:flavorfusion/precentation/screens/saved_recipies/bloc/saved_recipes_event.dart';
import 'package:flavorfusion/precentation/style_manager/text_style_manager.dart';
import 'package:flavorfusion/precentation/widgets/image_place_holder_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

Widget saverRecipeTile(BuildContext context, double screenWidth, String src,
    String title, int index, String docId) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => FirebaseRecipeDetailScreenUI(
                  index: index, listOfItem: hsavedRecipes)));
    },
    child: Padding(
      padding: EdgeInsets.only(bottom: screenWidth * 0.05),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(screenWidth * 0.05),
        child: Container(
          padding: EdgeInsets.all(screenWidth * 0.03),
          color: baseColor,
          width: double.infinity,
          height: screenWidth * 0.31,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: screenWidth * 0.3,
                        height: screenWidth * 0.3 / 1.3,
                        child: ClipRRect(
                            borderRadius:
                                BorderRadius.circular(screenWidth * 0.06),
                            child: CachedNetworkImage(
                                imageUrl: src,
                                placeholder: (context, url) =>
                                    imagePlaceHolderText(screenWidth))),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        overflow: TextOverflow.ellipsis,
                        title,
                        style: titleSmallTextStyle(screenWidth)
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  IconButton(
                      onPressed: () {
                        context.read<SavedRecipesBloc>().add(
                            RemoveSavedRecipeButtonClickedEvent(
                                docId: docId, user: huser!));
                      },
                      icon: SvgPicture.asset(
                        'Assets/heart-solid.svg',
                        color: secondaryColor,
                        width: screenWidth * 0.06,
                      ))
                ],
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
