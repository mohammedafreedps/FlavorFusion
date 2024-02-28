

import 'package:flavorfusion/constants/colors.dart';
import 'package:flavorfusion/precentation/Screens/create_account_screen/bloc/signup_validation_bloc.dart';
import 'package:flavorfusion/precentation/Screens/create_account_screen/bloc/signup_validation_event.dart';
import 'package:flavorfusion/precentation/Screens/create_account_screen/bloc/signup_validation_state.dart';
import 'package:flavorfusion/precentation/authentication_bloc/auth_Bloc.dart';
import 'package:flavorfusion/precentation/authentication_bloc/auth_Event.dart';
import 'package:flavorfusion/precentation/authentication_bloc/auth_State.dart';
import 'package:flavorfusion/precentation/style_manager/text_style_manager.dart';
import 'package:flavorfusion/precentation/widgets/app_bars.dart';
import 'package:flavorfusion/precentation/widgets/bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateAccountUI extends StatelessWidget {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _rePasswordController = TextEditingController();
  CreateAccountUI({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: appBar(title: ''),
      body: BlocListener<AuthenticationBloc, AuthenticationBlocState>(
        listener: (context, state) {
          print(state);
          if (state is RegisterErrorState) {
            bottomSheet(
                state.RMessage, context, screenSize.width, screenSize.height);
          }
          if (state is AuthenticationLoadingState) {
            bottomSheet('Creating Account.....', context, screenSize.width,
                screenSize.height);
          }
        },
        child: BlocListener<SignupValidationBloc, SignupValidationState>(
          listener: (context, state) {
            if (state is SignupValidatedState) {
              context.read<AuthenticationBloc>().add(
                  RegisterAccountbuttonclickedEvent(
                      email: _emailController.text,
                      password: _passwordController.text));
            }
            if (state is SignupEmailNotCorrectState) {
              bottomSheet(state.vMessage, context, screenSize.width,
                  screenSize.height);
            }
            if (state is SignupPassowrdNotMatchState) {
              bottomSheet(state.vMessage, context, screenSize.width,
                  screenSize.height);
            }
            if (state is SignupPasswordAndEmailNotenterdState) {
              bottomSheet(state.vMessage, context, screenSize.width,
                  screenSize.height);
            }
            if (state is SignupFailedState) {
              bottomSheet(state.vMessage, context, screenSize.width,
                  screenSize.height);
            }
          },
          child: Padding(
            padding: EdgeInsets.only(
                left: screenSize.width * 0.1,
                right: screenSize.width * 0.1,
                bottom: screenSize.width * 0.03),
            child: Center(
              child: SingleChildScrollView(
                child: SizedBox(
                  height: screenSize.height - 100,
                  width: screenSize.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Register',
                        style: TextStyle(
                            color: secondaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: screenSize.width * 0.1),
                      ),
                      _midLevelTextField(
                          'Email', screenSize.width, false, _emailController),
                      _midLevelTextField('Password', screenSize.width, true,
                          _passwordController),
                      _midLevelTextField('Re-enter Password', screenSize.width,
                          true, _rePasswordController),
                      _button(
                          'Create',
                          screenSize.width,
                          context,
                          _emailController.text,
                          _passwordController.text,
                          _rePasswordController.text),

                     _loginTextButton('Login', screenSize.width,context: context,page: 'login'),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget _midLevelTextField(String text, double screenWidth, bool isTextObscure,
    TextEditingController controller) {
  return Column(
    children: [
      Text(
        text,
        style: TextStyle(
            color: secondaryColor,
            fontWeight: FontWeight.w300,
            fontSize: screenWidth * 0.04),
      ),
      TextField(
        controller: controller,
        keyboardType: TextInputType.emailAddress,
        obscureText: isTextObscure,
        style: TextStyle(color: baseColor),
        cursorColor: baseColor,
        decoration: InputDecoration(
            enabledBorder:
                UnderlineInputBorder(borderSide: BorderSide(color: baseColor)),
            focusedBorder:
                UnderlineInputBorder(borderSide: BorderSide(color: baseColor))),
      )
    ],
  );
}

Widget _button(String text, double screenSize, BuildContext context,
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

Widget _loginTextButton(String text, double screenWidth,
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