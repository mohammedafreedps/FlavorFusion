import 'package:flavorfusion/constants/colors.dart';
import 'package:flavorfusion/data/temp_value_holder.dart';
import 'package:flavorfusion/precentation/screens/home_screen/widgets/bis_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget gridTile(BuildContext context, double screenWidth) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      IconButton(onPressed: (){
        Navigator.pop(context);
      }, icon: Icon(Icons.close,color: secondaryColor,)),
      Expanded(
        child: GridView.builder(
            itemCount: hcategoryItemName.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 2 / 1,
                mainAxisSpacing: 5,
                crossAxisSpacing: 5),
            itemBuilder: (BuildContext context, index) {
              return bisButton(
                  context,
                  screenWidth,
                  hcategoryItemName[index],
                  hcategoryItemName[index],
                  isSelected: hcategorySelected[index],
                  index);
            }),
      ),
    ],
  );
}
