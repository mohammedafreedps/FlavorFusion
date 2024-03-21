import 'package:flavorfusion/constants/colors.dart';
import 'package:flavorfusion/data/temp_value_holder.dart';
import 'package:flavorfusion/precentation/screens/home_screen/bloc/home_screen_bloc.dart';
import 'package:flavorfusion/precentation/screens/home_screen/bloc/home_screen_event.dart';
import 'package:flavorfusion/precentation/screens/home_screen/bloc/home_screen_state.dart';
import 'package:flavorfusion/precentation/screens/home_screen/widgets/fileter_selecter.dart';
import 'package:flavorfusion/precentation/screens/home_screen/widgets/show_data_widget.dart';
import 'package:flavorfusion/precentation/screens/profile_screen/bloc/profile_bloc.dart';
import 'package:flavorfusion/precentation/screens/profile_screen/bloc/profile_event.dart';
import 'package:flavorfusion/precentation/screens/saved_recipies/bloc/saved_recipes_bloc.dart';
import 'package:flavorfusion/precentation/screens/saved_recipies/bloc/saved_recipes_event.dart';
import 'package:flavorfusion/precentation/widgets/app_bars.dart';
import 'package:flavorfusion/precentation/widgets/loading_icon_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreenUI extends StatelessWidget {
  HomeScreenUI({super.key});

  final _searchController = TextEditingController();

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
            context.read<ProfileBloc>().add(CountTotalLikeandPostEvent());
          }),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: _screenSize.width * 0.1),
          child: Column(
            children: [
              Row(
                children: [
                  SizedBox(
                    width: _screenSize.width * 0.68,
                    child: TextField(
                      controller: _searchController,
                      cursorColor: baseColor,
                      onChanged: (text) {
                        if (_searchController.text.isEmpty) {
                          context
                              .read<HomeScreenBloc>()
                              .add(FechDataFromFirebaseEvent());
                        }
                        context
                            .read<HomeScreenBloc>()
                            .add(SearchingEvent(query: _searchController.text));
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
                  IconButton(
                      onPressed: () {
                        filterSelector(context, _screenSize.width);
                      },
                      icon: Icon(
                        Icons.filter_list_alt,
                        color: secondaryColor,
                      )).animate(effects: [ScaleEffect()])
                ],
              ),
              SizedBox(
                height: _screenSize.width * 0.05,
              ),
              BlocBuilder<HomeScreenBloc, HomeScreenState>(
                builder: (context, state) {
                  if (state is AllDatasLoadedState) {
                    context
                        .read<ProfileBloc>()
                        .add(CountTotalLikeandPostEvent());
                    return huser != null ? showDataWidget(hrecipies, _screenSize, huser!,
                        'Be the First One to add') : Text('');
                  }
                  if (state is SearchRecipieResultState) {
                    return showDataWidget(state.searchResults, _screenSize,
                        huser!, 'Item not found');
                  }
                  if (state is CategorySearchResultsState) {
                    return showDataWidget(state.searchResults, _screenSize,
                        huser!, 'Item not found');
                  }
                  return Padding(
                    padding: EdgeInsets.only(top: _screenSize.height * 0.35),
                    child: loadingIconAnimation(_screenSize.width)
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
