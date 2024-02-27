import 'package:bloc/bloc.dart';
import 'package:flavorfusion/Precentation/Screens/createAccountScreen/bloc/signup_validation_event.dart';
import 'package:flavorfusion/Precentation/Screens/createAccountScreen/bloc/signup_validation_state.dart';

class SignupValidationBloc
    extends Bloc<SignupValidationEvent, SignupValidationState> {
  SignupValidationBloc() : super(SignupValidationInitial()) {
    on<SignUpButtonClickForValidation>((event, emit) async {
      if (event.email.isEmpty && event.password.isEmpty) {
        emit(SignupPasswordAndEmailNotenterdState());
      }
      if (event.password != event.repassword) {
        emit(SignupPassowrdNotMatchState());
      }
      if (event.email.isNotEmpty &&
          event.password.isNotEmpty &&
          event.repassword.isNotEmpty) {
        String emailPattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
        RegExp regExp = RegExp(emailPattern);
        if (regExp.hasMatch(event.email)) {
          emit(SignupValidatedState());
        } else {
          emit(SignupEmailNotCorrectState());
        }
      }
    });
  }
}
