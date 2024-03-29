// import 'dart:io';

// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flavorfusion/constants/colors.dart';
// import 'package:flavorfusion/data/temp_value_holder.dart';
// import 'package:flavorfusion/precentation/screens/create_cooking_time_screen/create_cooking_time_screen_ui.dart';
// import 'package:flavorfusion/precentation/screens/create_fillIn_screen/bloc/create_fillin_bloc.dart';
// import 'package:flavorfusion/precentation/screens/create_fillIn_screen/bloc/create_fillin_event.dart';
// import 'package:flavorfusion/precentation/screens/create_fillIn_screen/bloc/create_fillin_state.dart';
// import 'package:flavorfusion/precentation/screens/create_fillIn_screen/widgets/create_button_one.dart';
// import 'package:flavorfusion/precentation/screens/create_fillIn_screen/widgets/create_button_two.dart';
// import 'package:flavorfusion/precentation/screens/create_fillIn_screen/widgets/create_text_field.dart';
// import 'package:flavorfusion/precentation/screens/create_ingredients_screen/bloc/create_ingredients_bloc.dart';
// import 'package:flavorfusion/precentation/screens/create_ingredients_screen/bloc/create_ingredients_state.dart';
// import 'package:flavorfusion/precentation/screens/create_ingredients_screen/create_ingredients_screen_ui.dart';
// import 'package:flavorfusion/precentation/screens/create_ingredients_screen/widgets/entered_ingredients_and_quantity.dart';
// import 'package:flavorfusion/precentation/screens/create_instructions_screen/bloc/create_instructions_bloc.dart';
// import 'package:flavorfusion/precentation/screens/create_instructions_screen/bloc/create_instructions_state.dart';
// import 'package:flavorfusion/precentation/screens/create_instructions_screen/create_instructions_screen_ui.dart';
// import 'package:flavorfusion/precentation/screens/create_instructions_screen/widgets/show_entered_instructions.dart';
// import 'package:flavorfusion/precentation/style_manager/text_style_manager.dart';
// import 'package:flavorfusion/precentation/widgets/image_place_holder_text.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// Widget showRecipeData(
//     double screenWidth,
//     BuildContext context,
//     TextEditingController recipeTitleController,
//     int index,
//     bool? isEditing,
//     bool isIngredientsVisible,
//     bool isInstructionVisible,
//     bool isCookingTimeVisible) {
//   return Padding(
//     padding: EdgeInsets.only(left: screenWidth * 0.1, right: screenWidth * 0.1),
//     child: ListView(children: [
//       SizedBox(
//         height: screenWidth + 200,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             BlocBuilder<CreateFillinBloc, CreateFillinState>(
//               builder: (context, state) {
//                 if (state is ShowSelectedImageState) {
//                   return AspectRatio(
//                     aspectRatio: 10 / 3,
//                     child: Image.file(File(himagePath!)),
//                   );
//                 }
//                 if (state is EditPreviewImageState) {
//                   return AspectRatio(
//                       aspectRatio: 10 / 3,
//                       child: CachedNetworkImage(
//                         imageUrl: state.imagePath,
//                         placeholder: (context, url) =>
//                             imagePlaceHolderText(screenWidth),
//                       ));
//                 }
//                 if (state is SelectImageState) {
//                   return Text(
//                     'Select Image',
//                     style: titleMidiumTextStyle(screenWidth),
//                   );
//                 }
//                 return himagePath != null
//                     ? AspectRatio(
//                         aspectRatio: 10 / 3,
//                         child: Image.file(File(himagePath!)),
//                       )
//                     : Text(
//                         'Select Image',
//                         style: titleMidiumTextStyle(screenWidth),
//                       );
//               },
//             ),
//             Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
//               createButtonOne('Camra', context, screenWidth, function: () {
//                 context
//                     .read<CreateFillinBloc>()
//                     .add(TakeImageFromCameraButtonClickedEvent());
//               }),
//               createButtonOne('Gallary', context, screenWidth, function: () {
//                 context
//                     .read<CreateFillinBloc>()
//                     .add(TakeImageFromGalleryButtonClickedEvent());
//               })
//             ]),
//             Column(
//               children: [
//                 Text(
//                   'Recipe Title',
//                   style: titleMidiumTextStyle(screenWidth),
//                 ),
//                 createTextField(recipeTitleController),
//               ],
//             ),
//             createButtonTwo('Ingredients >', context, screenWidth,
//                 page: CreateIngredientsScreenUI(
//                   isEditing: isEditing != null ? isEditing : false,
//                   index: index,
//                 )),
//             GestureDetector(
//                 onTap: () {
//                   setState(() {
//                     isIngredientsVisible =
//                         !isIngredientsVisible; // Toggle visibility
//                   });
//                 },
//                 child: Text(
//                   isIngredientsVisible ? 'hide' : 'show',
//                   style: titleSmallTextStyle(screenWidth),
//                 )),
//             Visibility(
//               visible: isIngredientsVisible,
//               child: SizedBox(
//                 height: screenWidth * 0.5,
//                 child: BlocBuilder<CreateIngredientsCountBloc,
//                     CreateIngredientsCountState>(
//                   builder: (context, state) {
//                     if (state is ShowIngredientAndQuantityState) {
//                       return ListView.builder(
//                           itemCount: state.ingredients.length,
//                           itemBuilder: ((context, index) {
//                             return enteredIngredientsAndQuantity(
//                                 context,
//                                 index,
//                                 state.ingredients[index],
//                                 state.quantitys[index],
//                                 screenWidth);
//                           }));
//                     }
//                     if (state is EditIngredientsAndQuantityState) {
//                       return ListView.builder(
//                           itemCount: state.ingredient.length,
//                           itemBuilder: ((context, index) {
//                             return enteredIngredientsAndQuantity(
//                                 context,
//                                 index,
//                                 state.ingredient[index],
//                                 state.quantity[index],
//                                 screenWidth);
//                           }));
//                     }
//                     return ListView.builder(
//                         itemCount: 1,
//                         itemBuilder: (BuildContext context, intex) {
//                           return Center(
//                               child: Text(
//                             'Nothing added',
//                             style: titleSmallTextStyle(screenWidth),
//                           ));
//                         });
//                   },
//                 ),
//               ),
//             ),
//             createButtonTwo('Instructions >', context, screenWidth,
//                 page: CreateInstructionsScreenUI(
//                   isEditing: isEditing,
//                   index: index,
//                 )),
//             GestureDetector(
//                 onTap: () {
//                   setState(() {
//                     isInstructionVisible =
//                         !isInstructionVisible; // Toggle visibility
//                   });
//                 },
//                 child: Text(
//                   isInstructionVisible ? 'hide' : 'show',
//                   style: titleSmallTextStyle(screenWidth),
//                 )),
//             Visibility(
//               visible: isInstructionVisible,
//               child: SizedBox(
//                 height: screenWidth * 0.5,
//                 child: BlocBuilder<CreateInstructionsBloc,
//                     CreateInstructionsState>(
//                   builder: (context, state) {
//                     if (state is ShowInstructionsState) {
//                       return ListView.builder(
//                           itemCount: state.instructions.length,
//                           itemBuilder: ((context, index) {
//                             return showEnteredInstructions(context,
//                                 state.instructions[index], screenWidth, index);
//                           }));
//                     }
//                     if (state is EditStepsState) {
//                       return ListView.builder(
//                           itemCount: state.instruction.length,
//                           itemBuilder: ((context, index) {
//                             return showEnteredInstructions(context,
//                                 state.instruction[index], screenWidth, index);
//                           }));
//                     }
//                     return ListView.builder(
//                         itemCount: 1,
//                         itemBuilder: ((context, index) {
//                           return Center(
//                               child: Text(
//                             'Add Instructions',
//                             style: titleSmallTextStyle(screenWidth),
//                           ));
//                         }));
//                   },
//                 ),
//               ),
//             ),
//             createButtonTwo('Cooking Time >', context, screenWidth,
//                 page: CreateCookingTimeScreenUI(
//                   isEditing: isEditing,
//                   index: index,
//                 )),
//             GestureDetector(
//                 onTap: () {
//                   setState(() {
//                     isCookingTimeVisible =
//                         !isCookingTimeVisible; // Toggle visibility
//                   });
//                 },
//                 child: Text(
//                   isCookingTimeVisible ? 'hide' : 'show',
//                   style: titleSmallTextStyle(screenWidth),
//                 )),
//             Visibility(
//               visible: isCookingTimeVisible,
//               child: SizedBox(
//                 height: screenWidth * 0.1,
//                 child: Text(
//                   'PrepTime: $hprepTime CookTime: $hcookTime TotalTime: $htotalTime',
//                   style: titleSmallTextStyle(screenWidth),
//                 ),
//               ),
//             ),
//             Column(
//               children: [
//                 Text(
//                   'Difficulty Level',
//                   style: titleMidiumTextStyle(screenWidth),
//                 ),
//                 Slider(
//                     divisions: null,
//                     thumbColor: baseColor,
//                     activeColor: baseColor,
//                     inactiveColor: secondaryColor,
//                     min: 0,
//                     max: 5,
//                     value: _currentSliderValue,
//                     onChanged: (value) {
//                       setState(() {
//                         _currentSliderValue = value;
//                         print(_currentSliderValue);
//                       });
//                     }),
//                 _currentSliderValue > 0
//                     ? Text(
//                         _currentSliderValue.round().toString(),
//                         style: titleSmallTextStyle(screenWidth),
//                       )
//                     : const Text('')
//               ],
//             ),
//             Text(
//               'Select Category',
//               style: titleMidiumTextStyle(screenWidth),
//             ),
//             DropdownButton(
//                 dropdownColor: baseColor,
//                 value: hdefaultSelectedCategory,
//                 items: dropDownItemList(screenWidth),
//                 onChanged: (value) {
//                   setState(() {
//                     hdefaultSelectedCategory = value!;
//                   });
//                 }),
//             Column(
//               children: [
//                 Text(
//                   'Additional Notes',
//                   style: titleMidiumTextStyle(screenWidth),
//                 ),
//                 createTextField(_additionalNotesController),
//               ],
//             ),
//             createButtonOne('Upload', context, screenWidth, function: () {
//               uploadRecipie(
//                   context,
//                   widget.isEditing,
//                   widget.index,
//                   _currentSliderValue,
//                   _recipeTitleController,
//                   _additionalNotesController);
//             })
//           ],
//         ),
//       ),
//     ]),
//   );
// }
