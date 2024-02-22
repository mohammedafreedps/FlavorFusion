import 'package:flavorfusion/Constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

AppBar appBar({required String title,bool? needAction,String? assetPath,Function? function}) {
  return AppBar(
    iconTheme: IconThemeData(color: secondaryColor),
    actions: needAction != null? [GestureDetector(
      onTap: () {
        
      },
      child: SvgPicture.asset(assetPath!))]:[],
    backgroundColor: primaryColor,
    title: Text(
      title,
      style: TextStyle(color: secondaryColor, fontWeight: FontWeight.bold),
    ),
  );
}