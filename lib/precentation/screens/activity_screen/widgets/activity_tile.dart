import 'package:flavorfusion/constants/colors.dart';
import 'package:flavorfusion/data/repository/recipe_from_firebase_model.dart';
import 'package:flavorfusion/precentation/screens/activity_screen/bloc/activity_bloc.dart';
import 'package:flavorfusion/precentation/screens/activity_screen/bloc/activity_event.dart';
import 'package:flavorfusion/precentation/screens/create_fillIn_screen/create_fIllin_screen_ui.dart';

import 'package:flavorfusion/precentation/style_manager/text_style_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Widget activityTile(BuildContext context, double screenWidth, String src,
    String title, int index, List<RecipeFromFireBaseModel> recipes) {
  return Padding(
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: screenWidth * 0.3,
                  height: screenWidth * 0.3 / 1.3,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(screenWidth * 0.06),
                    child: Image.network(
                      src,
                      fit: BoxFit.cover,
                    ),
                  ),
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
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                PopupMenuButton(
                    onSelected: (String value) {
                      if (value == '0') {
                        context.read<ActivityBloc>().add(
                            DeletePostButtonClickedEvent(
                                index: index, recipes: recipes));
                      }
                      if (value == '1'){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>CreateFIllinScreenUI(index: index,isEditing: true,)));
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
  );
}