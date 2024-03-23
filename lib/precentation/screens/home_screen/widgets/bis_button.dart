import 'package:flavorfusion/constants/colors.dart';
import 'package:flavorfusion/precentation/screens/home_screen/bloc/home_screen_bloc.dart';
import 'package:flavorfusion/precentation/screens/home_screen/bloc/home_screen_event.dart';
import 'package:flavorfusion/precentation/style_manager/text_style_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Widget bisButton(
  BuildContext context,
  double screenWidth,
  String text,
  String query,
  int index, {
  bool? isCancelButton,
  bool isSelected = false,
}) {
  return GestureDetector(
    onTap: () {
      context.read<HomeScreenBloc>().add(CategorySearchEvent(query: query,index: index));
      // context
      //     .read<HomeScreenBloc>()
      //     .add(SelectFilterClickedEvent(index: index));
      // Navigator.pop(context);
    },
    child: ClipRRect(
      borderRadius: BorderRadius.circular(screenWidth * 0.5),
      child: Container(
        color: isCancelButton == null ? secondaryColor : primaryColor,
        // height: screenWidth * 0.05,
        // width: screenWidth * 0.05,
        child: Center(
          child: Text(text,
              style: isCancelButton == null
                  ? isSelected == false
                      ? titleSmallTextStyle(screenWidth).copyWith(
                          color: primaryColor, fontWeight: FontWeight.bold)
                      : titleSmallTextStyle(screenWidth)
                  : titleSmallTextStyle(screenWidth).copyWith(
                      color: secondaryColor, fontWeight: FontWeight.bold)),
        ),
      ),
    ),
  );
}
