import 'package:bloc/bloc.dart';
import 'package:flavorfusion/Precentation/Screens/logInScreen/bloc/login_validation_event.dart';
import 'package:flavorfusion/Precentation/Screens/logInScreen/bloc/login_validation_state.dart';

class LoginValidationBloc
    extends Bloc<LoginValidationEvent, LoginValidationState> {
  LoginValidationBloc() : super(LoginValidationInitial()) {
    on<LoginValidationEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<LoginButtonPressForValidationEvent>((event, emit) {
      if (event.email.isEmpty && event.password.isEmpty) {
        emit(EmailPasswordnotinputedState());
      }
      if (event.email.isEmpty && event.password.isNotEmpty) {
        emit(EmailnotinputedState());
      }
      if (event.email.isNotEmpty && event.password.isEmpty) {
        emit(PasswordnotinputedState());
      }
      if (event.email.isNotEmpty && event.password.isNotEmpty) {
        String emailPattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
        RegExp regExp = RegExp(emailPattern);
        if (regExp.hasMatch(event.email)) {
          emit(ValidatedState());
        } else {
          emit(EmailnotFormattedState());
        }
      }
    });
  }
}
