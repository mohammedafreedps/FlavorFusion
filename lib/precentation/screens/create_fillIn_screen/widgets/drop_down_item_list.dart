import 'package:flavorfusion/precentation/style_manager/text_style_manager.dart';
import 'package:flutter/material.dart';

List<DropdownMenuItem> dropDownItemList(double screenWidth) {
  List<DropdownMenuItem> items = [
    DropdownMenuItem(
      child: Text(
        'Other',
        style: titleSmallTextStyle(screenWidth),
      ),
      value: 'other',
    ),
    DropdownMenuItem(
        child: Text('Italian', style: titleSmallTextStyle(screenWidth)),
        value: 'italian'),
    DropdownMenuItem(
        child: Text('Mexican', style: titleSmallTextStyle(screenWidth)),
        value: 'mexican'),
    DropdownMenuItem(
        child: Text('Japanese', style: titleSmallTextStyle(screenWidth)),
        value: 'japanese'),
    DropdownMenuItem(
        child: Text('American', style: titleSmallTextStyle(screenWidth)),
        value: 'american'),
    DropdownMenuItem(
        child: Text('French', style: titleSmallTextStyle(screenWidth)),
        value: 'french'),
    DropdownMenuItem(
        child: Text('Thai', style: titleSmallTextStyle(screenWidth)),
        value: 'thai'),
    DropdownMenuItem(
        child: Text('Veg', style: titleSmallTextStyle(screenWidth)),
        value: 'veg'),
    DropdownMenuItem(
        child: Text('Non veg', style: titleSmallTextStyle(screenWidth)),
        value: 'non veg'),
  ];
  return items;
}
