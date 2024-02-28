

import 'package:flavorfusion/constants/colors.dart';
import 'package:flavorfusion/precentation/screens/log_in_screen/bloc/login_validation_bloc.dart';
import 'package:flavorfusion/precentation/screens/log_in_screen/bloc/login_validation_event.dart';
import 'package:flavorfusion/precentation/style_manager/text_style_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Widget loginButton(String text, double screenWidth, BuildContext context,
    String email, String password, Widget page) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(70),
    child: GestureDetector(
      onTap: () {
        context.read<LoginValidationBloc>().add(LoginButtonPressForValidationEvent(email: email, password: password));
      },
      child: Container(
        width: screenWidth * 0.3,
        height: screenWidth * 0.12,
        color: baseColor,
        child: Center(
            child: Text(
          text,
          style: titleMidiumTextStyle(screenWidth),
        )),
      ),
    ),
  );
}