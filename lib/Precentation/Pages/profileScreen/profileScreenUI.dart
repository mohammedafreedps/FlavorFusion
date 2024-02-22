import 'package:firebase_auth/firebase_auth.dart';
import 'package:flavorfusion/Constants/colors.dart';
import 'package:flavorfusion/Precentation/Pages/AuthenticationBloc/auth_Bloc.dart';
import 'package:flavorfusion/Precentation/Pages/AuthenticationBloc/auth_Event.dart';
import 'package:flutter/material.dart';
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
                Text(
                  'Your additional text goes here',
                  style: TextStyle(color: Colors.red),
                ),
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
            Center(
              child: Text('Tab 1 Content'),
            ),
            Center(
              child: Text('Tab 2 Content'),
            ),
          ],
        ),
        endDrawer: Drawer(
          backgroundColor: primaryColor,
          width: _screenSize.width * 0.5,
          child: Padding(
            padding: EdgeInsets.all(_screenSize.width * 0.1),
            child: Expanded(
              child: ListView(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        overflow: TextOverflow.ellipsis,
                        _user!.email!,
                        style: TextStyle(color: secondaryColor),
                      ),
                      SizedBox(height: _screenSize.height * 0.66),
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
