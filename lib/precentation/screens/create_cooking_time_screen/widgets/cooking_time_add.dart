import 'package:flavorfusion/constants/colors.dart';
import 'package:flavorfusion/precentation/screens/create_cooking_time_screen/bloc/create_cooking_time_bloc.dart';
import 'package:flavorfusion/precentation/screens/create_cooking_time_screen/bloc/create_cooking_time_event.dart';
import 'package:flavorfusion/precentation/screens/create_fillIn_screen/bloc/create_fillin_bloc.dart';
import 'package:flavorfusion/precentation/screens/create_fillIn_screen/bloc/create_fillin_event.dart';
import 'package:flavorfusion/precentation/style_manager/text_style_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Widget cookingTimeAdd(
    String text,
    BuildContext context,
    double screenWidth,
    TextEditingController prepTimeController,
    TextEditingController cookTimeController,
    TextEditingController totalTimeController) {
  return Column(
    children: [
      ClipRRect(
        borderRadius: BorderRadius.circular(screenWidth * 0.1),
        child: Container(
          padding: EdgeInsets.all(screenWidth * 0.03),
          color: baseColor,
          width: screenWidth * 0.5,
          height: screenWidth * 0.9,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Text(
                    'Prep Time',
                    style: titleSmallTextStyle(screenWidth),
                  ),
                  TextField(
                    keyboardType: TextInputType.phone,
                    controller: prepTimeController,
                    style: TextStyle(color: primaryColor),
                    cursorColor: primaryColor,
                    decoration: InputDecoration(
                        hintText: 'Enter in min',
                        hintStyle: titleSmallTextStyle(screenWidth)
                            .copyWith(color: primaryColor),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: primaryColor)),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: primaryColor))),
                  ),
                  SizedBox(
                    height: screenWidth * 0.1,
                  ),
                  Text(
                    'Cook Time',
                    style: titleSmallTextStyle(screenWidth),
                  ),
                  TextField(
                    keyboardType: TextInputType.phone,
                    controller: cookTimeController,
                    style: TextStyle(color: primaryColor),
                    cursorColor: primaryColor,
                    decoration: InputDecoration(
                        hintText: 'Enter in min',
                        hintStyle: titleSmallTextStyle(screenWidth)
                            .copyWith(color: primaryColor),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: primaryColor)),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: primaryColor))),
                  ),
                  SizedBox(
                    height: screenWidth * 0.1,
                  ),
                  Text(
                    'Total Time',
                    style: titleSmallTextStyle(screenWidth),
                  ),
                  TextField(
                    keyboardType: TextInputType.phone,
                    controller: totalTimeController,
                    style: TextStyle(color: primaryColor),
                    cursorColor: primaryColor,
                    decoration: InputDecoration(
                        hintText: 'Enter in min',
                        hintStyle: titleSmallTextStyle(screenWidth)
                            .copyWith(color: primaryColor),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: primaryColor)),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: primaryColor))),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                      onPressed: () {
                        if (prepTimeController.text.isNotEmpty &&
                            cookTimeController.text.isNotEmpty &&
                            totalTimeController.text.isNotEmpty) {
                              print(prepTimeController.text);
                          context.read<CreateCookingTimeBloc>().add(
                              SetAllTimeButtonClickedEvent(
                                  prpTime: prepTimeController.text,
                                  cookingTime: cookTimeController.text,
                                  totalTime: totalTimeController.text));
                          context.read<CreateFillinBloc>().add(CookingTimeSettedEvent());
                        }
                      },
                      icon: Icon(color: secondaryColor, Icons.check)),
                ],
              )
            ],
          ),
        ),
      ),
      SizedBox(
        height: screenWidth * 0.04,
      )
    ],
  );
}