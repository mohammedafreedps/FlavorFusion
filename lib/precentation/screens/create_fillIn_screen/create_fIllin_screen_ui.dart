import 'dart:async';
import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
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
import 'package:flavorfusion/precentation/screens/create_ingredients_screen/bloc/create_ingredients_bloc.dart';
import 'package:flavorfusion/precentation/screens/create_ingredients_screen/bloc/create_ingredients_state.dart';
import 'package:flavorfusion/precentation/screens/create_ingredients_screen/create_ingredients_screen_UI.dart';
import 'package:flavorfusion/precentation/screens/create_ingredients_screen/widgets/entered_ingredients_and_quantity.dart';
import 'package:flavorfusion/precentation/screens/create_instructions_screen/bloc/create_instructions_bloc.dart';
import 'package:flavorfusion/precentation/screens/create_instructions_screen/bloc/create_instructions_state.dart';
import 'package:flavorfusion/precentation/screens/create_instructions_screen/create_instructions_screen_ui.dart';
import 'package:flavorfusion/precentation/screens/create_instructions_screen/widgets/show_entered_instructions.dart';
import 'package:flavorfusion/precentation/screens/home_screen/bloc/home_screen_bloc.dart';
import 'package:flavorfusion/precentation/screens/home_screen/bloc/home_screen_event.dart';
import 'package:flavorfusion/precentation/screens/profile_screen/bloc/profile_bloc.dart';
import 'package:flavorfusion/precentation/screens/profile_screen/bloc/profile_event.dart';
import 'package:flavorfusion/precentation/style_manager/text_style_manager.dart';
import 'package:flavorfusion/precentation/widgets/app_bars.dart';
import 'package:flavorfusion/precentation/widgets/bottom_sheet.dart';
import 'package:flavorfusion/precentation/widgets/image_place_holder_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
    if (widget.isEditing == true && widget.index != null) {
      context.read<CreateFillinBloc>().add(EditPreviewImageEvent(
          imagePath: hposterRecipes[widget.index!].imageURL));
      _recipeTitleController.text = hposterRecipes[widget.index!].recipeTitle;
      _additionalNotesController.text =
          hposterRecipes[widget.index!].additionalNotes;
      _currentSliderValue =
          hposterRecipes[widget.index!].difficultyLevel.toDouble();
      hcreatedIngredents = hposterRecipes[widget.index!].ingredients;
      hcreatedQuantitys = hposterRecipes[widget.index!].quantitys;
      hinstructionsSteps = hposterRecipes[widget.index!].instructions;
      hprepTime = hposterRecipes[widget.index!].prepTime;
      hcookTime = hposterRecipes[widget.index!].cookTime;
      htotalTime = hposterRecipes[widget.index!].totalTime;
    } else {
      context.read<CreateFillinBloc>().add(SelectImageEvent());
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size _screenSize = MediaQuery.of(context).size;
    List<DropdownMenuItem> items = [
      DropdownMenuItem(
        child: Text(
          'Other',
          style: titleSmallTextStyle(_screenSize.width),
        ),
        value: 'Other',
      ),
      DropdownMenuItem(
          child: Text('Italian', style: titleSmallTextStyle(_screenSize.width)),
          value: 'Italian'),
      DropdownMenuItem(
          child: Text('Chinese', style: titleSmallTextStyle(_screenSize.width)),
          value: 'Chinese'),
      DropdownMenuItem(
          child: Text('Indian', style: titleSmallTextStyle(_screenSize.width)),
          value: 'Indian')
    ];

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
              context.read<ProfileBloc>().add(CountTotalLikeandPostEvent());
            });
          }
          if (state is EditRecipieUploadedState) {
            bottomSheet('Updated Recipie Uploaded Succesfully', context,
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
                    height: _screenSize.height + 200,
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
                            if (state is EditPreviewImageState) {
                              return AspectRatio(
                                  aspectRatio: 10 / 3,
                                  child: CachedNetworkImage(
                                    imageUrl: state.imagePath,
                                    placeholder: (context, url) =>
                                        imagePlaceHolderText(_screenSize.width),
                                  ));
                            }
                            if (state is SelectImageState) {
                              return Text(
                                'Select Image',
                                style: titleMidiumTextStyle(_screenSize.width),
                              );
                            }
                            return himagePath != null
                                ? AspectRatio(
                                    aspectRatio: 10 / 3,
                                    child: Image.file(File(himagePath!)),
                                  )
                                : Text(
                                    'Select Image',
                                    style:
                                        titleMidiumTextStyle(_screenSize.width),
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
                        Visibility(
                          visible: isIngredientsVisible,
                          child: SizedBox(
                            height: _screenSize.width * 0.5,
                            child: BlocBuilder<CreateIngredientsCountBloc,
                                CreateIngredientsCountState>(
                              builder: (context, state) {
                                if (state is ShowIngredientAndQuantityState) {
                                  return ListView.builder(
                                      itemCount: state.ingredients.length,
                                      itemBuilder: ((context, index) {
                                        return enteredIngredientsAndQuantity(
                                            context,
                                            index,
                                            state.ingredients[index],
                                            state.quantitys[index],
                                            _screenSize.width);
                                      }));
                                }
                                if (state is EditIngredientsAndQuantityState) {
                                  return ListView.builder(
                                      itemCount: state.ingredient.length,
                                      itemBuilder: ((context, index) {
                                        return enteredIngredientsAndQuantity(
                                            context,
                                            index,
                                            state.ingredient[index],
                                            state.quantity[index],
                                            _screenSize.width);
                                      }));
                                }
                                return ListView.builder(
                                    itemCount: 1,
                                    itemBuilder: (BuildContext context, intex) {
                                      return Center(
                                          child: Text(
                                        'Nothing added',
                                        style: titleSmallTextStyle(
                                            _screenSize.width),
                                      ));
                                    });
                              },
                            ),
                          ),
                        ),
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
                        Visibility(
                          visible: isInstructionVisible,
                          child: SizedBox(
                            height: _screenSize.width * 0.5,
                            child: BlocBuilder<CreateInstructionsBloc,
                                CreateInstructionsState>(
                              builder: (context, state) {
                                if (state is ShowInstructionsState) {
                                  return ListView.builder(
                                      itemCount: state.instructions.length,
                                      itemBuilder: ((context, index) {
                                        return showEnteredInstructions(
                                            context,
                                            state.instructions[index],
                                            _screenSize.width,
                                            index);
                                      }));
                                }
                                if (state is EditStepsState) {
                                  return ListView.builder(
                                      itemCount: state.instruction.length,
                                      itemBuilder: ((context, index) {
                                        return showEnteredInstructions(
                                            context,
                                            state.instruction[index],
                                            _screenSize.width,
                                            index);
                                      }));
                                }
                                return ListView.builder(
                                    itemCount: 1,
                                    itemBuilder: ((context, index) {
                                      return Center(
                                          child: Text(
                                        'Add Instructions',
                                        style: titleSmallTextStyle(
                                            _screenSize.width),
                                      ));
                                    }));
                              },
                            ),
                          ),
                        ),
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
                        Visibility(
                          visible: isCookingTimeVisible,
                          child: SizedBox(
                            height: _screenSize.width * 0.1,
                            child: Text(
                              'PrepTime: $hprepTime CookTime: $hcookTime TotalTime: $htotalTime',
                              style: titleSmallTextStyle(_screenSize.width),
                            ),
                          ),
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
                        Text(
                          'Select Category',
                          style: titleMidiumTextStyle(_screenSize.width),
                        ),
                        DropdownButton(
                            dropdownColor: baseColor,
                            value: hselectedCategory,
                            items: items,
                            onChanged: (value) {
                              setState(() {
                                hselectedCategory = value!;
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
                            if (widget.isEditing == true &&
                                widget.index != null) {
                              context.read<CreateFillinBloc>().add(
                                  EditedRecipieUploadButtonClickedEvent(
                                      index: widget.index!,
                                      imagePath: himagePath!,
                                      imageName: 'up',
                                      recipeTitle: _recipeTitleController.text,
                                      ingredients: hcreatedIngredents,
                                      quantitys: hcreatedQuantitys,
                                      instructions: hinstructionsSteps,
                                      prepTime: hprepTime!,
                                      cookTime: hcookTime!,
                                      totalTime: htotalTime!,
                                      difficultyLevel:
                                          _currentSliderValue.round(),
                                      additionalNotes:
                                          _additionalNotesController.text,
                                      category: hselectedCategory));
                            } else {
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
                                      category: hselectedCategory,
                                      difficultyLevel:
                                          _currentSliderValue.round()));
                            }
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
