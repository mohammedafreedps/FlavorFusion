import 'package:flavorfusion/constants/colors.dart';
import 'package:flavorfusion/precentation/Screens/forgetPasswrodScreen/bloc/forget_password_bloc.dart';
import 'package:flavorfusion/precentation/Screens/forgetPasswrodScreen/bloc/forget_password_event.dart';
import 'package:flavorfusion/precentation/styleManager/textStyleManager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Widget resetEmailButton(BuildContext context,String email,double screenWidth) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(70),
    child: GestureDetector(
      onTap: () {
        context.read<ForgetPasswordBloc>().add(SentEmailButtonClickedEvent(email: email));
      },
      child: Container(
        width: screenWidth * 0.3,
        height: screenWidth * 0.12,
        color: baseColor,
        child: Center(
            child: Text(
          'Sent',
          style: titleMidiumTextStyle(screenWidth),
        )),
      ),
    ),
  );
}
