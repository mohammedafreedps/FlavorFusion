import 'package:flavorfusion/constants/colors.dart';
import 'package:flavorfusion/data/temp_value_holder.dart';
import 'package:flavorfusion/precentation/screens/commant_screen/bloc/comment_bloc.dart';
import 'package:flavorfusion/precentation/screens/commant_screen/bloc/comment_event.dart';
import 'package:flavorfusion/precentation/screens/commant_screen/function/dateFormatter.dart';
import 'package:flavorfusion/precentation/style_manager/text_style_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Widget commentTile(BuildContext context, int index, double screenWidth,
    String user, String comment, String docId, String commentId, DateTime dateTime) {
  return Padding(
    padding: EdgeInsets.only(bottom: screenWidth * 0.02),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(screenWidth * 0.05),
      child: Container(
        color: baseColor,
        padding: EdgeInsets.all(screenWidth * 0.05),
        width: screenWidth,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  user.replaceAll('@gmail.com', ''),
                  style: titleSmallTextStyle(screenWidth),
                ),
                Text(
                  ' . ',
                  style: titleSmallTextStyle(screenWidth),
                ),
                Text(
                  dateFormatter(date: dateTime),
                  style: titleSmallTextStyle(screenWidth),
                ),
              ],
            ),
            SizedBox(
              height: screenWidth * 0.05,
            ),
            Text(
              comment,
              style: titleSmallTextStyle(screenWidth)
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            user == huser!.email
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      PopupMenuButton(
                          onSelected: (value) {
                            if (value == 0) {
                              context.read<CommentBloc>().add(
                                  DeleteCommentButtonClikedEvent(
                                      docId: docId, commentId: commentId));
                            }
                          },
                          iconColor: secondaryColor,
                          color: secondaryColor,
                          itemBuilder: (context) =>
                              [PopupMenuItem(value: 0, child: Text('Delete'))])
                    ],
                  )
                : Text('')
          ],
        ),
      ),
    ),
  );
}
