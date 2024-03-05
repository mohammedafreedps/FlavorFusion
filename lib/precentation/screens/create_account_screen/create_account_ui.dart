import 'package:flavorfusion/constants/colors.dart';
import 'package:flavorfusion/precentation/Screens/create_account_screen/bloc/signup_validation_bloc.dart';
import 'package:flavorfusion/precentation/Screens/create_account_screen/bloc/signup_validation_state.dart';
import 'package:flavorfusion/precentation/authentication_bloc/auth_Bloc.dart';
import 'package:flavorfusion/precentation/authentication_bloc/auth_Event.dart';
import 'package:flavorfusion/precentation/authentication_bloc/auth_State.dart';
import 'package:flavorfusion/precentation/screens/create_account_screen/widgets/button.dart';
import 'package:flavorfusion/precentation/screens/create_account_screen/widgets/login_text_button.dart';
import 'package:flavorfusion/precentation/screens/log_in_screen/Widgets/textFieldText.dart';
import 'package:flavorfusion/precentation/widgets/app_bars.dart';
import 'package:flavorfusion/precentation/widgets/bottom_sheet.dart';
import 'package:flutter/material.dart';
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
              bottomSheet(
                  state.vMessage, context, screenSize.width, screenSize.height);
            }
            if (state is SignupPassowrdNotMatchState) {
              bottomSheet(
                  state.vMessage, context, screenSize.width, screenSize.height);
            }
            if (state is SignupPasswordAndEmailNotenterdState) {
              bottomSheet(
                  state.vMessage, context, screenSize.width, screenSize.height);
            }
            if (state is SignupFailedState) {
              bottomSheet(
                  state.vMessage, context, screenSize.width, screenSize.height);
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
                      midLevelTextField(
                          'Email', screenSize.width, false, _emailController),
                      midLevelTextField('Password', screenSize.width, true,
                          _passwordController),
                      midLevelTextField('Re-enter Password', screenSize.width,
                          true, _rePasswordController),
                      button(
                          'Create',
                          screenSize.width,
                          context,
                          _emailController.text,
                          _passwordController.text,
                          _rePasswordController.text),
                      loginTextButton('Login', screenSize.width,
                          context: context, page: 'login'),
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