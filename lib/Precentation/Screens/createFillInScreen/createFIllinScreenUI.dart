import 'package:flavorfusion/constants/colors.dart';
import 'package:flavorfusion/precentation/Screens/createIngredientsScreen/createIngredientsScreenUI.dart';
import 'package:flavorfusion/precentation/Widgets/appBars.dart';
import 'package:flavorfusion/precentation/styleManager/textStyleManager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CreateFIllinScreenUI extends StatefulWidget {
  const CreateFIllinScreenUI({super.key});

  @override
  State<CreateFIllinScreenUI> createState() => _CreateFIllinScreenUIState();
}

class _CreateFIllinScreenUIState extends State<CreateFIllinScreenUI> {
  double _currentSliderValue = 0;
  @override
  Widget build(BuildContext context) {
    Size _screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: appBar(title: ''),
      body: Padding(
        padding: EdgeInsets.only(
            left: _screenSize.width * 0.1, right: _screenSize.width * 0.1),
        child: ListView(children: [
          SizedBox(
            height: _screenSize.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Select Image',
                  style: titleMidiumTextStyle(_screenSize.width),
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      createButtonOne('Camra', context, _screenSize.width),
                      createButtonOne('Gallary', context, _screenSize.width)
                    ]),
                Column(
                  children: [
                    Text(
                      'Recipe Title',
                      style: titleMidiumTextStyle(_screenSize.width),
                    ),
                    createTextField(),
                  ],
                ),
                createButtonTwo('Ingredients >', context, _screenSize.width,page: CreateIngredientsScreenUI()),
                createButtonTwo('Instructions >', context, _screenSize.width),
                createButtonTwo('Cooking Time >', context, _screenSize.width),
                Column(
                  children: [
                    Text(
                      'Difficulty Level',
                      style: titleMidiumTextStyle(_screenSize.width),
                    ),
                    Slider(
                        divisions: null,
                        thumbColor: baseColor,
                        activeColor: baseColor,
                        inactiveColor: secondaryColor,
                        min: 0,
                        max: 5,
                        value: _currentSliderValue,
                        onChanged: (value) {
                          setState(() {
                            _currentSliderValue = value;
                            print(_currentSliderValue);
                          });
                        }),
                    _currentSliderValue > 0 ? Text(
                      _currentSliderValue.round().toString(),
                      style: titleSmallTextStyle(_screenSize.width),
                    ):const Text('')
                  ],
                ),
                Column(
                  children: [
                    Text(
                      'Additional Notes',
                      style: titleMidiumTextStyle(_screenSize.width),
                    ),
                    createTextField(),
                  ],
                ),
                createButtonOne('Upload', context, _screenSize.width)
              ],
            ),
          ),
        ]),
      ),
    );
  }
}

Widget createButtonOne(
  String text,
  BuildContext context,
  double screenWidth,
) {
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

Widget createButtonTwo(
  String text,
  BuildContext context,
  double screenWidth,
  {Widget? page}
) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(70),
    child: GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context)=>page!));
      },
      child: Container(
        width: screenWidth * 0.4,
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

Widget createTextField() {
  return TextField(
    // controller: controller,
    keyboardType: TextInputType.emailAddress,
    style: TextStyle(color: baseColor),
    cursorColor: baseColor,
    decoration: InputDecoration(
        enabledBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: baseColor)),
        focusedBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: baseColor))),
  );
}


