import 'package:flavorfusion/constants/colors.dart';
import 'package:flavorfusion/precentation/Screens/create_account_screen/bloc/signup_validation_bloc.dart';
import 'package:flavorfusion/precentation/Screens/create_account_screen/bloc/signup_validation_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Widget button(String text, double screenSize, BuildContext context,
    String email, String password, String repassword) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(70),
    child: GestureDetector(
      onTap: () {
        context.read<SignupValidationBloc>().add(SignUpButtonClickForValidation(
            email: email, password: password, repassword: repassword));
      },
      child: Container(
        width: screenSize * 0.3,
        height: screenSize * 0.12,
        color: baseColor,
        child: Center(
            child: Text(
          text,
          style: TextStyle(
              color: acsentColor,
              fontSize: screenSize * 0.04,
              fontWeight: FontWeight.w400),
        )),
      ),
    ),
  );
}