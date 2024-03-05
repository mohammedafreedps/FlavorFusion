import 'package:flavorfusion/constants/colors.dart';
import 'package:flavorfusion/data/temp_value_holder.dart';
import 'package:flavorfusion/precentation/screens/firebase_recipe_detail_screen/widgets/cook_time.dart';
import 'package:flavorfusion/precentation/screens/firebase_recipe_detail_screen/widgets/fire_ingredients_list.dart';
import 'package:flavorfusion/precentation/screens/firebase_recipe_detail_screen/widgets/fire_preperation_list.dart';
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
                  children: fireIngredientsList(hrecipies[index].ingredients,
                      hrecipies[index].quantitys, _screenSize.width),
                ),
                SizedBox(
                  height: _screenSize.width * 0.02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    cookTime('Prep Time', hrecipies[index].prepTime,
                        _screenSize.width),
                    cookTime('Cook Time', hrecipies[index].cookTime,
                        _screenSize.width),
                    cookTime('Total Time', hrecipies[index].totalTime,
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
                    children: firePreparationList(
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
