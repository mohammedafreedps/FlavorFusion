import 'dart:async';

import 'package:flavorfusion/constants/colors.dart';
import 'package:flavorfusion/constants/textes.dart';
import 'package:flavorfusion/Precentation/Screens/logInScreen/logInScreenUI.dart';
import 'package:flutter/material.dart';

class IntroPageTwoUI extends StatelessWidget {
  const IntroPageTwoUI({super.key});

    void _navigatePage(BuildContext context, Widget widget) {
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (BuildContext context) => widget));
    });
  }

  @override
  Widget build(BuildContext context) {
    _navigatePage(context, LogInScreenUI());
    Size _screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: _screenSize.width * 0.9,
          child: Text(introPageTwoText,style: TextStyle(color: secondaryColor,fontWeight: FontWeight.w300,fontSize: _screenSize.width * 0.04),textAlign: TextAlign.center,)),
      ),
    );
  }
}