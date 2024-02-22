import 'package:flavorfusion/Precentation/Widgets/appBars.dart';
import 'package:flutter/material.dart';

class HomeScreenUI extends StatelessWidget {
  const HomeScreenUI({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(title: 'Home'),
      body: Center(
        child: Text('home page'),
      ),
    );
  }
}