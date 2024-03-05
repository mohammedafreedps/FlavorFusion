import 'package:flavorfusion/precentation/screens/create_instructions_screen/bloc/create_instructions_bloc.dart';
import 'package:flavorfusion/precentation/screens/create_instructions_screen/bloc/create_instructions_state.dart';
import 'package:flavorfusion/precentation/screens/create_instructions_screen/widgets/instructions_add.dart';
import 'package:flavorfusion/precentation/screens/create_instructions_screen/widgets/show_entered_instructions.dart';
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




