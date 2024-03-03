import 'package:flavorfusion/constants/colors.dart';
import 'package:flavorfusion/data/temp_value_holder.dart';
import 'package:flavorfusion/precentation/style_manager/text_style_manager.dart';
import 'package:flavorfusion/precentation/widgets/app_bars.dart';
import 'package:flutter/material.dart';

class FirebaseRecipeDetailScreenUI extends StatelessWidget {
  final int index;
  FirebaseRecipeDetailScreenUI({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: appBar(title: ''),
      body: ListView(children: [
        Padding(
            padding: EdgeInsets.only(
                left: _screenSize.width * 0.08,
                right: _screenSize.width * 0.08),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  overflow: TextOverflow.ellipsis,
                  hrecipies[index].recipeTitle,
                  style: TextStyle(
                      color: secondaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: _screenSize.width * 0.05),
                ),
                SizedBox(
                  height: _screenSize.width * 0.02,
                ),
                AspectRatio(
                  aspectRatio: 3 / 2,
                  child: ClipRRect(
                      borderRadius:
                          BorderRadius.circular(_screenSize.width * 0.07),
                      child: SizedBox(
                          child: Image.network(
                        hrecipies[index].imageURL,
                        fit: BoxFit.cover,
                      ))),
                ),
                SizedBox(
                  height: _screenSize.width * 0.02,
                ),
                Divider(),
                SizedBox(
                  height: _screenSize.width * 0.02,
                ),
                Text(
                    overflow: TextOverflow.ellipsis,
                    'Ingredients',
                    style: titleMidiumTextStyle(_screenSize.width)
                        .copyWith(fontSize: _screenSize.width * 0.05)),
                SizedBox(
                  height: _screenSize.width * 0.02,
                ),
                Column(
                  children: _fireIngredientsList(hrecipies[index].ingredients,
                      hrecipies[index].quantitys, _screenSize.width),
                ),
                SizedBox(
                  height: _screenSize.width * 0.02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _cookTime('Prep Time', hrecipies[index].prepTime,
                        _screenSize.width),
                    _cookTime('Cook Time', hrecipies[index].cookTime,
                        _screenSize.width),
                    _cookTime('Total Time', hrecipies[index].totalTime,
                        _screenSize.width)
                  ],
                ),
                SizedBox(
                  height: _screenSize.width * 0.02,
                ),
                Text(
                    overflow: TextOverflow.ellipsis,
                    'Preparation',
                    style: titleMidiumTextStyle(_screenSize.width)
                        .copyWith(fontSize: _screenSize.width * 0.05)),
                SizedBox(
                  height: _screenSize.width * 0.02,
                ),
                Column(
                    children: _firePreparationList(
                        hrecipies[index].instructions, _screenSize.width)),
                Divider(),
                Text(
                  overflow: TextOverflow.ellipsis,
                  'Additional Note',
                  style: titleMidiumTextStyle(_screenSize.width)
                      .copyWith(fontSize: _screenSize.width * 0.05),
                ),
                SizedBox(
                  height: _screenSize.width * 0.04,
                ),
                Text(
                  hrecipies[index].additionalNotes,
                  style: titleSmallTextStyle(_screenSize.width),
                ),
                SizedBox(
                  height: _screenSize.width * 0.04,
                ),
              ],
            )),
      ]),
    );
  }
}

List<Widget> _fireIngredientsList(
    List ingredients, List measure, double screenWidth) {
  List<Widget> ingredientsWidgets = [];
  for (var i = 0; i < ingredients.length; i++) {
    Widget row = Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              ingredients[i],
              style: TextStyle(
                  color: secondaryColor,
                  fontWeight: FontWeight.w300,
                  fontSize: screenWidth * 0.03),
            ),
            Text(
              measure[i],
              style: TextStyle(
                  color: secondaryColor,
                  fontWeight: FontWeight.w300,
                  fontSize: screenWidth * 0.03),
            ),
          ],
        ),
        Divider()
      ],
    );
    ingredientsWidgets.add(row);
  }
  return ingredientsWidgets;
}

List<Widget> _firePreparationList(List instructions, double screenWidth) {
  List<Widget> steps = [];

  for (int i = 0; i < instructions.length; i++) {
    Widget displayStep = ClipRRect(
      borderRadius: BorderRadius.circular(screenWidth * 0.02),
      child: Container(
        width: screenWidth,
        padding: EdgeInsets.all(10),
        color: baseColor,
        child: Text(
          'STEP ${i + 1}',
          style:
              titleSmallTextStyle(screenWidth).copyWith(color: secondaryColor),
        ),
      ),
    );
    steps.add(displayStep);
    steps.add(SizedBox(
      height: screenWidth * 0.03,
    ));
    displayStep = ClipRRect(
      borderRadius: BorderRadius.circular(screenWidth * 0.01),
      child: Container(
        width: screenWidth,
        padding: EdgeInsets.all(10),
        color: baseColor,
        child: Text(
          instructions[i],
          style:
              titleSmallTextStyle(screenWidth).copyWith(color: secondaryColor),
        ),
      ),
    );
    steps.add(displayStep);
    steps.add(SizedBox(
      height: screenWidth * 0.03,
    ));
  }

  return steps;
}

Widget _cookTime(String title, String time, double screenWidth) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(screenWidth * 0.03),
    child: Container(
      color: baseColor,
      padding: EdgeInsets.all(screenWidth * 0.03),
      child: Column(
        children: [
          Text(
            title,
            style: titleSmallTextStyle(screenWidth)
                .copyWith(color: secondaryColor),
          ),
          Text(
            time,
            style: titleSmallTextStyle(screenWidth)
                .copyWith(color: secondaryColor),
          ),
        ],
      ),
    ),
  );
}
