import 'package:cached_network_image/cached_network_image.dart';
import 'package:flavorfusion/constants/colors.dart';
import 'package:flavorfusion/precentation/screens/firebase_recipe_detail_screen/widgets/cook_time.dart';
import 'package:flavorfusion/precentation/screens/firebase_recipe_detail_screen/widgets/fire_ingredients_list.dart';
import 'package:flavorfusion/precentation/screens/firebase_recipe_detail_screen/widgets/fire_preperation_list.dart';
import 'package:flavorfusion/precentation/style_manager/text_style_manager.dart';
import 'package:flavorfusion/precentation/widgets/app_bars.dart';
import 'package:flavorfusion/precentation/widgets/image_place_holder_text.dart';
import 'package:flutter/material.dart';

class FirebaseRecipeDetailScreenUI extends StatelessWidget {
  final int index;
  final List listOfItem;
  FirebaseRecipeDetailScreenUI(
      {super.key, required this.index, required this.listOfItem});

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: appBar(title: ''),
      body: ListView(children: [
        Padding(
            padding: EdgeInsets.symmetric( horizontal: _screenSize.width * 0.04,),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  listOfItem[index].recipeTitle,
                  overflow: TextOverflow.ellipsis,
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
                          child: CachedNetworkImage(
                        imageUrl: listOfItem[index].imageURL,
                        placeholder: (context, url) =>
                            imagePlaceHolderText(_screenSize.width),
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
                  children: fireIngredientsList(listOfItem[index].ingredients,
                      listOfItem[index].quantitys, _screenSize.width),
                ),
                SizedBox(
                  height: _screenSize.width * 0.02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    cookTime('Prep Time', listOfItem[index].prepTime,
                        _screenSize.width),
                    cookTime('Cook Time', listOfItem[index].cookTime,
                        _screenSize.width),
                    cookTime('Total Time', listOfItem[index].totalTime,
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
                        listOfItem[index].instructions, _screenSize.width)),
                Divider(),
                listOfItem[index].additionalNotes != 'Nil'
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
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
                            listOfItem[index].additionalNotes,
                            style: titleSmallTextStyle(_screenSize.width),
                          ),
                          SizedBox(
                            height: _screenSize.width * 0.04,
                          ),
                        ],
                      )
                    : Text('')
              ],
            )),
      ]),
    );
  }
}
