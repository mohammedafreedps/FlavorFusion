import 'package:flavorfusion/precentation/AuthenticationBloc/auth_Event.dart';
import 'package:flavorfusion/precentation/AuthenticationBloc/auth_State.dart';
import 'package:flavorfusion/precentation/AuthenticationBloc/auth_Bloc.dart';
import 'package:flavorfusion/precentation/Screens/forgetPasswrodScreen/forgetPasswordScreenUi.dart';
import 'package:flavorfusion/precentation/Widgets/bottomSheet.dart';
import 'package:flavorfusion/precentation/Screens/logInScreen/Widgets/loginButton.dart';
import 'package:flavorfusion/precentation/Screens/logInScreen/Widgets/loginWithGoogleButton.dart';
import 'package:flavorfusion/precentation/Screens/logInScreen/Widgets/textButton.dart';
import 'package:flavorfusion/precentation/Screens/logInScreen/Widgets/textFieldText.dart';
import 'package:flavorfusion/precentation/Screens/logInScreen/bloc/login_validation_bloc.dart';
import 'package:flavorfusion/precentation/Screens/logInScreen/bloc/login_validation_state.dart';
import 'package:flavorfusion/precentation/Screens/startingScreen/startingScreen.dart';
import 'package:flavorfusion/precentation/styleManager/textStyleManager.dart';
import 'package:flutter/material.dart';
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
            context.read<AuthenticationBloc>().add(LoginButtonClickedEvent(email: _emailController.text, password: _passwordController.text, page: Placeholder()));
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
          if (state is NavigatePageToForgetPasswordScreenEvent){
            Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>ForgetPasswordScreenUI()));
          }
        },
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Padding(
            padding: EdgeInsets.only(
                left: _screenSize.width * 0.1,
                right: _screenSize.width * 0.1,
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
                            style: titleLargeBoldTextStyle(_screenSize.width));
                      }
                    },
                  ),
                  Column(
                    children: [
                      midLevelTextField(
                          'Email', _screenSize.width, false, _emailController),
                      SizedBox(
                        height: _screenSize.width * 0.06,
                      ),
                      midLevelTextField('Password', _screenSize.width, true,
                          _passwordController),
                      SizedBox(
                        height: _screenSize.width * 0.06,
                      ),
                      textButton('Forget Password?', _screenSize.width,page: 'forgetPassword',context: context),
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
                          StartingScreenUI()),
                      SizedBox(
                        height: _screenSize.width * 0.06,
                      ),
                      textButton('Create Account', _screenSize.width,
                          context: context, page: 'createAccount'),
                    ],
                  ),
                  logWithGoogleButton(_screenSize.width, context)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
