import 'package:flavorfusion/constants/colors.dart';
import 'package:flavorfusion/precentation/screens/firebase_recipe_detail_screen/firebase_recipe_detail_screen.dart';
import 'package:flavorfusion/precentation/screens/home_screen/bloc/home_screen_bloc.dart';
import 'package:flavorfusion/precentation/screens/home_screen/bloc/home_screen_event.dart';
import 'package:flavorfusion/precentation/screens/home_screen/bloc/home_screen_state.dart';
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
      appBar: appBar(title: 'Home',icon: Icon(Icons.restart_alt,color: secondaryColor,),needAction: true,function: (){
        context.read<HomeScreenBloc>().add(FechDataFromFirebaseEvent());
      }),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: _screenSize.width * 0.1),
        child: Center(
          child: BlocBuilder<HomeScreenBloc, HomeScreenState>(
            builder: (context, state) {
              if (state is AllDatasLoadedState) {
                return ListView.builder(
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
                          child: _homeTile(
                              state.recipies[index].imageURL,
                              state.recipies[index].recipeTitle,
                              state.recipies[index].userEmail,
                              _screenSize.width));
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

Widget _homeTile(
    String src, String title, String postedBy, double screenWidth) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 10),
    child: AspectRatio(
      aspectRatio: 1 / 1.1,
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
              Text(
                'by - ' + postedBy.replaceAll('@gmail.com', ''),
                style: titleSmallTextStyle(screenWidth),
              ),
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
