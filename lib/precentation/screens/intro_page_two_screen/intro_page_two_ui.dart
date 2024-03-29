

import 'dart:async';

import 'package:flavorfusion/Constants/textes.dart';
import 'package:flavorfusion/constants/colors.dart';
import 'package:flavorfusion/precentation/authentication_bloc/auth_Bloc.dart';
import 'package:flavorfusion/precentation/authentication_bloc/auth_Event.dart';
import 'package:flavorfusion/precentation/screens/intro_page_two_screen/function/first_time_login.dart';
import 'package:flavorfusion/precentation/screens/log_in_screen/log_In_screen_UI.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class IntroPageTwoUI extends StatelessWidget {
  const IntroPageTwoUI({super.key});

    void _navigatePage(BuildContext context, Widget widget) {
    Timer(Duration(seconds: 3), () {
      firstTimeLogin();
      context.read<AuthenticationBloc>().add(BackToLoginButtonClickedEvent());
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
          child: Text(introPageTwoText,style: TextStyle(color: secondaryColor,fontWeight: FontWeight.w300,fontSize: _screenSize.width * 0.04),textAlign: TextAlign.center,).animate(effects: [FadeEffect()])),
      ),
    );
  }
}