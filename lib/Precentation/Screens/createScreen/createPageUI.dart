import 'package:flavorfusion/Constants/textes.dart';
import 'package:flavorfusion/Precentation/Screens/createFillInScreen/createFIllinScreenUI.dart';
import 'package:flavorfusion/Precentation/Screens/createScreen/Widgets/button.dart';
import 'package:flavorfusion/Precentation/Widgets/appBars.dart';
import 'package:flavorfusion/Precentation/styleManager/textStyleManager.dart';
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              button(screenWidth: _screenSize.width, text: 'Doc',page: Placeholder(),context: context),
              button(screenWidth: _screenSize.width, text: 'Fill in',page: CreateFIllinScreenUI(),context: context)
            ],
          )
        ],
      ),
    ));
  }
}