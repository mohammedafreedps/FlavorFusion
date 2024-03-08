import 'package:flavorfusion/constants/colors.dart';
import 'package:flavorfusion/data/temp_value_holder.dart';
import 'package:flavorfusion/precentation/screens/firebase_recipe_detail_screen/firebase_recipe_detail_screen.dart';
import 'package:flavorfusion/precentation/screens/home_screen/bloc/home_screen_bloc.dart';
import 'package:flavorfusion/precentation/screens/home_screen/bloc/home_screen_event.dart';
import 'package:flavorfusion/precentation/screens/home_screen/bloc/home_screen_state.dart';
import 'package:flavorfusion/precentation/screens/home_screen/widgets/home_tile.dart';
import 'package:flavorfusion/precentation/screens/saved_recipies/bloc/saved_recipes_bloc.dart';
import 'package:flavorfusion/precentation/screens/saved_recipies/bloc/saved_recipes_event.dart';
import 'package:flavorfusion/precentation/style_manager/text_style_manager.dart';
import 'package:flavorfusion/precentation/widgets/app_bars.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreenUI extends StatelessWidget {
  const HomeScreenUI({super.key});

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: appBar(
          title: 'Home',
          icon: Icon(
            Icons.restart_alt,
            color: secondaryColor,
          ),
          needAction: true,
          function: () {
            context.read<HomeScreenBloc>().add(FechDataFromFirebaseEvent());
            context.read<SavedRecipesBloc>().add(LoadDataInSavedRecipieEvent());
          }),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: _screenSize.width * 0.1),
        child: Center(
          child: BlocBuilder<HomeScreenBloc, HomeScreenState>(
            builder: (context, state) {
              if (state is AllDatasLoadedState) {
                return state.recipies.isEmpty
                    ? Center(
                        child: Text(
                          'Be the First to add Recipie',
                          style: titleSmallTextStyle(_screenSize.width),
                        ),
                      )
                    : ListView.builder(
                        key: const PageStorageKey<String>('page'),
                        itemCount: state.recipies.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            FirebaseRecipeDetailScreenUI(
                                                index: index)));
                              },
                              child: homeTile(
                                  context,
                                  state.recipies[index].imageURL,
                                  state.recipies[index].recipeTitle,
                                  state.recipies[index].userEmail,
                                  _screenSize.width,
                                  state.recipies[index].likes
                                      .contains(huser!.email),
                                  state.recipies[index].wishlist
                                      .contains(huser!.email),
                                  state.recipies[index].docId,
                                  index));
                        });
              }
              return Center(
                child: CircularProgressIndicator(
                  color: secondaryColor,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
