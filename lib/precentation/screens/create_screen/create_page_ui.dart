

import 'package:flavorfusion/Constants/textes.dart';
import 'package:flavorfusion/precentation/screens/create_fillIn_screen/create_fIllin_screen_UI.dart';
import 'package:flavorfusion/precentation/screens/create_screen/Widgets/button.dart';
import 'package:flavorfusion/precentation/style_manager/text_style_manager.dart';
import 'package:flavorfusion/precentation/widgets/app_bars.dart';
import 'package:flutter/material.dart';

class CreatePageUI extends StatelessWidget {
  const CreatePageUI({super.key});

  @override
  Widget build(BuildContext context) {
    Size _screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: appBar(title: 'Create'),
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding:  EdgeInsets.only(left: _screenSize.width*0.1,right: _screenSize.width*0.1),
            child: Text(
              textAlign: TextAlign.center,
              createPageText,
              style: titleMidiumTextStyle(_screenSize.width)
            ),
          ),
          button(screenWidth: _screenSize.width, text: 'Fill in',page: CreateFIllinScreenUI(),context: context)
        ],
      ),
    ));
  }
}