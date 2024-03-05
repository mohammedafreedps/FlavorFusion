import 'dart:async';
import 'dart:io';
import 'package:flavorfusion/constants/colors.dart';
import 'package:flavorfusion/data/temp_value_holder.dart';
import 'package:flavorfusion/precentation/screens/activity_screen/bloc/activity_bloc.dart';
import 'package:flavorfusion/precentation/screens/activity_screen/bloc/activity_event.dart';
import 'package:flavorfusion/precentation/screens/create_cooking_time_screen/create_cooking_time_screen_ui.dart';
import 'package:flavorfusion/precentation/screens/create_fillIn_screen/bloc/create_fillin_bloc.dart';
import 'package:flavorfusion/precentation/screens/create_fillIn_screen/bloc/create_fillin_event.dart';
import 'package:flavorfusion/precentation/screens/create_fillIn_screen/bloc/create_fillin_state.dart';
import 'package:flavorfusion/precentation/screens/create_fillIn_screen/widgets/create_button_one.dart';
import 'package:flavorfusion/precentation/screens/create_fillIn_screen/widgets/create_button_two.dart';
import 'package:flavorfusion/precentation/screens/create_fillIn_screen/widgets/create_text_field.dart';
import 'package:flavorfusion/precentation/screens/create_ingredients_screen/create_ingredients_screen_UI.dart';
import 'package:flavorfusion/precentation/screens/create_instructions_screen/create_instructions_screen_ui.dart';
import 'package:flavorfusion/precentation/screens/home_screen/bloc/home_screen_bloc.dart';
import 'package:flavorfusion/precentation/screens/home_screen/bloc/home_screen_event.dart';
import 'package:flavorfusion/precentation/style_manager/text_style_manager.dart';
import 'package:flavorfusion/precentation/widgets/app_bars.dart';
import 'package:flavorfusion/precentation/widgets/bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateFIllinScreenUI extends StatefulWidget {
  const CreateFIllinScreenUI({super.key});

  @override
  State<CreateFIllinScreenUI> createState() => _CreateFIllinScreenUIState();
}

class _CreateFIllinScreenUIState extends State<CreateFIllinScreenUI> {
  double _currentSliderValue = 0;
  final _recipeTitleController = TextEditingController();
  final _additionalNotesController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size _screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: appBar(title: ''),
      body: BlocListener<CreateFillinBloc, CreateFillinState>(
        listener: (context, state) {
          if (state is NotFilledAllFieldsState) {
            bottomSheet('Fill all the Field', context, _screenSize.width,
                _screenSize.height);
          }
          if (state is RecipieUploadedStete) {
            bottomSheet('Recipie Uploaded Succesfully', context,
                _screenSize.width, _screenSize.height);
            context.read<HomeScreenBloc>().add(FechDataFromFirebaseEvent());
            Timer(Duration(seconds: 1), () {
              context.read<ActivityBloc>().add(SortAndSetValueEvent());
            });
          }
        },
        child: BlocBuilder<CreateFillinBloc, CreateFillinState>(
          builder: (context, state) {
            if (state is RecipieUploadingStete) {
              return Center(
                child: CircularProgressIndicator(
                  color: secondaryColor,
                ),
              );
            } else {
              return Padding(
                padding: EdgeInsets.only(
                    left: _screenSize.width * 0.1,
                    right: _screenSize.width * 0.1),
                child: ListView(children: [
                  SizedBox(
                    height: _screenSize.height,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        BlocBuilder<CreateFillinBloc, CreateFillinState>(
                          builder: (context, state) {
                            if (state is ShowSelectedImageState) {
                              return AspectRatio(
                                aspectRatio: 10 / 3,
                                child: Image.file(File(himagePath!)),
                              );
                            }
                            return Text(
                              'Select Image',
                              style: titleMidiumTextStyle(_screenSize.width),
                            );
                          },
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              createButtonOne(
                                  'Camra', context, _screenSize.width,
                                  function: () {
                                context.read<CreateFillinBloc>().add(
                                    TakeImageFromCameraButtonClickedEvent());
                              }),
                              createButtonOne(
                                  'Gallary', context, _screenSize.width,
                                  function: () {
                                context.read<CreateFillinBloc>().add(
                                    TakeImageFromGalleryButtonClickedEvent());
                              })
                            ]),
                        Column(
                          children: [
                            Text(
                              'Recipe Title',
                              style: titleMidiumTextStyle(_screenSize.width),
                            ),
                            createTextField(_recipeTitleController),
                          ],
                        ),
                        createButtonTwo(
                            'Ingredients >', context, _screenSize.width,
                            page: CreateIngredientsScreenUI()),
                        createButtonTwo(
                            'Instructions >', context, _screenSize.width,
                            page: CreateInstructionsScreenUI()),
                        BlocBuilder<CreateFillinBloc, CreateFillinState>(
                          builder: (context, state) {
                            if (state is CookingTimesState) {
                              return createButtonTwo(
                                  'P:' +
                                      ' ' +
                                      state.prpTime +
                                      ' C:' +
                                      ' ' +
                                      state.cookingTime +
                                      ' T: ' +
                                      ' ' +
                                      state.totalTime,
                                  context,
                                  _screenSize.width,
                                  page: CreateCookingTimeScreenUI());
                            }
                            return createButtonTwo(
                                'Cooking Time >', context, _screenSize.width,
                                page: CreateCookingTimeScreenUI());
                          },
                        ),
                        Column(
                          children: [
                            Text(
                              'Difficulty Level',
                              style: titleMidiumTextStyle(_screenSize.width),
                            ),
                            Slider(
                                divisions: null,
                                thumbColor: baseColor,
                                activeColor: baseColor,
                                inactiveColor: secondaryColor,
                                min: 0,
                                max: 5,
                                value: _currentSliderValue,
                                onChanged: (value) {
                                  setState(() {
                                    _currentSliderValue = value;
                                    print(_currentSliderValue);
                                  });
                                }),
                            _currentSliderValue > 0
                                ? Text(
                                    _currentSliderValue.round().toString(),
                                    style:
                                        titleSmallTextStyle(_screenSize.width),
                                  )
                                : const Text('')
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              'Additional Notes',
                              style: titleMidiumTextStyle(_screenSize.width),
                            ),
                            createTextField(_additionalNotesController),
                          ],
                        ),
                        createButtonOne('Upload', context, _screenSize.width,
                            function: () {
                          print(_recipeTitleController.text);
                          if (himagePath != null &&
                              _recipeTitleController.text.isNotEmpty &&
                              hcreatedIngredents.isNotEmpty &&
                              hinstructionsSteps.isNotEmpty &&
                              hcreatedQuantitys.isNotEmpty &&
                              hprepTime != null &&
                              hcookTime != null &&
                              htotalTime != null &&
                              _currentSliderValue > 0) {
                            String _imageName = DateTime.now().toString();
                            if (_additionalNotesController.text.isEmpty) {
                              _additionalNotesController.text = 'Nil';
                            }
                            context.read<CreateFillinBloc>().add(
                                UploadRecipieButtonClickedEvent(
                                    imagePath: himagePath!,
                                    imageName: 'recipe $_imageName',
                                    recipeTitle: _recipeTitleController.text,
                                    ingredients: hcreatedIngredents,
                                    instructions: hinstructionsSteps,
                                    quantitys: hcreatedQuantitys,
                                    prepTime: hprepTime!,
                                    cookTime: hcookTime!,
                                    totalTime: htotalTime!,
                                    additionalNotes:
                                        _additionalNotesController.text,
                                    difficultyLevel:
                                        _currentSliderValue.round()));
                          } else {
                            context
                                .read<CreateFillinBloc>()
                                .add(FieldFilledCheckErrorEvent());
                          }
                        })
                      ],
                    ),
                  ),
                ]),
              );
            }
          },
        ),
      ),
    );
  }
}