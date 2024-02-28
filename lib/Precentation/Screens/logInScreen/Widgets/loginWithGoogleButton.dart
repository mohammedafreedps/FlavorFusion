
import 'package:flavorfusion/constants/colors.dart';
import 'package:flavorfusion/precentation/AuthenticationBloc/auth_Bloc.dart';
import 'package:flavorfusion/precentation/AuthenticationBloc/auth_Event.dart';
import 'package:flavorfusion/precentation/styleManager/textStyleManager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

Widget logWithGoogleButton(double screenWidth,BuildContext context) {
  return Column(
    children: [
      Text('Continue With', style: titleSmallTextStyle(screenWidth),),
      IconButton(
          onPressed: () {
            context.read<AuthenticationBloc>().add(LogginWithGooogleButtonClickedEvent());
          },
          icon: SvgPicture.asset(
            'Assets/google.svg',
            width: screenWidth * 0.1,
            height: screenWidth * 0.1,
            color: baseColor,
          ))
    ],
  );
}