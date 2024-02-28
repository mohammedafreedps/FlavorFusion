

import 'package:flavorfusion/Constants/textes.dart';
import 'package:flavorfusion/precentation/screens/forget_passwrod_screen/Widgets/resent_email_button.dart';
import 'package:flavorfusion/precentation/screens/forget_passwrod_screen/Widgets/reset_email_textfield.dart';
import 'package:flavorfusion/precentation/screens/forget_passwrod_screen/bloc/forget_password_bloc.dart';
import 'package:flavorfusion/precentation/screens/forget_passwrod_screen/bloc/forget_password_state.dart';
import 'package:flavorfusion/precentation/style_manager/text_style_manager.dart';
import 'package:flavorfusion/precentation/widgets/app_bars.dart';
import 'package:flavorfusion/precentation/widgets/bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgetPasswordScreenUI extends StatelessWidget {
  final _passwordResetEmailController = TextEditingController();
  ForgetPasswordScreenUI({super.key});

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: appBar(title: ''),
      body: BlocListener<ForgetPasswordBloc, ForgetPasswordState>(
        listener: (context, state) {
          if(state is ResentEmailIsEmptyState){
            bottomSheet(state.message, context, _screenSize.width, _screenSize.height);
          }
          if(state is ResentEmailFormatNotCorrectState){
            bottomSheet(state.message, context, _screenSize.width, _screenSize.height);
          }
          if(state is EmailSentErrorState){
            bottomSheet(state.message, context, _screenSize.width, _screenSize.height);
          }
          if(state is EmailSentedSuccesState){
            bottomSheet(state.message, context, _screenSize.width, _screenSize.height);
          }
        },
        child: Padding(
          padding: EdgeInsets.all(_screenSize.width * 0.1),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                forgetPasswordText,
                textAlign: TextAlign.center,
                style: titleMidiumTextStyle(_screenSize.width),
              ),
              resetEmailTextField(_passwordResetEmailController),
              resetEmailButton(context, _passwordResetEmailController.text,
                  _screenSize.width)
            ],
          ),
        ),
      ),
    );
  }
}
