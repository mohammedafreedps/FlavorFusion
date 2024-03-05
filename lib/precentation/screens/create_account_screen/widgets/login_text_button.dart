import 'package:flavorfusion/precentation/authentication_bloc/auth_Bloc.dart';
import 'package:flavorfusion/precentation/authentication_bloc/auth_Event.dart';
import 'package:flavorfusion/precentation/style_manager/text_style_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Widget loginTextButton(String text, double screenWidth,
    {BuildContext? context, String? page,Function? function,required}) {
  return GestureDetector(
      onTap: () {
        if(function != null){
          function();
        }else if(context != null && page == 'login'){
          context.read<AuthenticationBloc>().add(BackToLoginButtonClickedEvent());
        }
      }, child: Text(text, style: titleSmallTextStyle(screenWidth)));
}