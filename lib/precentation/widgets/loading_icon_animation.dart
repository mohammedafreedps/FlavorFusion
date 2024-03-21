import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

Widget loadingIconAnimation(double? screenWidth) {
  return Center(child: SizedBox(
    width: screenWidth !=null ? screenWidth * 0.15 : 150 ,
    height: screenWidth !=null ? screenWidth * 0.15 : 150,
    child: Lottie.asset('Assets/loading_animation.json')));
}