import 'package:flavorfusion/constants/colors.dart';
import 'package:flavorfusion/precentation/screens/home_screen/widgets/bis_button.dart';
import 'package:flutter/material.dart';

Future filterSelector(BuildContext context, double screenWidth) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(screenWidth * 0.05),
            child: Container(
              padding: EdgeInsets.all(screenWidth * 0.05),
                color: baseColor,
                height: screenWidth * 0.6,
                width: screenWidth * 0.3,
                child: GridView(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3, childAspectRatio: 2/1,mainAxisSpacing: 5,crossAxisSpacing: 5),
                  children: [
                    bisButton(context, screenWidth, 'Italian', 'italian'),
                    bisButton(context, screenWidth, 'Mexican', 'mexican'),
                    bisButton(context, screenWidth, 'Chinese', 'chinese'),
                    bisButton(context, screenWidth, 'Indian', 'indian'),
                    bisButton(context, screenWidth, 'Japanese', 'japanese'),
                    bisButton(context, screenWidth, 'American', 'american'),
                    bisButton(context, screenWidth, 'French', 'french'),
                    bisButton(context, screenWidth, 'Thai', 'thai'),
                    bisButton(context, screenWidth, 'Veg', 'veg'),
                    bisButton(context, screenWidth, 'Non veg', 'non veg'),
                    bisButton(context, screenWidth, 'cancel', 'd',
                        isCancelButton: true)
                  ],
                )),
          ),
        );
      });
}

