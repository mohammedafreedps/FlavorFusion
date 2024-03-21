import 'dart:async';
import 'package:flavorfusion/Constants/textes.dart';
import 'package:flavorfusion/constants/colors.dart';
import 'package:flavorfusion/precentation/authentication_bloc/auth_Bloc.dart';
import 'package:flavorfusion/precentation/authentication_bloc/auth_Event.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class IntroPageOneUI extends StatelessWidget {
  const IntroPageOneUI({super.key});

  void _navigatePage(BuildContext context) {
    Timer(Duration(seconds: 3), () {
      context.read<AuthenticationBloc>().add(ShowIntroPageTwoEvent());
    });
  }

  @override
  Widget build(BuildContext context) {
    _navigatePage(context);
    Size _screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Text(introPageOneText,style: TextStyle(color: secondaryColor,fontWeight: FontWeight.bold,fontSize: _screenSize.width * 0.04),).animate(effects: [FadeEffect()]),
      ),
    );
  }
}
