import 'package:flavorfusion/Constants/colors.dart';
import 'package:flavorfusion/Constants/textes.dart';
import 'package:flavorfusion/Precentation/Widgets/appBars.dart';
import 'package:flutter/material.dart';

class CreatePageUI extends StatelessWidget {
  const CreatePageUI({super.key});

  @override
  Widget build(BuildContext context) {
    Size _screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: appBar(title: 'Create'),
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding:  EdgeInsets.only(left: _screenSize.width*0.1,right: _screenSize.width*0.1),
            child: Text(
              textAlign: TextAlign.center,
              createPageText,
              style: TextStyle(
                  color: secondaryColor,
                  fontWeight: FontWeight.w300,
                  fontSize: _screenSize.width * 0.04),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _button(screenWidth: _screenSize.width, text: 'Doc'),
              _button(screenWidth: _screenSize.width, text: 'Fill in')
            ],
          )
        ],
      ),
    ));
  }
}

Widget _button({required double screenWidth, required String text}) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(70),
    child: GestureDetector(
      onTap: () {},
      child: Container(
        width: screenWidth * 0.3,
        height: screenWidth * 0.12,
        color: baseColor,
        child: Center(
            child: Text(
          text,
          style: TextStyle(
              color: acsentColor,
              fontSize: screenWidth * 0.04,
              fontWeight: FontWeight.w400),
        )),
      ),
    ),
  );
}

