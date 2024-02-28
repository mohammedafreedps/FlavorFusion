

import 'package:flavorfusion/constants/colors.dart';
import 'package:flavorfusion/precentation/screens/discover_screen/bloc/discover_bloc.dart';
import 'package:flavorfusion/precentation/screens/discover_screen/bloc/discover_state.dart';
import 'package:flavorfusion/precentation/widgets/app_bars.dart';
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
          padding: EdgeInsets.only(
              left: _screenSize.width * 0.08, right: _screenSize.width * 0.08),
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
                              child: Image.network(
                            state.mealAPIModels[index].strMealThumb,
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
                      style: TextStyle(
                          color: secondaryColor,
                          fontSize: _screenSize.width * 0.05),
                    ),
                    SizedBox(
                      height: _screenSize.width * 0.02,
                    ),
                    Column(
                      children: _ingredientsList(
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
                        children: _preparationList(
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

List<Widget> _ingredientsList(
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

List<Widget> _preparationList(String preparations, double screenWidth) {
  List<Widget> steps = [];
  bool check = false;
  List<String> step = preparations.split('\r\n');
  for (var i = 0; i < step.length; i++) {
    if(check == false){
      if(step[i].startsWith('STEP')){
      check = true;
     }else{
      steps.add(ClipRRect(
        borderRadius: BorderRadius.circular(screenWidth * 0.02),
        child: Container(
          width: screenWidth,
          padding: EdgeInsets.all(10),
          color: baseColor,
          child: Text(
            'STEP '+(i+1).toString(),
            style: TextStyle(
                color: secondaryColor,
                fontWeight: FontWeight.w300,
                fontSize: screenWidth * 0.03),
          ),
        ),
      ));
      steps.add(SizedBox(height: screenWidth * 0.01));
     }
    }
    
    
    if (step[i].isNotEmpty ) {
      Widget st = ClipRRect(
        borderRadius: BorderRadius.circular(screenWidth * 0.02),
        child: Container(
          width: screenWidth,
          padding: EdgeInsets.all(10),
          color: baseColor,
          child: Text(
            step[i],
            style: TextStyle(
                color: secondaryColor,
                fontWeight: FontWeight.w300,
                fontSize: screenWidth * 0.03),
          ),
        ),
      );
      steps.add(st);
      steps.add(SizedBox(height: screenWidth * 0.04));
    }
  }

  return steps;
}
