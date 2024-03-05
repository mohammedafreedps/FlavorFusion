import 'package:flavorfusion/constants/colors.dart';
import 'package:flavorfusion/precentation/style_manager/text_style_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

AppBar appBar(
    {required String title,
    bool? needAction,
    String? assetPath,
    Icon? icon,
    Function? function}) {
  return assetPath != null ? AppBar(
    iconTheme: IconThemeData(color: secondaryColor),
    actions: needAction != null
        ? [GestureDetector(onTap: () {}, child: SvgPicture.asset(assetPath))]
        : [],
    backgroundColor: primaryColor,
    title: Text(
      title,
      style: appBarTextStyle(),
    ),
  ) : AppBar(
    iconTheme: IconThemeData(color: secondaryColor),
    actions:[ needAction != null
        ? IconButton(onPressed: (){
          if (function != null){
            function();
          }
        }, icon: icon!):Text('')],
        
    backgroundColor: primaryColor,
    title: Text(
      title,
      style: appBarTextStyle(),
    ),
  );
}
