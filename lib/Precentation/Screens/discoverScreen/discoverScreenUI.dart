import 'package:flavorfusion/Constants/colors.dart';
import 'package:flavorfusion/precentation/Screens/detailsScreen/detailsScreenUI.dart';
import 'package:flavorfusion/precentation/Screens/discoverScreen/bloc/discover_bloc.dart';
import 'package:flavorfusion/precentation/Screens/discoverScreen/bloc/discover_event.dart';
import 'package:flavorfusion/precentation/Screens/discoverScreen/bloc/discover_state.dart';
import 'package:flavorfusion/precentation/Widgets/appBars.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
              style: TextStyle(color: baseColor),
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
                      child: CircularProgressIndicator(
                        color: secondaryColor,
                      ),
                    );
                  }
                  if (state is DataFechSuccessState) {
                    return ListView.builder(
                        itemCount: state.mealAPIModels.length,
                        itemBuilder: (BuildContext context, index) {
                          return GestureDetector(
                              onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailsScreenUI(index: index)));},
                              child: _discoverTile(
                                  state.mealAPIModels[index].strMealThumb,
                                  state.mealAPIModels[index].strMeal,
                                  _screenSize.width));
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

Widget _discoverTile(String src, String title, double screenWidth) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 10),
    child: AspectRatio(
      aspectRatio: 1 / 1,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(screenWidth * 0.06),
        child: Container(
          padding: EdgeInsets.all(30),
          height: 100,
          color: baseColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: 1.2,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(screenWidth * 0.06),
                  child: Container(
                    color: baseColor,
                    child: Image.network(
                      src,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Text(
                overflow: TextOverflow.ellipsis,
                title,
                style: TextStyle(
                    color: secondaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: screenWidth * 0.04),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
