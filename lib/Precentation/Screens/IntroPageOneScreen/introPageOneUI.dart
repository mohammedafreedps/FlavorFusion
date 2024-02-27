import 'dart:async';

import 'package:flavorfusion/Constants/colors.dart';
import 'package:flavorfusion/Constants/textes.dart';
import 'package:flavorfusion/Precentation/Screens/introPageTwoScreen/introPageTwoUI.dart';
import 'package:flutter/material.dart';

class IntroPageOneUI extends StatelessWidget {
  const IntroPageOneUI({super.key});

  void _navigatePage(BuildContext context, Widget widget) {
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (BuildContext context) => widget));
    });
  }

  @override
  Widget build(BuildContext context) {
    _navigatePage(context, IntroPageTwoUI());
    Size _screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Text(introPageOneText,style: TextStyle(color: secondaryColor,fontWeight: FontWeight.bold,fontSize: _screenSize.width * 0.04),),
      ),
    );
  }
}
