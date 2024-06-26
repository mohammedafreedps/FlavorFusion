import 'package:flavorfusion/precentation/screens/setting_screen/bloc/setting_bloc.dart';
import 'package:flavorfusion/precentation/screens/setting_screen/bloc/setting_state.dart';
import 'package:flavorfusion/precentation/screens/setting_screen/functions/account_deleted.dart';
import 'package:flavorfusion/precentation/screens/setting_screen/functions/navigator.dart';
import 'package:flavorfusion/precentation/screens/setting_screen/widgets/delete_account_alert_dialog.dart';
import 'package:flavorfusion/precentation/screens/setting_screen/widgets/setting_buttons.dart';
import 'package:flavorfusion/precentation/screens/setting_screen/widgets/setting_detail_screen_ui.dart';
import 'package:flavorfusion/precentation/style_manager/text_style_manager.dart';
import 'package:flavorfusion/precentation/widgets/app_bars.dart';
import 'package:flavorfusion/precentation/widgets/bottom_sheet.dart';
import 'package:flavorfusion/precentation/widgets/loading_icon_animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingScreenUI extends StatelessWidget {
  const SettingScreenUI({super.key});

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    final _passwordController = TextEditingController();
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
        child: BlocBuilder<SettingBloc, SettingState>(
          builder: (context, state) {
            if (state is DeletingAccountState) {
              return Center(
                child: loadingIconAnimation(_screenSize.width),
              );
            }
            return Padding(
              padding: EdgeInsets.symmetric(vertical: _screenSize.width * 0.04,  horizontal: _screenSize.width * 0.04,),
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
                      settingButtons(_screenSize.width, 'About', function: () {
                        navigator(
                            context, SettingDetailScreenUi(pageName: 'About'));
                      }),
                      settingButtons(_screenSize.width, 'Privacy Policy',
                          function: () {
                        navigator(context,
                            SettingDetailScreenUi(pageName: 'privacy Policy'));
                      }),
                      settingButtons(_screenSize.width, 'Terms and Conditions',
                          function: () {
                        navigator(
                            context,
                            SettingDetailScreenUi(
                                pageName: 'Terms & Condition'));
                      }),
                      Text(
                        'Account',
                        style: titleMidiumTextStyle(_screenSize.width)
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      settingButtons(_screenSize.width, 'Delete Account',
                          function: () {
                        deleteAccountAlertDialog(
                            context, _screenSize.width, _passwordController);
                      }),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '1.1.0',
                        style: titleSmallTextStyle(_screenSize.width)
                            .copyWith(fontWeight: FontWeight.bold),
                      )
                    ],
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
