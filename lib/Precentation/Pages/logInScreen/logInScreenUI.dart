import 'package:flavorfusion/Constants/colors.dart';
import 'package:flavorfusion/Precentation/Pages/AuthenticationBloc/auth_State.dart';
import 'package:flavorfusion/Precentation/Pages/createAccount/createAccountUI.dart';
import 'package:flavorfusion/Precentation/Pages/AuthenticationBloc/auth_Bloc.dart';
import 'package:flavorfusion/Precentation/Pages/AuthenticationBloc/auth_Event.dart';
import 'package:flavorfusion/Precentation/Pages/startingScreen/startingScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LogInScreenUI extends StatelessWidget {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  LogInScreenUI({super.key});

  @override
  Widget build(BuildContext context) {
    Size _screenSize = MediaQuery.of(context).size;
    return BlocListener<AuthenticationBloc, AuthenticationBlocState>(
      listener: (context, state) {
        print(state);
        if (state is IncorrectCredentialState) {
          showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return Container(
                    height: _screenSize.height * 0.07,
                    width: _screenSize.width,
                    color: baseColor,
                    child: Center(
                        child: _lowLevelText(
                            'Incorrect Email or Password', _screenSize.width)));
              });
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
                    if (state is LoadingState) {
                      return CircularProgressIndicator();
                    } else {
                      return Text(
                        'LogIn',
                        style: TextStyle(
                            color: secondaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: _screenSize.width * 0.1),
                      );
                    }
                  },
                ),
                Column(
                  children: [
                    _midLevelTextField(
                        'Email', _screenSize.width, false, _emailController),
                    SizedBox(
                      height: _screenSize.width * 0.06,
                    ),
                    _midLevelTextField('Password', _screenSize.width, true,
                        _passwordController),
                    SizedBox(
                      height: _screenSize.width * 0.06,
                    ),
                    _lowLevelText('Forget Password?', _screenSize.width),
                  ],
                ),
                Column(
                  children: [
                    _button(
                        'Log In',
                        _screenSize.width,
                        context,
                        _emailController.text,
                        _passwordController.text,
                        StartingScreenUI()),
                    SizedBox(
                      height: _screenSize.width * 0.06,
                    ),
                    _lowLevelText('Create Account', _screenSize.width,
                        context: context, page: CreateAccountUI()),
                  ],
                ),
                _logWithGoogle(_screenSize.width)
              ],
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

Widget _lowLevelText(String text, double screenWidth,
    {BuildContext? context, Widget? page}) {
  return GestureDetector(
      onTap: () {},
      child: Text(
        text,
        style: TextStyle(
            color: acsentColor,
            fontWeight: FontWeight.w300,
            fontSize: screenWidth * 0.03),
      ));
}

Widget _button(String text, double screenSize, BuildContext context,
    String email, String password, Widget page) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(70),
    child: GestureDetector(
      onTap: () {
        context.read<AuthenticationBloc>().add(LoginButtonClickedEvent(
            email: email, password: password, page: page));
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

Widget _logWithGoogle(double screenWidth) {
  return Column(
    children: [
      _lowLevelText('Continue With', screenWidth),
      IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(
            'Assets/google.svg',
            width: screenWidth * 0.1,
            height: screenWidth * 0.1,
            color: baseColor,
          ))
    ],
  );
}
