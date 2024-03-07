import 'package:flavorfusion/constants/colors.dart';
import 'package:flavorfusion/data/temp_value_holder.dart';
import 'package:flavorfusion/precentation/screens/home_screen/bloc/home_screen_bloc.dart';
import 'package:flavorfusion/precentation/screens/home_screen/bloc/home_screen_event.dart';
import 'package:flavorfusion/precentation/screens/home_screen/bloc/home_screen_state.dart';
import 'package:flavorfusion/precentation/style_manager/text_style_manager.dart';
import 'package:flavorfusion/precentation/widgets/image_place_holder_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:cached_network_image/cached_network_image.dart';

Widget homeTile(BuildContext context, String src, String title, String postedBy,
    double screenWidth, bool isLiked, String docId) {
  return BlocListener<HomeScreenBloc, HomeScreenState>(
    listener: (context, state) {
      print('$state statessss'.toString());
      if (state is LikeCheckState) {
        context.read<HomeScreenBloc>().add(FechDataFromFirebaseEvent());
      }
    },
    child: Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: AspectRatio(
        aspectRatio: 1 / 0.62,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(screenWidth * 0.03),
          child: Container(
            padding: EdgeInsets.all(10),
            height: 100,
            color: baseColor,
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                SizedBox(
                  height: screenWidth * 0.02,
                ),
                Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    isLiked == true
                        ? IconButton(
                            onPressed: () {
                              context.read<HomeScreenBloc>().add(
                                  DislikeButtonClickedEvent(
                                      docId: docId, user: user!));
                            },
                            icon: SvgPicture.asset(
                              'Assets/thumbs-up-solid.svg',
                              color: secondaryColor,
                              width: screenWidth * 0.06,
                            ))
                        : IconButton(
                            onPressed: () {
                              context.read<HomeScreenBloc>().add(
                                  LikeButtonClickedEvent(
                                      docId: docId, user: user!));
                            },
                            icon: SvgPicture.asset(
                              'Assets/thumbs-up-solid.svg',
                              color: primaryColor,
                              width: screenWidth * 0.06,
                            )),
                    IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset(
                          'Assets/comment-solid.svg',
                          color: primaryColor,
                          width: screenWidth * 0.06,
                        )),
                    IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset(
                          'Assets/heart-solid.svg',
                          color: primaryColor,
                          width: screenWidth * 0.06,
                        ))
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
