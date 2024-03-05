import 'package:flavorfusion/precentation/screens/edit_option_screen/widgets/option_button.dart';
import 'package:flavorfusion/precentation/screens/edit_screen/edit_screen_ui.dart';
import 'package:flavorfusion/precentation/widgets/app_bars.dart';
import 'package:flutter/material.dart';

class EditOptionScreenUI extends StatelessWidget {
  final int index;
  EditOptionScreenUI({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: appBar(title: ''),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            optionButton(context, 'Edit Image', _screenSize.width,
                EditScreenUI(index: index, editIn: 'image')),
            optionButton(context, 'Edit Title', _screenSize.width,
                EditScreenUI(index: index, editIn: 'title')),
            optionButton(context, 'Edit Ingredients', _screenSize.width,
                EditScreenUI(index: index, editIn: 'ingredients')),
            optionButton(context, 'Edit Instructions', _screenSize.width,
                EditScreenUI(index: index, editIn: 'instructions')),
            optionButton(context, 'Edit Cooking Time', _screenSize.width,
                EditScreenUI(index: index, editIn: 'cookingtime')),
            optionButton(context, 'Edit Difficulty Level', _screenSize.width,
                EditScreenUI(index: index, editIn: 'difficultylevel')),
            optionButton(context, 'Edit Additional Notes', _screenSize.width,
                EditScreenUI(index: index, editIn: 'additionalnotes')),
          ],
        ),
      ),
    );
  }
}


