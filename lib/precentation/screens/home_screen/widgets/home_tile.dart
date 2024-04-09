import 'package:flavorfusion/constants/colors.dart';
import 'package:flavorfusion/data/temp_value_holder.dart';
import 'package:flavorfusion/precentation/screens/commant_screen/comment_screen_ui.dart';
import 'package:flavorfusion/precentation/screens/home_screen/bloc/home_screen_bloc.dart';
import 'package:flavorfusion/precentation/screens/home_screen/bloc/home_screen_event.dart';
import 'package:flavorfusion/precentation/screens/home_screen/bloc/home_screen_state.dart';
import 'package:flavorfusion/precentation/screens/saved_recipies/bloc/saved_recipes_bloc.dart';
import 'package:flavorfusion/precentation/screens/saved_recipies/bloc/saved_recipes_event.dart';
import 'package:flavorfusion/precentation/style_manager/text_style_manager.dart';
import 'package:flavorfusion/precentation/widgets/image_place_holder_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:cached_network_image/cached_network_image.dart';

Widget homeTile(
    BuildContext context,
    String src,
    String title,
    String postedBy,
    double screenWidth,
    bool isLiked,
    bool isWishList,
    String docId,
    int index) {
  return BlocListener<HomeScreenBloc, HomeScreenState>(
    listener: (context, state) {
      print(hcomments.length.toString() + 'comment');
      if (state is LikeCheckState) {
        context.read<HomeScreenBloc>().add(FechDataFromFirebaseEvent());
        context.read<SavedRecipesBloc>().add(LoadDataInSavedRecipieEvent());
      }
    },
    child: Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: AspectRatio(
        aspectRatio: 1 / 0.54,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(screenWidth * 0.03),
          child: Container(
            padding: EdgeInsets.all(10),
            height: 100,
            color: baseColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'by - ' + postedBy.replaceAll('@gmail.com', ''),
                  style: titleSmallTextStyle(screenWidth),
                ),
                SizedBox(
                  height: screenWidth * 0.02,
                ),
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(screenWidth * 0.02),
                      child: Container(
                        width: screenWidth * 0.3,
                        height: screenWidth * 0.2,
                        color: baseColor,
                        child: CachedNetworkImage(
                            imageUrl: src,
                            placeholder: (context, url) =>
                                imagePlaceHolderText(screenWidth)),
                      ),
                    ),
                    SizedBox(
                      width: screenWidth * 0.03,
                    ),
                    Expanded(
                      child: Text(
                        overflow: TextOverflow.ellipsis,
                        title,
                        style: TextStyle(
                            color: secondaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: screenWidth * 0.04),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: screenWidth * 0.02,
                ),
                Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    isLiked == true
                        ? Row(
                            children: [
                              IconButton(
                                  onPressed: () {
                                    context.read<HomeScreenBloc>().add(
                                        DislikeButtonClickedEvent(
                                            docId: docId, user: huser!));
                                  },
                                  icon: SvgPicture.asset(
                                    'Assets/thumbs-up-solid.svg',
                                    color: secondaryColor,
                                    width: screenWidth * 0.06,
                                  )),
                              Text(
                                hrecipies[index].likes.length.toString(),
                                style: titleSmallTextStyle(screenWidth),
                              )
                            ],
                          )
                        : Row(
                            children: [
                              IconButton(
                                  onPressed: () {
                                    context.read<HomeScreenBloc>().add(
                                        LikeButtonClickedEvent(
                                            docId: docId, user: huser!));
                                  },
                                  icon: SvgPicture.asset(
                                    'Assets/thumbs-up-solid.svg',
                                    color: primaryColor,
                                    width: screenWidth * 0.06,
                                  )),
                              Text(
                                hrecipies[index].likes.length.toString(),
                                style: titleSmallTextStyle(screenWidth),
                              )
                            ],
                          ),
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => CommentScreenUI(
                                            docId: hrecipies[index].docId,
                                            title: hrecipies[index].recipeTitle,
                                          )));
                            },
                            icon: SvgPicture.asset(
                              'Assets/comment-solid.svg',
                              color: primaryColor,
                              width: screenWidth * 0.06,
                            )),
                        Text(
                          hrecipies[index].commentCount != null
                              ? hrecipies[index].commentCount.toString()
                              : '0',
                          style: titleSmallTextStyle(screenWidth),
                        )
                      ],
                    ),
                    isWishList == true
                        ? IconButton(
                            onPressed: () {
                              context.read<HomeScreenBloc>().add(
                                  RemoveWishListClickedEvent(
                                      docId: docId, user: huser!));
                            },
                            icon: SvgPicture.asset(
                              'Assets/heart-solid.svg',
                              color: secondaryColor,
                              width: screenWidth * 0.06,
                            ))
                        : IconButton(
                            onPressed: () {
                              context.read<HomeScreenBloc>().add(
                                  WishListClickedEvent(
                                      docId: docId, user: huser!));
                            },
                            icon: SvgPicture.asset(
                              'Assets/heart-solid.svg',
                              color: primaryColor,
                              width: screenWidth * 0.06,
                            )),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
