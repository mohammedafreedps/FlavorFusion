

import 'package:flavorfusion/constants/colors.dart';
import 'package:flutter/material.dart';

Widget resetEmailTextField (TextEditingController controller,){
  return TextField(
        controller: controller,
        keyboardType: TextInputType.emailAddress,
        style: TextStyle(color: baseColor),
        cursorColor: baseColor,
        decoration: InputDecoration(
            enabledBorder:
                UnderlineInputBorder(borderSide: BorderSide(color: baseColor)),
            focusedBorder:
                UnderlineInputBorder(borderSide: BorderSide(color: baseColor))),
      );
}