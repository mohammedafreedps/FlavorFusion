import 'package:flavorfusion/precentation/screens/setting_screen/widgets/setting_buttons.dart';
import 'package:flavorfusion/precentation/style_manager/text_style_manager.dart';
import 'package:flavorfusion/precentation/widgets/app_bars.dart';
import 'package:flutter/material.dart';

class SettingScreenUI extends StatelessWidget {
  const SettingScreenUI({super.key});

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: appBar(title: 'Setings'),
      body: Padding(
        padding: EdgeInsets.all(_screenSize.width * 0.1),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Legal',
              style: titleMidiumTextStyle(_screenSize.width)
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            settingButtons(_screenSize.width, 'Feedback'),
            settingButtons(_screenSize.width, 'Privacy Policy'),
            settingButtons(_screenSize.width, 'Terms and Conditions'),
            Text(
              'Account',
              style: titleMidiumTextStyle(_screenSize.width)
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            settingButtons(_screenSize.width, 'Delete Account'),
          ],
        ),
      ),
    );
  }
}