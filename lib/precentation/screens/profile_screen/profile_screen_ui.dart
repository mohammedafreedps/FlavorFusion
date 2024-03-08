import 'package:firebase_auth/firebase_auth.dart';
import 'package:flavorfusion/constants/colors.dart';
import 'package:flavorfusion/precentation/authentication_bloc/auth_Bloc.dart';
import 'package:flavorfusion/precentation/authentication_bloc/auth_Event.dart';
import 'package:flavorfusion/precentation/screens/activity_screen/activity_screen.dart';
import 'package:flavorfusion/precentation/screens/saved_recipies/saved_recipies_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
          ),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(48.0),
            child: Column(
              children: [
                TabBar(
                  labelColor: secondaryColor,
                  dividerColor: primaryColor,
                  indicatorColor: secondaryColor,
                  unselectedLabelColor: acsentColor,
                  tabs: [
                    Tab(text: 'Saved Recipes'),
                    Tab(text: 'Activity'),
                  ],
                ),
              ],
            ),
          ),
        ),
        body: TabBarView(
          children: [
            SavedRecipesUI(),
            ActivityScreenUI()
          ],
        ),
        endDrawer: Drawer(
          backgroundColor: primaryColor,
          width: _screenSize.width * 0.5,
          child: Padding(
            padding: EdgeInsets.all(_screenSize.width * 0.1),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  overflow: TextOverflow.ellipsis,
                  _user!.email!,
                  style: TextStyle(color: secondaryColor),
                ),
                Column(
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'Privacy Policy',
                        style: TextStyle(
                          color: secondaryColor,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        context
                            .read<AuthenticationBloc>()
                            .add(LogginOutEvent());
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
    );
  }
}
