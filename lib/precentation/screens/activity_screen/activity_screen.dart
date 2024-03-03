import 'package:flavorfusion/constants/colors.dart';
import 'package:flavorfusion/data/repository/recipe_from_firebase_model.dart';
import 'package:flavorfusion/precentation/screens/activity_screen/bloc/activity_bloc.dart';
import 'package:flavorfusion/precentation/screens/activity_screen/bloc/activity_event.dart';
import 'package:flavorfusion/precentation/screens/activity_screen/bloc/activity_state.dart';
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
                  return ListView.builder(
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

Widget activityTile(BuildContext context, double screenWidth, String src,
    String title, int index, List<RecipeFromFireBaseModel> recipes) {
  return Padding(
    padding: EdgeInsets.only(bottom: screenWidth * 0.05),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(screenWidth * 0.05),
      child: Container(
        padding: EdgeInsets.all(screenWidth * 0.03),
        color: baseColor,
        width: double.infinity,
        height: screenWidth * 0.41,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: screenWidth * 0.3,
                  height: screenWidth * 0.3 / 1.3,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(screenWidth * 0.06),
                    child: Image.network(
                      src,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Text(
                  overflow: TextOverflow.ellipsis,
                  title,
                  style: titleSmallTextStyle(screenWidth)
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 10,
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                PopupMenuButton(
                    onSelected: (String value) {
                      if (value == '0') {
                        context.read<ActivityBloc>().add(
                            DeletePostButtonClickedEvent(
                                index: index, recipes: recipes));
                      }
                    },
                    color: secondaryColor,
                    iconColor: secondaryColor,
                    itemBuilder: (BuildContext context) {
                      return <PopupMenuEntry<String>>[
                        PopupMenuItem<String>(
                          value: '1',
                          child: Text('Edit'),
                        ),
                        PopupMenuItem<String>(
                          value: '0',
                          child: Text('Delete'),
                        ),
                      ];
                    }),
              ],
            )
          ],
        ),
      ),
    ),
  );
}
