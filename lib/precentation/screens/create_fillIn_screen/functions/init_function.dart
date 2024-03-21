import 'package:flavorfusion/data/temp_value_holder.dart';
import 'package:flavorfusion/precentation/screens/create_fillIn_screen/bloc/create_fillin_bloc.dart';
import 'package:flavorfusion/precentation/screens/create_fillIn_screen/bloc/create_fillin_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

double initFunction(
    BuildContext context,
    bool? isEditing,
    int? index,
    double currentSliderValue,
    TextEditingController recipeTitleController,
    TextEditingController additionalNotesController) {
  if (isEditing == true && index != null) {
    context
        .read<CreateFillinBloc>()
        .add(EditPreviewImageEvent(imagePath: hposterRecipes[index].imageURL));
    recipeTitleController.text = hposterRecipes[index].recipeTitle;
    additionalNotesController.text = hposterRecipes[index].additionalNotes;
    currentSliderValue = hposterRecipes[index].difficultyLevel.toDouble();
    hcreatedIngredents = hposterRecipes[index].ingredients;
    hcreatedQuantitys = hposterRecipes[index].quantitys;
    hinstructionsSteps = hposterRecipes[index].instructions;
    hprepTime = hposterRecipes[index].prepTime;
    hcookTime = hposterRecipes[index].cookTime;
    htotalTime = hposterRecipes[index].totalTime;
  } else {
    context.read<CreateFillinBloc>().add(SelectImageEvent());
  }
  return currentSliderValue;
}
