import 'package:cached_network_image/cached_network_image.dart';
import 'package:flavorfusion/constants/colors.dart';
import 'package:flavorfusion/precentation/screens/details_screen/widgets/ingredients_list.dart';
import 'package:flavorfusion/precentation/screens/details_screen/widgets/preparation_list.dart';
import 'package:flavorfusion/precentation/screens/discover_screen/bloc/discover_bloc.dart';
import 'package:flavorfusion/precentation/screens/discover_screen/bloc/discover_state.dart';
import 'package:flavorfusion/precentation/widgets/app_bars.dart';
import 'package:flavorfusion/precentation/widgets/image_place_holder_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailsScreenUI extends StatelessWidget {
  final int index;
  DetailsScreenUI({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: appBar(title: ''),
      body: ListView(children: [
        Padding(
          padding: EdgeInsets.symmetric( horizontal: _screenSize.width * 0.04,),
          child: BlocBuilder<DiscoverBloc, DiscoverState>(
            builder: (context, state) {
              if (state is DataFechSuccessState) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      overflow: TextOverflow.ellipsis,
                      state.mealAPIModels[index].strMeal,
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
                                fit: BoxFit.cover,
                                imageUrl:
                                    state.mealAPIModels[index].strMealThumb,
                                placeholder: (context, url) =>
                                    imagePlaceHolderText(_screenSize.width)),
                          )),
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
                      style: TextStyle(
                          color: secondaryColor,
                          fontSize: _screenSize.width * 0.05),
                    ),
                    SizedBox(
                      height: _screenSize.width * 0.02,
                    ),
                    Column(
                      children: ingredientsList(
                          state.mealAPIModels[index].strIngredients,
                          state.mealAPIModels[index].strMeasures,
                          _screenSize.width),
                    ),
                    SizedBox(
                      height: _screenSize.width * 0.02,
                    ),
                    Text(
                      overflow: TextOverflow.ellipsis,
                      'Preparation',
                      style: TextStyle(
                          color: secondaryColor,
                          fontSize: _screenSize.width * 0.05),
                    ),
                    SizedBox(
                      height: _screenSize.width * 0.02,
                    ),
                    Column(
                        children: preparationList(
                            state.mealAPIModels[index].strInstructions,
                            _screenSize.width))
                  ],
                );
              }
              return Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ),
      ]),
    );
  }
}
