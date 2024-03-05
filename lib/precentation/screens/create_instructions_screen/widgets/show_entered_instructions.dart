import 'package:flavorfusion/constants/colors.dart';
import 'package:flavorfusion/precentation/screens/create_instructions_screen/bloc/create_instructions_bloc.dart';
import 'package:flavorfusion/precentation/screens/create_instructions_screen/bloc/create_instructions_event.dart';
import 'package:flavorfusion/precentation/style_manager/text_style_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Widget showEnteredInstructions(
    BuildContext context, String instruction, double screenWidth, int index) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Text(
        instruction,
        style: titleSmallTextStyle(screenWidth),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          IconButton(
              onPressed: () {
                context.read<CreateInstructionsBloc>().add(DeleteStepsButtonClickedEvent(index: index));
              },
              icon: Icon(
                Icons.delete,
                color: secondaryColor,
              ))
        ],
      ),
      const Divider()
    ],
  );
}