import 'package:flavorfusion/data/temp_value_holder.dart';
import 'package:flavorfusion/precentation/screens/create_fillIn_screen/bloc/create_fillin_bloc.dart';
import 'package:flavorfusion/precentation/screens/create_fillIn_screen/bloc/create_fillin_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void uploadRecipie(
    BuildContext context,
    bool? isEditing,
    int? index,
    double currentSliderValue,
    TextEditingController recipeTitleController,
    TextEditingController additionalNotesController) {
  if (himagePath != null &&
      recipeTitleController.text.isNotEmpty &&
      hcreatedIngredents.isNotEmpty &&
      hinstructionsSteps.isNotEmpty &&
      hcreatedQuantitys.isNotEmpty &&
      hprepTime != null &&
      hcookTime != null &&
      htotalTime != null &&
      currentSliderValue > 0) {
    String _imageName = DateTime.now().toString();
    if (additionalNotesController.text.isEmpty) {
      additionalNotesController.text = 'Nil';
    }
    if (isEditing == true && index != null) {
      context.read<CreateFillinBloc>().add(
          EditedRecipieUploadButtonClickedEvent(
              index: index,
              imagePath: himagePath!,
              imageName: 'up',
              recipeTitle: recipeTitleController.text,
              ingredients: hcreatedIngredents,
              quantitys: hcreatedQuantitys,
              instructions: hinstructionsSteps,
              prepTime: hprepTime!,
              cookTime: hcookTime!,
              totalTime: htotalTime!,
              difficultyLevel: currentSliderValue.round(),
              additionalNotes: additionalNotesController.text,
              category: hselectedCategory));
    } else {
      context.read<CreateFillinBloc>().add(UploadRecipieButtonClickedEvent(
          imagePath: himagePath!,
          imageName: 'recipe $_imageName',
          recipeTitle: recipeTitleController.text,
          ingredients: hcreatedIngredents,
          instructions: hinstructionsSteps,
          quantitys: hcreatedQuantitys,
          prepTime: hprepTime!,
          cookTime: hcookTime!,
          totalTime: htotalTime!,
          additionalNotes: additionalNotesController.text,
          category: hselectedCategory,
          difficultyLevel: currentSliderValue.round()));
    }
  } else {
    context.read<CreateFillinBloc>().add(FieldFilledCheckErrorEvent());
  }
}
