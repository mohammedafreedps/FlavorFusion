
sealed class SignupValidationState {}

final class SignupValidationInitial extends SignupValidationState {}

class SignupValidatedState extends SignupValidationState {}

class SignupEmailNotCorrectState extends SignupValidationState{
  String vMessage = 'Email format not correct';
}

class SignupPassowrdNotMatchState extends SignupValidationState{
  String vMessage = 'Password Not Match';
}

class SignupPasswordAndEmailNotenterdState extends SignupValidationState{
  String vMessage = 'Enter Email and Password';
}

class SignupFailedState extends SignupValidationState{
  String vMessage = 'Signup Failed';
}

class PopSigninScreenState extends SignupValidationState{}