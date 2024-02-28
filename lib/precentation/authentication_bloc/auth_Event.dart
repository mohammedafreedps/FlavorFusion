

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

class RegisterAccountbuttonclickedEvent extends AuthenticationBlocEvent{
  String email;
  String password;
  RegisterAccountbuttonclickedEvent({required this.email, required this.password});
}

class LogginWithGooogleButtonClickedEvent extends AuthenticationBlocEvent{}

class SigninButtonClickedEvent extends AuthenticationBlocEvent{}

class BackToLoginButtonClickedEvent extends AuthenticationBlocEvent{}