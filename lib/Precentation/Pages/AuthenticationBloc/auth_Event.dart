

import 'package:flutter/material.dart';

sealed class AuthenticationBlocEvent {}

class CheckLoginEvent extends AuthenticationBlocEvent{}

class LoginButtonClickedEvent extends AuthenticationBlocEvent{
  String email;
  String password;
  Widget page;
  LoginButtonClickedEvent({required this.email, required this.password,required this.page});
}

class LogginOutEvent extends AuthenticationBlocEvent{}