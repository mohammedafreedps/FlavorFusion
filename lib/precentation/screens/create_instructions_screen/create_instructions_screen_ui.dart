import 'package:flavorfusion/constants/colors.dart';
import 'package:flavorfusion/precentation/screens/create_instructions_screen/bloc/create_instructions_bloc.dart';
import 'package:flavorfusion/precentation/screens/create_instructions_screen/bloc/create_instructions_event.dart';
import 'package:flavorfusion/precentation/screens/create_instructions_screen/bloc/create_instructions_state.dart';
import 'package:flavorfusion/precentation/style_manager/text_style_manager.dart';
import 'package:flavorfusion/precentation/widgets/app_bars.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateInstructionsScreenUI extends StatelessWidget {
  final _instructionsController = TextEditingController();
  CreateInstructionsScreenUI({super.key});

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: appBar(title: ''),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: _screenSize.width * 0.1),
        child: Column(
          children: [
            Text(
              'Insturction',
              style: titleMidiumTextStyle(_screenSize.width)
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: _screenSize.width * 0.1,
            ),
            instructionsAdd(
                context, _screenSize.width, _instructionsController),
            BlocBuilder<CreateInstructionsBloc, CreateInstructionsState>(
              builder: (context, state) {
                if (state is ShowInstructionsState) {
                  return Expanded(
                      child: ListView.builder(
                          itemCount: state.instructions.length,
                          itemBuilder: ((context, index) {
                            return showEnteredInstructions(
                                context,
                                state.instructions[index],
                                _screenSize.width,
                                index);
                          })));
                }
                return Expanded(
                    child: ListView.builder(
                        itemCount: 1,
                        itemBuilder: ((context, index) {
                          return Center(
                              child: Text(
                            'Add Instructions',
                            style: titleSmallTextStyle(_screenSize.width),
                          ));
                        })));
              },
            )
          ],
        ),
      ),
    );
  }
}

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
