import 'package:flavorfusion/constants/colors.dart';
import 'package:flavorfusion/precentation/screens/home_screen/bloc/home_screen_bloc.dart';
import 'package:flavorfusion/precentation/screens/home_screen/bloc/home_screen_state.dart';
import 'package:flavorfusion/precentation/screens/home_screen/widgets/grid_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future filterSelector(BuildContext context, double screenWidth) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(screenWidth * 0.05),
            child: Container(
                padding: EdgeInsets.all(screenWidth * 0.05),
                color: baseColor,
                height: screenWidth * 0.7,
                width: screenWidth * 0.3,
                child: BlocBuilder<HomeScreenBloc, HomeScreenState>(
                  builder: (context, state) {
                    if (state is CategorySearchResultsState) {
                      return gridTile(context, screenWidth);
                    }
                    return gridTile(context, screenWidth);
                  },
                )),
          ),
        );
      });
}
