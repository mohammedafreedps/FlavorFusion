import 'package:flavorfusion/Constants/colors.dart';
import 'package:flutter/material.dart';

class CreateAccountUI extends StatelessWidget {
  const CreateAccountUI({super.key});

  @override
  Widget build(BuildContext context) {
    Size _screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
            left: _screenSize.width * 0.1,
            right: _screenSize.width * 0.1,
            bottom: _screenSize.width * 0.03),
        child: Center(
          child: SingleChildScrollView(
            child: SizedBox(
              height: _screenSize.height,
              width: _screenSize.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Register',
                    style: TextStyle(
                        color: secondaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: _screenSize.width * 0.1),
                  ),
                  _midLevelTextField('Full Name', _screenSize.width, false),
                  _midLevelTextField('Email', _screenSize.width, false),
                  _midLevelTextField('Username', _screenSize.width, false),
                  _midLevelTextField('Password', _screenSize.width, true),
                  _midLevelTextField('Re-enter Password', _screenSize.width, true),
                  _button('Create', _screenSize.width)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget _midLevelTextField(String text, double screenWidth, bool isTextObscure) {
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

Widget _button(String text, double screenSize) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(70),
    child: GestureDetector(
      onTap: () {
        // context.read<LoginBloc>().add(LoginButtonClickedEvent(email: email, password: password, context: context, page: page));
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
