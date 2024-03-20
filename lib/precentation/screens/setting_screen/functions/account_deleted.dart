import 'package:flavorfusion/precentation/authentication_bloc/auth_Bloc.dart';
import 'package:flavorfusion/precentation/authentication_bloc/auth_Event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void accountDeleted(BuildContext context) {
  context.read<AuthenticationBloc>().add(CheckLoginEvent());
  Navigator.pop(context);
}
