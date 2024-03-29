import 'package:flavorfusion/constants/colors.dart';
import 'package:flavorfusion/data/temp_value_holder.dart';
import 'package:flavorfusion/precentation/screens/create_cooking_time_screen/create_cooking_time_screen_ui.dart';
import 'package:flavorfusion/precentation/screens/create_fillIn_screen/bloc/create_fillin_bloc.dart';
import 'package:flavorfusion/precentation/screens/create_fillIn_screen/bloc/create_fillin_state.dart';
import 'package:flavorfusion/precentation/screens/create_fillIn_screen/functions/edit_recipie_uploaded.dart';
import 'package:flavorfusion/precentation/screens/create_fillIn_screen/functions/init_function.dart';
import 'package:flavorfusion/precentation/screens/create_fillIn_screen/functions/recipie_uploaded.dart';
import 'package:flavorfusion/precentation/screens/create_fillIn_screen/functions/reset_value.dart';
import 'package:flavorfusion/precentation/screens/create_fillIn_screen/functions/upload_recipie.dart';
import 'package:flavorfusion/precentation/screens/create_fillIn_screen/widgets/cooking_time_visible.dart';
import 'package:flavorfusion/precentation/screens/create_fillIn_screen/widgets/create_button_one.dart';
import 'package:flavorfusion/precentation/screens/create_fillIn_screen/widgets/create_button_two.dart';
import 'package:flavorfusion/precentation/screens/create_fillIn_screen/widgets/create_text_field.dart';
import 'package:flavorfusion/precentation/screens/create_fillIn_screen/widgets/drop_down_item_list.dart';
import 'package:flavorfusion/precentation/screens/create_fillIn_screen/widgets/ingredients_visible.dart';
import 'package:flavorfusion/precentation/screens/create_fillIn_screen/widgets/instructions_visible.dart';
import 'package:flavorfusion/precentation/screens/create_fillIn_screen/widgets/recipe_title_textfiled.dart';
import 'package:flavorfusion/precentation/screens/create_fillIn_screen/widgets/select_image_buttons.dart';
import 'package:flavorfusion/precentation/screens/create_fillIn_screen/widgets/selected_image.dart';
import 'package:flavorfusion/precentation/screens/create_ingredients_screen/create_ingredients_screen_UI.dart';
import 'package:flavorfusion/precentation/screens/create_instructions_screen/create_instructions_screen_ui.dart';
import 'package:flavorfusion/precentation/style_manager/text_style_manager.dart';
import 'package:flavorfusion/precentation/widgets/app_bars.dart';
import 'package:flavorfusion/precentation/widgets/bottom_sheet.dart';
import 'package:flavorfusion/precentation/widgets/loading_icon_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateFIllinScreenUI extends StatefulWidget {
  final bool? isEditing;
  final int? index;
  CreateFIllinScreenUI({super.key, this.isEditing, this.index});

  @override
  State<CreateFIllinScreenUI> createState() => _CreateFIllinScreenUIState();
}

class _CreateFIllinScreenUIState extends State<CreateFIllinScreenUI> {
  double _currentSliderValue = 0;
  final _recipeTitleController = TextEditingController();
  final _additionalNotesController = TextEditingController();
  bool isIngredientsVisible = false;
  bool isInstructionVisible = false;
  bool isCookingTimeVisible = false;

  @override
  void initState() {
    _currentSliderValue = initFunction(
        context,
        widget.isEditing,
        widget.index,
        _currentSliderValue,
        _recipeTitleController,
        _additionalNotesController);

    super.initState();
  }

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
            resetValue();
            recipieUploaded(context, _screenSize);
          }
          if (state is EditRecipieUploadedState) {
            editRecipieUploaded(context, _screenSize);
          }
        },
        child: BlocBuilder<CreateFillinBloc, CreateFillinState>(
          builder: (context, state) {
            if (state is RecipieUploadingStete) {
              return Center(child: loadingIconAnimation(_screenSize.width));
            } else {
              return Padding(
                padding: EdgeInsets.symmetric( horizontal: _screenSize.width * 0.04,),
                child: ListView(children: [
                  SizedBox(
                    height: _screenSize.height + 200,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        selectedImage(_screenSize.width),
                        selectImageButton(context, _screenSize.width),
                        recipeTileTextfield(
                            _recipeTitleController, _screenSize.width),
                        createButtonTwo(
                            'Ingredients >', context, _screenSize.width,
                            page: CreateIngredientsScreenUI(
                              isEditing: widget.isEditing != null
                                  ? widget.isEditing!
                                  : false,
                              index: widget.index,
                            )),
                        GestureDetector(
                            onTap: () {
                              setState(() {
                                isIngredientsVisible =
                                    !isIngredientsVisible; // Toggle visibility
                              });
                            },
                            child: Text(
                              isIngredientsVisible ? 'hide' : 'show',
                              style: titleSmallTextStyle(_screenSize.width),
                            )),
                        ingredientsVisible(
                            isIngredientsVisible, _screenSize.width),
                        createButtonTwo(
                            'Instructions >', context, _screenSize.width,
                            page: CreateInstructionsScreenUI(
                              isEditing: widget.isEditing,
                              index: widget.index,
                            )),
                        GestureDetector(
                            onTap: () {
                              setState(() {
                                isInstructionVisible =
                                    !isInstructionVisible; // Toggle visibility
                              });
                            },
                            child: Text(
                              isInstructionVisible ? 'hide' : 'show',
                              style: titleSmallTextStyle(_screenSize.width),
                            )),
                        instructionVisible(
                            isInstructionVisible, _screenSize.width),
                        createButtonTwo(
                            'Cooking Time >', context, _screenSize.width,
                            page: CreateCookingTimeScreenUI(
                              isEditing: widget.isEditing,
                              index: widget.index,
                            )),
                        GestureDetector(
                            onTap: () {
                              setState(() {
                                isCookingTimeVisible =
                                    !isCookingTimeVisible; // Toggle visibility
                              });
                            },
                            child: Text(
                              isCookingTimeVisible ? 'hide' : 'show',
                              style: titleSmallTextStyle(_screenSize.width),
                            )),
                        cookingTimeVisible(
                            isCookingTimeVisible, _screenSize.width),
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
                        Text(
                          'Select Category',
                          style: titleMidiumTextStyle(_screenSize.width),
                        ),
                        DropdownButton(
                            dropdownColor: baseColor,
                            value: hdefaultSelectedCategory,
                            items: dropDownItemList(_screenSize.width),
                            onChanged: (value) {
                              setState(() {
                                hdefaultSelectedCategory = value!;
                              });
                            }),
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
                          uploadRecipie(
                              context,
                              widget.isEditing,
                              widget.index,
                              _currentSliderValue,
                              _recipeTitleController,
                              _additionalNotesController);
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
