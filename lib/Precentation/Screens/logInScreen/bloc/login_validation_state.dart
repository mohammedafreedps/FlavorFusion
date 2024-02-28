
sealed class LoginValidationState {}

final class LoginValidationInitial extends LoginValidationState {}

class EmailPasswordnotinputedState extends LoginValidationState{
 final String vMessage = 'Enter Email and Passwrod'; 
}

class EmailnotinputedState extends LoginValidationState{
 final String vMessage = 'Enter Email'; 
}

class PasswordnotinputedState extends LoginValidationState{
 final String vMessage = 'Enter Passwrod'; 
}

class ValidatedState extends LoginValidationState{}

class EmailnotFormattedState extends LoginValidationState{
 final String vMessage = 'Enter Format Not Correct'; 
}

class NavigatePageToForgetPasswordScreenEvent extends LoginValidationState{}