import 'package:flavorfusion/precentation/screens/setting_screen/bloc/setting_bloc.dart';
import 'package:flavorfusion/precentation/screens/setting_screen/bloc/setting_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void deleteAccount(BuildContext context){
  context.read<SettingBloc>().add(DeleteAccountButtonClickedEvent());
}