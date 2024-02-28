import 'package:flavorfusion/precentation/AuthenticationBloc/auth_Bloc.dart';
import 'package:flavorfusion/precentation/AuthenticationBloc/auth_Event.dart';
import 'package:flavorfusion/precentation/Screens/logInScreen/bloc/login_validation_bloc.dart';
import 'package:flavorfusion/precentation/Screens/logInScreen/bloc/login_validation_event.dart';
import 'package:flavorfusion/precentation/styleManager/textStyleManager.dart';
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
        }else if(context != null && page == 'forgetPassword'){
          print('clicked forget');
          context.read<LoginValidationBloc>().add(ForgetPasswordButtonClickedEvent());
        }
      }, child: Text(text, style: titleSmallTextStyle(screenWidth)));
}