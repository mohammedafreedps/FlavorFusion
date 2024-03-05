import 'package:flavorfusion/precentation/screens/create_cooking_time_screen/bloc/create_cooking_time_bloc.dart';
import 'package:flavorfusion/precentation/screens/create_cooking_time_screen/bloc/create_cooking_time_state.dart';
import 'package:flavorfusion/precentation/screens/create_cooking_time_screen/widgets/cooking_time_add.dart';
import 'package:flavorfusion/precentation/style_manager/text_style_manager.dart';
import 'package:flavorfusion/precentation/widgets/app_bars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateCookingTimeScreenUI extends StatelessWidget {
  final _prepTimeController = TextEditingController();
  final _cookTimeController = TextEditingController();
  final _totalTimeController = TextEditingController();
  CreateCookingTimeScreenUI({super.key});

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    return Scaffold(
        appBar: appBar(title: ''),
        body: BlocListener<CreateCookingTimeBloc, CreateCookingTimeState>(
          listener: (context, state) {
            print(state);
            if (state is AllTimeSettedState) {
              Navigator.pop(context);
            }
          },
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: _screenSize.width * 0.1),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Center(
                    child: Text(
                      'Insturction',
                      style: titleMidiumTextStyle(_screenSize.width)
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: _screenSize.width * 0.2,
                  ),
                  cookingTimeAdd(
                      'Prep Time',
                      context,
                      _screenSize.width,
                      _prepTimeController,
                      _cookTimeController,
                      _totalTimeController),
                ],
              ),
            ),
          ),
        ));
  }
}


