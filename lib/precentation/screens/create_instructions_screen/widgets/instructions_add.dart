import 'package:flavorfusion/constants/colors.dart';
import 'package:flavorfusion/precentation/screens/create_instructions_screen/bloc/create_instructions_bloc.dart';
import 'package:flavorfusion/precentation/screens/create_instructions_screen/bloc/create_instructions_event.dart';
import 'package:flavorfusion/precentation/style_manager/text_style_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Widget instructionsAdd(
  BuildContext context,
  double screenWidth,
  TextEditingController instructionsController,
) {
  return Column(
    children: [
      ClipRRect(
        borderRadius: BorderRadius.circular(screenWidth * 0.1),
        child: Container(
          padding: EdgeInsets.all(screenWidth * 0.03),
          color: baseColor,
          width: screenWidth * 0.9,
          // height: screenWidth * 0.6,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Text(
                    'Instructions',
                    style: titleSmallTextStyle(screenWidth),
                  ),
                  TextField(
                    controller: instructionsController,
                    style: TextStyle(color: primaryColor),
                    cursorColor: primaryColor,
                    maxLines: null,
                    decoration: InputDecoration(
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
                        if (instructionsController.text.isNotEmpty) {
                          context.read<CreateInstructionsBloc>().add(
                              AddStepsButtonClickedEvent(
                                  instruction: instructionsController.text));
                          instructionsController.text = '';
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