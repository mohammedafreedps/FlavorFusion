import 'package:flavorfusion/precentation/screens/create_instructions_screen/bloc/create_instructions_bloc.dart';
import 'package:flavorfusion/precentation/screens/create_instructions_screen/bloc/create_instructions_state.dart';
import 'package:flavorfusion/precentation/screens/create_instructions_screen/widgets/show_entered_instructions.dart';
import 'package:flavorfusion/precentation/style_manager/text_style_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Widget instructionVisible(bool isInstructionVisible, double screenWidht) {
  return Visibility(
    visible: isInstructionVisible,
    child: SizedBox(
      height: screenWidht * 0.5,
      child: BlocBuilder<CreateInstructionsBloc, CreateInstructionsState>(
        builder: (context, state) {
          if (state is ShowInstructionsState) {
            return ListView.builder(
                itemCount: state.instructions.length,
                itemBuilder: ((context, index) {
                  return showEnteredInstructions(
                      context, state.instructions[index], screenWidht, index);
                }));
          }
          if (state is EditStepsState) {
            return ListView.builder(
                itemCount: state.instruction.length,
                itemBuilder: ((context, index) {
                  return showEnteredInstructions(
                      context, state.instruction[index], screenWidht, index);
                }));
          }
          return ListView.builder(
              itemCount: 1,
              itemBuilder: ((context, index) {
                return Center(
                    child: Text(
                  'Add Instructions',
                  style: titleSmallTextStyle(screenWidht),
                ));
              }));
        },
      ),
    ),
  );
}
