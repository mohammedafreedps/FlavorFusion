import 'package:flavorfusion/constants/colors.dart';
import 'package:flavorfusion/data/temp_value_holder.dart';
import 'package:flavorfusion/precentation/screens/commant_screen/bloc/comment_bloc.dart';
import 'package:flavorfusion/precentation/screens/commant_screen/bloc/comment_event.dart';
import 'package:flavorfusion/precentation/screens/commant_screen/function/dateFormatter.dart';
import 'package:flavorfusion/precentation/style_manager/text_style_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Widget commentTile(
    BuildContext context,
    int index,
    double screenWidth,
    String user,
    String comment,
    String docId,
    String commentId,
    DateTime dateTime) {
  return GestureDetector(
    onLongPress: () {
      if (user == huser!.email) {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                backgroundColor: baseColor,
                content: Text('Do you really want to delete the comment',style: titleMidiumTextStyle(screenWidth),),
                actions: [
                  TextButton(
                      onPressed: () {
                        context.read<CommentBloc>().add(
                            DeleteCommentButtonClikedEvent(
                                docId: docId, commentId: commentId));
                      },
                      child: Text('Delete',style: titleMidiumTextStyle(screenWidth))),
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('Cancel',style: titleMidiumTextStyle(screenWidth)))
                ],
              );
            });
      }
    },
    child: Container(
      // color: baseColor,
      padding: EdgeInsets.only(bottom: screenWidth * 0.03),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
              text: TextSpan(
                  style: titleSmallTextStyle(screenWidth)
                      .copyWith(color: secondaryColor),
                  children: [
                TextSpan(
                    text: user.replaceAll('@gmail.com', '') + '  ',
                    style: titleSmallTextStyle(screenWidth).copyWith(
                        color: secondaryColor, fontWeight: FontWeight.bold)),
                TextSpan(
                    text: comment,
                    style: titleSmallTextStyle(screenWidth).copyWith(
                        color: secondaryColor, fontSize: screenWidth * 0.034))
              ])),
        Padding(
          padding: EdgeInsets.only(top:8.0),
          child: Text(dateFormatter(date: dateTime),style: titleSmallTextStyle(screenWidth).copyWith(fontSize: screenWidth * 0.02),),
        )
        ],
      ),
    ),
  );
}
