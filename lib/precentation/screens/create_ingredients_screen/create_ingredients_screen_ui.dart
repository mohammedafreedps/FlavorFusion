

import 'package:flavorfusion/constants/colors.dart';
import 'package:flavorfusion/precentation/style_manager/text_style_manager.dart';
import 'package:flavorfusion/precentation/widgets/app_bars.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CreateIngredientsScreenUI extends StatefulWidget {
  const CreateIngredientsScreenUI({super.key});

  @override
  State<CreateIngredientsScreenUI> createState() =>
      _CreateIngredientsScreenUIState();
}

class _CreateIngredientsScreenUIState extends State<CreateIngredientsScreenUI> {
  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: appBar(title: ''),
      body: Padding(
        padding: EdgeInsets.only(
            left: _screenSize.width * 0.1, right: _screenSize.width * 0.1),
        child: SizedBox(
          height: _screenSize.height,
          child: Column(
            children: [
              Text(
                'Enter Ingredients Count',
                style: titleMidiumTextStyle(_screenSize.width)
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: _screenSize.width * 0.2,
                    right: _screenSize.width * 0.2),
                child: ingredientTextField(),
              ),
              SizedBox(height: _screenSize.width*0.1,),
              Expanded(
                child: ListView.builder(
                  itemCount: 7,
                  itemBuilder: (BuildContext context, int index) {
                    return ingredientsAdd(_screenSize.width);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: primaryColor,
        onPressed: (){},child: Icon(Icons.check,color: secondaryColor,),),
    );
  }
}

Widget ingredientTextField() {
  return TextField(
    // controller: controller,
    keyboardType: TextInputType.phone,
    style: TextStyle(color: secondaryColor),
    cursorColor: acsentColor,
    decoration: InputDecoration(
        enabledBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: secondaryColor)),
        focusedBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: secondaryColor))),
  );
}

Widget ingredientsAdd(double screenWidth) {
  return Column(
    children: [
      AspectRatio(
        aspectRatio: 1/1,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(screenWidth * 0.1),
          child: Container(
            color: baseColor,
            width: screenWidth * 0.3,
            height: screenWidth * 0.6,
            child: Padding(
              padding:
                  EdgeInsets.only(left: screenWidth * 0.1, right: screenWidth * 0.1),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Text(
                        'Ingredient',
                        style: titleSmallTextStyle(screenWidth),
                      ),
                      TextField(
                        // controller: controller,
                        keyboardType: TextInputType.phone,
                        style: TextStyle(color: baseColor),
                        cursorColor: primaryColor,
                        decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: primaryColor)),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: primaryColor))),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        'Quantity',
                        style: titleSmallTextStyle(screenWidth),
                      ),
                      TextField(
                        // controller: controller,
                        keyboardType: TextInputType.phone,
                        style: TextStyle(color: baseColor),
                        cursorColor: primaryColor,
                        decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: primaryColor)),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: primaryColor))),
                      ),
                    ],
                  ),
                  IconButton(
                      onPressed: () {}, icon: Icon(color: secondaryColor, Icons.delete))
                ],
              ),
            ),
          ),
        ),
      ),
      SizedBox(height: screenWidth*0.04,)
    ],
  );
}
