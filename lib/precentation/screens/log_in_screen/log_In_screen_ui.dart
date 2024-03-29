import 'package:flavorfusion/precentation/authentication_bloc/auth_Bloc.dart';
import 'package:flavorfusion/precentation/authentication_bloc/auth_Event.dart';
import 'package:flavorfusion/precentation/authentication_bloc/auth_State.dart';
import 'package:flavorfusion/precentation/screens/forget_passwrod_screen/forget_password_screen_UI.dart';
import 'package:flavorfusion/precentation/screens/log_in_screen/Widgets/loginButton.dart';
import 'package:flavorfusion/precentation/screens/log_in_screen/Widgets/loginWithGoogleButton.dart';
import 'package:flavorfusion/precentation/screens/log_in_screen/Widgets/textButton.dart';
import 'package:flavorfusion/precentation/screens/log_in_screen/Widgets/textFieldText.dart';
import 'package:flavorfusion/precentation/screens/log_in_screen/bloc/login_validation_bloc.dart';
import 'package:flavorfusion/precentation/screens/log_in_screen/bloc/login_validation_state.dart';
import 'package:flavorfusion/precentation/screens/starting_screen/starting_screen.dart';
import 'package:flavorfusion/precentation/style_manager/text_style_manager.dart';
import 'package:flavorfusion/precentation/widgets/bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LogInScreenUI extends StatelessWidget {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  LogInScreenUI({super.key});

  @override
  Widget build(BuildContext context) {
    Size _screenSize = MediaQuery.of(context).size;
    
    return BlocListener<AuthenticationBloc, AuthenticationBlocState>(
      listener: (context, state) {
        if (state is IncorrectCredentialState) {}
      },
      child: BlocListener<LoginValidationBloc, LoginValidationState>(
        listener: (context, state) {
          if (state is ValidatedState) {
            context.read<AuthenticationBloc>().add(LoginButtonClickedEvent(
                email: _emailController.text,
                password: _passwordController.text,
                page: Placeholder()));
          }
          if (state is EmailPasswordnotinputedState) {
            bottomSheet(
                state.vMessage, context, _screenSize.width, _screenSize.height);
          }
          if (state is EmailnotinputedState) {
            bottomSheet(
                state.vMessage, context, _screenSize.width, _screenSize.height);
          }
          if (state is PasswordnotinputedState) {
            bottomSheet(
                state.vMessage, context, _screenSize.width, _screenSize.height);
          }
          if (state is EmailnotFormattedState) {
            bottomSheet(
                state.vMessage, context, _screenSize.width, _screenSize.height);
          }
          if (state is NavigatePageToForgetPasswordScreenEvent) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) =>
                        ForgetPasswordScreenUI()));
          }
        },
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Padding(
            padding: EdgeInsets.only(
                left: _screenSize.width * 0.04,
                right: _screenSize.width * 0.04,
                bottom: _screenSize.width * 0.03),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(),
                  BlocBuilder<AuthenticationBloc, AuthenticationBlocState>(
                    builder: (context, state) {
                      if (state is AuthenticationLoadingState) {
                        return CircularProgressIndicator();
                      } else {
                        return Text('LogIn',
                                style:
                                    titleLargeBoldTextStyle(_screenSize.width))
                            .animate(effects: [FadeEffect()]);
                      }
                    },
                  ),
                  Column(
                    children: [
                      midLevelTextField('Email', _screenSize.width, false,
                              _emailController)
                          .animate(effects: [FadeEffect()]),
                      SizedBox(
                        height: _screenSize.width * 0.06,
                      ),
                      midLevelTextField('Password', _screenSize.width, true,
                              _passwordController)
                          .animate(effects: [FadeEffect()]),
                      SizedBox(
                        height: _screenSize.width * 0.06,
                      ),
                      textButton('Forget Password?', _screenSize.width,
                              page: 'forgetPassword', context: context)
                          .animate(effects: [FadeEffect()]),
                    ],
                  ),
                  Column(
                    children: [
                      loginButton(
                              'Log In',
                              _screenSize.width,
                              context,
                              _emailController.text,
                              _passwordController.text,
                              StartingScreenUI())
                          .animate(effects: [FadeEffect()]),
                      SizedBox(
                        height: _screenSize.width * 0.06,
                      ),
                      textButton('Create Account', _screenSize.width,
                              context: context, page: 'createAccount')
                          .animate(effects: [FadeEffect()]),
                    ],
                  ),
                  logWithGoogleButton(_screenSize.width, context)
                      .animate(effects: [FadeEffect()])
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
