import 'package:flavorfusion/precentation/screens/setting_screen/bloc/setting_bloc.dart';
import 'package:flavorfusion/precentation/screens/setting_screen/bloc/setting_state.dart';
import 'package:flavorfusion/precentation/screens/setting_screen/functions/account_deleted.dart';
import 'package:flavorfusion/precentation/screens/setting_screen/functions/delete_account.dart';
import 'package:flavorfusion/precentation/screens/setting_screen/widgets/setting_buttons.dart';
import 'package:flavorfusion/precentation/style_manager/text_style_manager.dart';
import 'package:flavorfusion/precentation/widgets/app_bars.dart';
import 'package:flavorfusion/precentation/widgets/bottom_sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingScreenUI extends StatelessWidget {
  const SettingScreenUI({super.key});

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: appBar(title: 'Setings'),
      body: BlocListener<SettingBloc, SettingState>(
        listener: (context, state) {
          if (state is AccountDeleteSuccsussState) {
            accountDeleted(context);
          }
          if (state is AccountDeleteErrorState) {
            bottomSheet(
                state.message, context, _screenSize.width, _screenSize.height);
          }
        },
        child: Padding(
          padding: EdgeInsets.all(_screenSize.width * 0.1),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Legal',
                    style: titleMidiumTextStyle(_screenSize.width)
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  settingButtons(_screenSize.width, 'About'),
                  settingButtons(_screenSize.width, 'Feedback'),
                  settingButtons(_screenSize.width, 'Privacy Policy'),
                  settingButtons(_screenSize.width, 'Terms and Conditions'),
                  Text(
                    'Account',
                    style: titleMidiumTextStyle(_screenSize.width)
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  settingButtons(_screenSize.width, 'Delete Account',
                      function: () {
                    deleteAccount(context);
                  }),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '1.0.0',
                    style: titleSmallTextStyle(_screenSize.width)
                        .copyWith(fontWeight: FontWeight.bold),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
