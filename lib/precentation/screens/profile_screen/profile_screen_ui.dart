import 'package:firebase_auth/firebase_auth.dart';
import 'package:flavorfusion/constants/colors.dart';
import 'package:flavorfusion/precentation/screens/activity_screen/activity_screen.dart';
import 'package:flavorfusion/precentation/screens/profile_screen/bloc/profile_bloc.dart';
import 'package:flavorfusion/precentation/screens/profile_screen/bloc/profile_state.dart';
import 'package:flavorfusion/precentation/screens/profile_screen/widget/logout_alert_dialog.dart';
import 'package:flavorfusion/precentation/screens/saved_recipies/saved_recipies_ui.dart';
import 'package:flavorfusion/precentation/screens/setting_screen/setting_screen_ui.dart';
import 'package:flavorfusion/precentation/style_manager/text_style_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreenUI extends StatelessWidget {
  final User? _user = FirebaseAuth.instance.currentUser;
  ProfileScreenUI({super.key});

  @override
  Widget build(BuildContext context) {
    Size _screenSize = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: secondaryColor),
          backgroundColor: primaryColor,
          title: Text(
            'Profile',
            style:
                TextStyle(color: secondaryColor, fontWeight: FontWeight.bold),
          ).animate(effects: [SlideEffect(),FadeEffect()]),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(48.0),
            child: Column(
              children: [
                TabBar(
                  labelColor: secondaryColor,
                  dividerColor: primaryColor,
                  indicatorColor: secondaryColor,
                  unselectedLabelColor: acsentColor,
                  tabs: [
                    const Tab(text: 'Saved Recipes'),
                    const Tab(text: 'Activity'),
                  ],
                ),
              ],
            ),
          ),
        ),
        body: const TabBarView(
          children: [SavedRecipesUI(), ActivityScreenUI()],
        ),
        endDrawer: Drawer(
          backgroundColor: primaryColor,
          width: _screenSize.width * 0.5,
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.all(_screenSize.width * 0.05),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        overflow: TextOverflow.ellipsis,
                        _user!.email!,
                        style: TextStyle(color: secondaryColor),
                      ),
                      SizedBox(
                        height: _screenSize.width * 0.05,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          BlocBuilder<ProfileBloc, ProfileState>(
                            builder: (context, state) {
                              if (state is TotalLikeandPostState) {
                                return (Column(
                                  children: [
                                    Text(
                                      'Total Post',
                                      style:
                                          titleSmallTextStyle(_screenSize.width),
                                    ),
                                    Text(
                                      state.totalPost,
                                      style:
                                          titleSmallTextStyle(_screenSize.width)
                                              .copyWith(
                                                  fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ));
                              }
                              return Text('Total post');
                            },
                          ),
                          BlocBuilder<ProfileBloc, ProfileState>(
                            builder: (context, state) {
                              if (state is TotalLikeandPostState) {
                                return (Column(
                                  children: [
                                    Text(
                                      'Total Likes',
                                      style:
                                          titleSmallTextStyle(_screenSize.width),
                                    ),
                                    Text(
                                      state.totalLike,
                                      style:
                                          titleSmallTextStyle(_screenSize.width)
                                              .copyWith(
                                                  fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ));
                              }
                              return Text('Total post');
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                  Column(
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) => SettingScreenUI())));
                        },
                        child: Text(
                          'Settings',
                          style: TextStyle(
                            color: secondaryColor,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                         logoutAlertDialog(context, _screenSize.width);
                        },
                        child: Text(
                          'Logout',
                          style: TextStyle(
                            color: secondaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}