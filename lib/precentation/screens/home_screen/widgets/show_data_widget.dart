import 'package:firebase_auth/firebase_auth.dart';
import 'package:flavorfusion/data/repository/recipe_from_firebase_model.dart';
import 'package:flavorfusion/data/temp_value_holder.dart';
import 'package:flavorfusion/precentation/screens/firebase_recipe_detail_screen/firebase_recipe_detail_screen.dart';
import 'package:flavorfusion/precentation/screens/home_screen/widgets/home_tile.dart';
import 'package:flavorfusion/precentation/style_manager/text_style_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

Widget showDataWidget(List<RecipeFromFireBaseModel> recipies, Size screenSize,
    User user, String emptyMessage) {
  return recipies.isEmpty
      ? Center(
          child: Text(
            emptyMessage,
            style: titleSmallTextStyle(screenSize.width),
          ),
        )
      : Animate(
          effects: [
            FadeEffect(
              curve: Curves.easeOut,
            )
          ],
          child: SizedBox(
            height: screenSize.height - 210,
            child: ListView.builder(
                key: const PageStorageKey<String>('page'),
                itemCount: recipies.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    FirebaseRecipeDetailScreenUI(
                                        listOfItem: hrecipies, index: index)));
                      },
                      child: homeTile(
                          context,
                          recipies[index].imageURL,
                          recipies[index].recipeTitle,
                          recipies[index].userEmail,
                          screenSize.width,
                          recipies[index].likes.contains(user.email),
                          recipies[index].wishlist.contains(huser!.email),
                          recipies[index].docId,
                          index));
                }),
          ),
        );
}
