import 'dart:io';

import 'package:flavorfusion/constants/colors.dart';
import 'package:flavorfusion/data/temp_value_holder.dart';
import 'package:flavorfusion/precentation/screens/edit_screen/bloc/edit_bloc.dart';
import 'package:flavorfusion/precentation/screens/edit_screen/bloc/edit_event.dart';
import 'package:flavorfusion/precentation/screens/edit_screen/bloc/edit_state.dart';
import 'package:flavorfusion/precentation/screens/home_screen/bloc/home_screen_bloc.dart';
import 'package:flavorfusion/precentation/screens/home_screen/bloc/home_screen_event.dart';
import 'package:flavorfusion/precentation/style_manager/text_style_manager.dart';
import 'package:flavorfusion/precentation/widgets/app_bars.dart';
import 'package:flavorfusion/precentation/widgets/bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditScreenUI extends StatefulWidget {
  int index;
  String editIn;
  EditScreenUI({super.key, required this.index, required this.editIn});

  @override
  State<EditScreenUI> createState() => _EditScreenUIState();
}

class _EditScreenUIState extends State<EditScreenUI> {
  final _titleController = TextEditingController();
  final _additionalNotesController = TextEditingController();
  final _pretimeController = TextEditingController();
  final _cookTimeController = TextEditingController();
  final _totalTimeController = TextEditingController();
  String _imageURI = '';

  @override
  void initState() {
    _imageURI = hposterRecipes[widget.index].imageURL;
    _titleController.text = hposterRecipes[widget.index].recipeTitle;
    _additionalNotesController.text =
        hposterRecipes[widget.index].additionalNotes;
    _pretimeController.text = hposterRecipes[widget.index].prepTime;
    _cookTimeController.text = hposterRecipes[widget.index].cookTime;
    _totalTimeController.text = hposterRecipes[widget.index].totalTime;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: appBar(title: ''),
      body: BlocListener<EditBloc, EditState>(
        listener: (context, state) {
          if (state is UpdatedState) {
            context.read<HomeScreenBloc>().add(FechDataFromFirebaseEvent());
            Navigator.pop(context);
            bottomSheet(
                state.message, context, _screenSize.width, _screenSize.height);
          }
        },
        child: BlocBuilder<EditBloc, EditState>(
          builder: (context, state) {
            if (state is UpdatingState) {
              return Center(
                child: CircularProgressIndicator(
                  color: secondaryColor,
                ),
              );
            }
            return Padding(
              padding: EdgeInsets.all(_screenSize.width * 0.1),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (widget.editIn == 'image')
                    BlocBuilder<EditBloc, EditState>(
                      builder: (context, state) {
                        if (state is NewImageSelectedState) {
                          return editImage(context, _screenSize.width,
                              _imageURI, widget.index,
                              imagePath: state.image.path);
                        }
                        return editImage(context, _screenSize.width, _imageURI,
                            widget.index);
                      },
                    ),
                  if (widget.editIn == 'title')
                    editTitle(context, _screenSize.width, widget.index,
                        _titleController),
                  if (widget.editIn == 'additionalnotes')
                    editAdditionalNote(context, _screenSize.width, widget.index,
                        _additionalNotesController),
                  if (widget.editIn == 'cookingtime')
                    editCookingTime(
                        context,
                        widget.index,
                        _screenSize.width,
                        _pretimeController,
                        _cookTimeController,
                        _totalTimeController)
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

Widget editImage(
    BuildContext context, double screenWidth, String imageURI, int index,
    {String? imagePath}) {
  return Center(
    child: Column(
      children: [
        Text(
          'Select Image',
          style: titleMidiumTextStyle(screenWidth),
        ),
        SizedBox(
          width: screenWidth * 0.5,
          height: screenWidth * 0.5,
          child: imagePath == null
              ? Image.network(imageURI)
              : Image.file(File(imagePath)),
        ),
        TextButton(
            onPressed: () {
              context
                  .read<EditBloc>()
                  .add(OnSelectImageFromGallaryClickedEvent());
            },
            child: Text(
              'Select From Gallary',
              style: titleSmallTextStyle(screenWidth),
            )),
        IconButton(
            onPressed: () {
              if (imagePath != null) {
                context.read<EditBloc>().add(OnEditImageClickedEvent(
                    imagePath: imagePath, index: index));
              }
            },
            icon: Icon(
              Icons.check,
              color: secondaryColor,
            ))
      ],
    ),
  );
}

Widget editTitle(BuildContext context, double screenWidth, int index,
    TextEditingController controller) {
  return Column(
    children: [
      TextField(
        controller: controller,
        keyboardType: TextInputType.emailAddress,
        style: TextStyle(color: baseColor),
        cursorColor: baseColor,
        decoration: InputDecoration(
            enabledBorder:
                UnderlineInputBorder(borderSide: BorderSide(color: baseColor)),
            focusedBorder:
                UnderlineInputBorder(borderSide: BorderSide(color: baseColor))),
      ),
      IconButton(
          onPressed: () {
            context.read<EditBloc>().add(OnEditTitleButtonClickedEvent(
                newTitle: controller.text, index: index));
          },
          icon: Icon(
            Icons.check,
            color: secondaryColor,
          ))
    ],
  );
}

Widget editAdditionalNote(BuildContext context, double screenWidth, int index,
    TextEditingController controller) {
  return Column(
    children: [
      TextField(
        controller: controller,
        keyboardType: TextInputType.emailAddress,
        style: TextStyle(color: baseColor),
        cursorColor: baseColor,
        decoration: InputDecoration(
            enabledBorder:
                UnderlineInputBorder(borderSide: BorderSide(color: baseColor)),
            focusedBorder:
                UnderlineInputBorder(borderSide: BorderSide(color: baseColor))),
      ),
      IconButton(
          onPressed: () {
            context.read<EditBloc>().add(OnEditAdditonalNotesClickedEvent(
                newAditionalNotes: controller.text, index: index));
          },
          icon: Icon(
            Icons.check,
            color: secondaryColor,
          ))
    ],
  );
}

Widget editCookingTime(
    BuildContext context,
    int index,
    double screenWidth,
    TextEditingController prepTime,
    TextEditingController cookTime,
    TextEditingController totalTime) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.2),
    child: Column(
      children: [
        Text(
          'Prep Time',
          style: titleMidiumTextStyle(screenWidth),
        ),
        TextField(
          controller: prepTime,
          keyboardType: TextInputType.phone,
          style: TextStyle(color: baseColor),
          cursorColor: baseColor,
          decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: baseColor)),
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: baseColor))),
        ),
        Text(
          'Cook Time',
          style: titleMidiumTextStyle(screenWidth),
        ),
        TextField(
          controller: cookTime,
          keyboardType: TextInputType.phone,
          style: TextStyle(color: baseColor),
          cursorColor: baseColor,
          decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: baseColor)),
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: baseColor))),
        ),
        Text(
          'Total Time',
          style: titleMidiumTextStyle(screenWidth),
        ),
        TextField(
          controller: totalTime,
          keyboardType: TextInputType.phone,
          style: TextStyle(color: baseColor),
          cursorColor: baseColor,
          decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: baseColor)),
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: baseColor))),
        ),
        IconButton(
            onPressed: () {
              context.read<EditBloc>().add(OnEditCookingTimeClickedEvent(
                  prpTime: prepTime.text,
                  cookTime: cookTime.text,
                  totalTime: totalTime.text,
                  index: index));
            },
            icon: Icon(
              Icons.check,
              color: secondaryColor,
            ))
      ],
    ),
  );
}
