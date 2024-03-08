import 'package:flavorfusion/constants/colors.dart';
import 'package:flavorfusion/precentation/screens/home_screen/bloc/home_screen_bloc.dart';
import 'package:flavorfusion/precentation/screens/home_screen/bloc/home_screen_event.dart';
import 'package:flavorfusion/precentation/screens/saved_recipies/bloc/saved_recipes_bloc.dart';
import 'package:flavorfusion/precentation/screens/saved_recipies/bloc/saved_recipes_event.dart';
import 'package:flavorfusion/precentation/screens/saved_recipies/bloc/saved_recipes_state.dart';
import 'package:flavorfusion/precentation/screens/saved_recipies/widgets/saved_recipie_tile.dart';
import 'package:flavorfusion/precentation/style_manager/text_style_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SavedRecipesUI extends StatelessWidget {
  const SavedRecipesUI({super.key});

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    return Scaffold(
        body: BlocListener<SavedRecipesBloc, SavedRecipesState>(
      listener: (context, state) {
        if (state is RemovedSavedRecipeState){
          context.read<HomeScreenBloc>().add(FechDataFromFirebaseEvent());
          context.read<SavedRecipesBloc>().add(LoadDataInSavedRecipieEvent());
        }
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: _screenSize.width * 0.1),
        child: BlocBuilder<SavedRecipesBloc, SavedRecipesState>(
          builder: (context, state) {
            if (state is SavedRecipesListState) {
              return state.savedRecipes.isEmpty ? Center(child: Text('You havnt save any Recipes',style: titleSmallTextStyle(_screenSize.width),),) : ListView.builder(
                  itemCount: state.savedRecipes.length,
                  itemBuilder: (context, index) {
                    return saverRecipeTile(
                        context,
                        _screenSize.width,
                        state.savedRecipes[index].imageURL,
                        state.savedRecipes[index].recipeTitle,
                        index,
                        state.savedRecipes[index].docId);
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
    ));
  }
}
