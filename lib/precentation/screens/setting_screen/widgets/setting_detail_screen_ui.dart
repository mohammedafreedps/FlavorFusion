import 'package:flavorfusion/Constants/textes.dart';
import 'package:flavorfusion/precentation/screens/setting_screen/widgets/about.dart';
import 'package:flavorfusion/precentation/widgets/app_bars.dart';
import 'package:flutter/material.dart';

class SettingDetailScreenUi extends StatelessWidget {
  final String pageName;
  SettingDetailScreenUi({super.key, required this.pageName});

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: appBar(title: ''),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(_screenSize.width * 0.1),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (pageName == 'About') texts(_screenSize.width, aboutText),
              if(pageName == 'privacy Policy') texts(_screenSize.width, privacyPolicyText),
              if(pageName == 'Terms & Condition') texts(_screenSize.width, termsAndConditionsText)
            ],
          ),
        ),
      ),
    );
  }
}
