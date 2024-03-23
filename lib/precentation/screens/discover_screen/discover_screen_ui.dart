import 'package:flavorfusion/constants/colors.dart';
import 'package:flavorfusion/precentation/screens/details_screen/details_screen_UI.dart';
import 'package:flavorfusion/precentation/screens/discover_screen/bloc/discover_bloc.dart';
import 'package:flavorfusion/precentation/screens/discover_screen/bloc/discover_event.dart';
import 'package:flavorfusion/precentation/screens/discover_screen/bloc/discover_state.dart';
import 'package:flavorfusion/precentation/screens/discover_screen/widgets/discover_tile.dart';
import 'package:flavorfusion/precentation/widgets/app_bars.dart';
import 'package:flavorfusion/precentation/widgets/loading_icon_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DiscoverScreenUI extends StatelessWidget {
  final _searchController = TextEditingController();
  DiscoverScreenUI({super.key});

  @override
  Widget build(BuildContext context) {
    Size _screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: appBar(title: 'Discover'),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
                left: _screenSize.width * 0.08,
                right: _screenSize.width * 0.08),
            child: TextField(
              controller: _searchController,
              cursorColor: baseColor,
              onChanged: (text) {
                context
                    .read<DiscoverBloc>()
                    .add(SearchForRecipeEvent(searchKeywork: text.trim()));
              },
              style: TextStyle(color: secondaryColor),
              decoration: InputDecoration(
                  hintText: 'Search for Dishes',
                  hintStyle: TextStyle(
                    color: baseColor,
                  ),
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: baseColor)),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: baseColor))),
            ),
          ),
          SizedBox(
            height: _screenSize.width * 0.05,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(
                  left: _screenSize.width * 0.08,
                  right: _screenSize.width * 0.08),
              child: BlocBuilder<DiscoverBloc, DiscoverState>(
                builder: (context, state) {
                  if (state is PageDiscoverLodingState) {
                    return Center(
                      child: loadingIconAnimation(_screenSize.width)
                    );
                  }
                  if (state is DataFechSuccessState) {
                    return ListView.builder(
                        itemCount: state.mealAPIModels.length,
                        itemBuilder: (BuildContext context, index) {
                          return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            DetailsScreenUI(index: index)));
                              },
                              child: discoverTile(
                                  index,
                                  state.mealAPIModels[index].strMealThumb,
                                  state.mealAPIModels[index].strMeal,
                                  _screenSize.width)).animate(effects: [FadeEffect(curve: Curves.easeOut,)]);
                        });
                  }
                  if (state is DataFechFailedState) {
                    return Center(
                      child: Text(
                        state.error,
                        style: TextStyle(color: secondaryColor),
                      ),
                    );
                  }

                  return Center(
                    child: Text('Discover page'),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
