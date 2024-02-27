import 'package:flavorfusion/Precentation/AuthenticationBloc/auth_Bloc.dart';
import 'package:flavorfusion/Precentation/AuthenticationBloc/auth_Event.dart';
import 'package:flavorfusion/Precentation/styleManager/textStyleManager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Widget textButton(String text, double screenWidth,
    {BuildContext? context, String? page,Function? function,required}) {
  return GestureDetector(
      onTap: () {
        if(function != null){
          function();
        }else if(context != null && page == 'createAccount'){
          context.read<AuthenticationBloc>().add(SigninButtonClickedEvent());
        }
      }, child: Text(text, style: titleSmallTextStyle(screenWidth)));
}