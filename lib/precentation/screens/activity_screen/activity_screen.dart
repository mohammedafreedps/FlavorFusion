import 'package:flavorfusion/constants/colors.dart';
import 'package:flavorfusion/precentation/screens/activity_screen/bloc/activity_bloc.dart';
import 'package:flavorfusion/precentation/screens/activity_screen/bloc/activity_event.dart';
import 'package:flavorfusion/precentation/screens/activity_screen/bloc/activity_state.dart';
import 'package:flavorfusion/precentation/screens/activity_screen/widgets/activity_tile.dart';
import 'package:flavorfusion/precentation/screens/home_screen/bloc/home_screen_bloc.dart';
import 'package:flavorfusion/precentation/screens/home_screen/bloc/home_screen_event.dart';
import 'package:flavorfusion/precentation/screens/home_screen/bloc/home_screen_state.dart';
import 'package:flavorfusion/precentation/style_manager/text_style_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ActivityScreenUI extends StatelessWidget {
  const ActivityScreenUI({super.key});

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: BlocListener<HomeScreenBloc, HomeScreenState>(
        listener: (context, state) {
          if (state is AllDatasLoadedState) {
            print('add data loadied get in activity page');
            context.read<ActivityBloc>().add(SortAndSetValueEvent());
          }
        },
        child: BlocListener<ActivityBloc, ActivityState>(
          listener: (context, state) {
            if (state is DeletedSuccesfullyState) {
              context.read<HomeScreenBloc>().add(FechDataFromFirebaseEvent());
            }
          },
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: _screenSize.width * 0.1),
            child: BlocBuilder<ActivityBloc, ActivityState>(
              builder: (context, state) {
                if (state is DeletingPostState) {
                  return Center(
                    child: CircularProgressIndicator(
                      color: secondaryColor,
                    ),
                  );
                }
                if (state is SortedValueState) {
                  return state.posted.isEmpty
                      ? Center(
                          child: Text('Nothing to show',style: titleSmallTextStyle(_screenSize.width),),
                        )
                      : ListView.builder(
                          itemCount: state.posted.length,
                          itemBuilder: ((context, index) {
                            return activityTile(
                                context,
                                _screenSize.width,
                                state.posted[index].imageURL,
                                state.posted[index].recipeTitle,
                                index,
                                state.posted);
                          }));
                } else {
                  return Center(
                    child: CircularProgressIndicator(
                      color: secondaryColor,
                    ),
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
