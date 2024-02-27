import 'package:flavorfusion/Constants/colors.dart';
import 'package:flavorfusion/Precentation/Screens/logInScreen/bloc/login_validation_bloc.dart';
import 'package:flavorfusion/Precentation/Screens/logInScreen/bloc/login_validation_event.dart';
import 'package:flavorfusion/Precentation/styleManager/textStyleManager.dart';
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