import 'package:flavorfusion/constants/colors.dart';
import 'package:flavorfusion/precentation/authentication_bloc/auth_Bloc.dart';
import 'package:flavorfusion/precentation/authentication_bloc/auth_Event.dart';
import 'package:flavorfusion/precentation/style_manager/text_style_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future logoutAlertDialog(BuildContext context, double screenWidth) {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: baseColor,
          content: Text(
            'Do you really want to Logout',
            style: titleMidiumTextStyle(screenWidth),
          ),
          actions: [
            TextButton(
                onPressed: () {
                  context.read<AuthenticationBloc>().add(LogginOutEvent());
                  Navigator.pop(context);
                },
                child: Text('Yes',
                    style: titleSmallTextStyle(screenWidth)
                        .copyWith(fontWeight: FontWeight.bold))),
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('No',
                    style: titleSmallTextStyle(screenWidth)
                        .copyWith(fontWeight: FontWeight.bold)))
          ],
        );
      });
}
