import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class SplashScreenUI extends StatelessWidget {
  const SplashScreenUI({super.key});

  void _navigatePage(BuildContext context, Widget widget){
    Timer(Duration(seconds: 3), () { 
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context)=> widget));
    });
    
  }

  @override
  Widget build(BuildContext context) {
    // _navigatePage(context, IntroPageOneUI());
    return Scaffold(
      body: Center(
        child: AspectRatio(
          aspectRatio: 4,
          child: Image.asset('Assets/AppIcon.png')),
      ).animate(effects: [FadeEffect()]),
    );
  }
}