import 'package:flavorfusion/constants/colors.dart';
import 'package:flavorfusion/data/repository/recipe_from_firebase_model.dart';
import 'package:flavorfusion/data/temp_value_holder.dart';
import 'package:flavorfusion/precentation/screens/activity_screen/bloc/activity_bloc.dart';
import 'package:flavorfusion/precentation/screens/activity_screen/bloc/activity_event.dart';
import 'package:flavorfusion/precentation/screens/create_fillIn_screen/create_fIllin_screen_ui.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flavorfusion/precentation/screens/firebase_recipe_detail_screen/firebase_recipe_detail_screen.dart';
import 'package:flavorfusion/precentation/style_manager/text_style_manager.dart';
import 'package:flavorfusion/precentation/widgets/image_place_holder_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

Widget activityTile(BuildContext context, double screenWidth, String src,
    String title, int index, List<RecipeFromFireBaseModel> recipes) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => FirebaseRecipeDetailScreenUI(
                  index: index, listOfItem: hposterRecipes)));
    },
    child: Padding(
      padding: EdgeInsets.only(bottom: screenWidth * 0.05),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(screenWidth * 0.05),
        child: Container(
          padding: EdgeInsets.all(screenWidth * 0.03),
          color: baseColor,
          width: double.infinity,
          height: screenWidth * 0.41,
          child: Column(
            children: [
              Row(
                children: [
                  SizedBox(
                    width: screenWidth * 0.3,
                    height: screenWidth * 0.3 / 1.3,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(screenWidth * 0.06),
                        child: CachedNetworkImage(
                            imageUrl: src,
                            placeholder: (context, url) =>
                                imagePlaceHolderText(screenWidth))),
                  ),
                  SizedBox(
                    width: screenWidth * 0.02,
                  ),
                  Text(
                    overflow: TextOverflow.ellipsis,
                    title,
                    style: titleSmallTextStyle(screenWidth)
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 10,
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Stack(
                    children: [
                      SvgPicture.asset(
                        'Assets/thumbs-up-solid.svg',
                        color: secondaryColor,
                        width: screenWidth * 0.06,
                      ),
                      Positioned(
                          top: screenWidth * 0.025,
                          left: screenWidth * 0.03,
                          child: Text(
                            hrecipies[index].likes.length.toString(),
                            style: titleSmallTextStyle(screenWidth).copyWith(
                                fontSize: screenWidth * 0.02,
                                color: primaryColor),
                          ))
                    ],
                  ),
                  Stack(
                    children: [
                      SvgPicture.asset(
                        'Assets/comment-solid.svg',
                        color: secondaryColor,
                        width: screenWidth * 0.06,
                      ),
                      Positioned(
                          top: screenWidth * 0.014,
                          left: screenWidth * 0.024,
                          child: Text(
                            hrecipies[index].commentCount.toString(),
                            style: titleSmallTextStyle(screenWidth).copyWith(
                                fontSize: screenWidth * 0.02,
                                color: primaryColor),
                          ))
                    ],
                  ),
                  PopupMenuButton(
                      onSelected: (String value) {
                        if (value == '0') {
                          context.read<ActivityBloc>().add(
                              DeletePostButtonClickedEvent(
                                  index: index, recipes: recipes));
                        }
                        if (value == '1') {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CreateFIllinScreenUI(
                                        index: index,
                                        isEditing: true,
                                      )));
                        }
                      },
                      color: secondaryColor,
                      iconColor: secondaryColor,
                      itemBuilder: (BuildContext context) {
                        return <PopupMenuEntry<String>>[
                          PopupMenuItem<String>(
                            value: '1',
                            child: Text('Edit'),
                          ),
                          PopupMenuItem<String>(
                            value: '0',
                            child: Text('Delete'),
                          ),
                        ];
                      }),
                ],
              )
            ],
          ),
        ),
      ),
    ),
  );
}
