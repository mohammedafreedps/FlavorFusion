
sealed class LoginValidationEvent {}

class LoginButtonPressForValidationEvent extends LoginValidationEvent {
  String email;
  String password;
  LoginButtonPressForValidationEvent({required this.email, required this.password});
}

class ForgetPasswordButtonClickedEvent extends LoginValidationEvent{}