import 'package:flavorfusion/constants/colors.dart';
import 'package:flutter/material.dart';

List<Widget> fireIngredientsList(
    List ingredients, List measure, double screenWidth) {
  List<Widget> ingredientsWidgets = [];
  for (var i = 0; i < ingredients.length; i++) {
    Widget row = Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              ingredients[i],
              style: TextStyle(
                  color: secondaryColor,
                  fontWeight: FontWeight.w300,
                  fontSize: screenWidth * 0.03),
            ),
            Text(
              measure[i],
              style: TextStyle(
                  color: secondaryColor,
                  fontWeight: FontWeight.w300,
                  fontSize: screenWidth * 0.03),
            ),
          ],
        ),
        Divider()
      ],
    );
    ingredientsWidgets.add(row);
  }
  return ingredientsWidgets;
}