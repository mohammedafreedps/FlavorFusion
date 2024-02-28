
sealed class SignupValidationEvent {}

class SignUpButtonClickForValidation extends SignupValidationEvent{
  String email;
  String password;
  String repassword;
  SignUpButtonClickForValidation({required this.email, required this.password, required this.repassword});
}

