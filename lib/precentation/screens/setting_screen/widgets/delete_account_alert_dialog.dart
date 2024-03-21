import 'package:flavorfusion/constants/colors.dart';
import 'package:flavorfusion/precentation/screens/setting_screen/functions/delete_account.dart';
import 'package:flavorfusion/precentation/style_manager/text_style_manager.dart';
import 'package:flutter/material.dart';

Future deleteAccountAlertDialog(BuildContext context, double screenWidth,
    TextEditingController controller) {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: baseColor,
          content: Text(
            'Enter Password to delete account and this action is Irreversible',
            style: titleMidiumTextStyle(screenWidth),
          ),
          actions: [
            Column(
              children: [
                TextField(
                  controller: controller,
                  obscureText: true,
                  style: TextStyle(color: secondaryColor),
                  cursorColor: secondaryColor,
                  decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: secondaryColor)),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: secondaryColor))),
                ),
                TextButton(
                    onPressed: () {
                      deleteAccount(context, controller.text);
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Delete',
                      style: titleSmallTextStyle(screenWidth)
                          .copyWith(fontWeight: FontWeight.bold),
                    )),
              ],
            )
          ],
        );
      });
}
