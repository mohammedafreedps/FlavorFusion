import 'package:flavorfusion/constants/colors.dart';
import 'package:flavorfusion/data/repository/recipe_from_firebase_model.dart';
import 'package:flavorfusion/precentation/screens/activity_screen/bloc/activity_bloc.dart';
import 'package:flavorfusion/precentation/screens/activity_screen/bloc/activity_event.dart';
import 'package:flavorfusion/precentation/style_manager/text_style_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future deleteAlertDialog(BuildContext context, int index,
    List<RecipeFromFireBaseModel> recipes, double screenWidth) {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: baseColor,
          content: Text(
            'Do you really want to delete this post',
            style: titleMidiumTextStyle(screenWidth),
          ),
          actions: [
            TextButton(
                onPressed: () {
                  context.read<ActivityBloc>().add(DeletePostButtonClickedEvent(
                      index: index, recipes: recipes));
                  Navigator.pop(context);
                },
                child: Text(
                  'Yes',
                  style: titleSmallTextStyle(screenWidth)
                      .copyWith(fontWeight: FontWeight.bold),
                )),
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'No',
                  style: titleSmallTextStyle(screenWidth)
                      .copyWith(fontWeight: FontWeight.bold),
                ))
          ],
        );
      });
}
