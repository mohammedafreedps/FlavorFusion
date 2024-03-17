import 'package:flavorfusion/constants/colors.dart';
import 'package:flavorfusion/precentation/screens/home_screen/bloc/home_screen_bloc.dart';
import 'package:flavorfusion/precentation/screens/home_screen/bloc/home_screen_event.dart';
import 'package:flavorfusion/precentation/style_manager/text_style_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Widget bisButton(
    BuildContext context, double screenWidth, String text, String query,
    {bool? isCancelButton}) {
  return GestureDetector(
    onTap: () {
      if (isCancelButton != null && isCancelButton) {
        context.read<HomeScreenBloc>().add(FechDataFromFirebaseEvent());
        Navigator.pop(context);
      } else {
        context.read<HomeScreenBloc>().add(CategorySearchEvent(query: query));
        Navigator.pop(context);
      }
    },
    child: ClipRRect(
      borderRadius: BorderRadius.circular(screenWidth * 0.5),
      child: Container(
        color: isCancelButton == null? secondaryColor : primaryColor ,
        // height: screenWidth * 0.05,
        // width: screenWidth * 0.05,
        child: Center(
          child: Text(
            text,
            style: isCancelButton ==null ? titleSmallTextStyle(screenWidth).copyWith(color: primaryColor,fontWeight: FontWeight.bold) : titleSmallTextStyle(screenWidth).copyWith(color: secondaryColor,fontWeight: FontWeight.bold)
          ),
        ),
      ),
    ),
  );
}