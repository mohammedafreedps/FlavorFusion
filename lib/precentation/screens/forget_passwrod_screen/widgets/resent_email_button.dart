

import 'package:flavorfusion/constants/colors.dart';
import 'package:flavorfusion/precentation/screens/forget_passwrod_screen/bloc/forget_password_event.dart';
import 'package:flavorfusion/precentation/style_manager/text_style_manager.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/forget_password_bloc.dart';

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
