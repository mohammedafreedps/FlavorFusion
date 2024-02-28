

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flavorfusion/precentation/screens/forget_passwrod_screen/bloc/forget_password_event.dart';
import 'package:flavorfusion/precentation/screens/forget_passwrod_screen/bloc/forget_password_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgetPasswordBloc
    extends Bloc<ForgetPasswordEvent, ForgetPasswordState> {
  ForgetPasswordBloc() : super(ForgetPasswordInitial()) {
    on<ForgetPasswordEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<SentEmailButtonClickedEvent>((event, emit) async {
      String emailPattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
      RegExp regExp = RegExp(emailPattern);
      if (event.email.isEmpty) {
        emit(ResentEmailIsEmptyState());
      } else {
        if (regExp.hasMatch(event.email)) {
          try {
            await FirebaseAuth.instance
                .sendPasswordResetEmail(email: event.email);
                emit(EmailSentedSuccesState());
          }on FirebaseAuthException catch (e) {
            emit(EmailSentErrorState(message: e.message.toString()));
          }
        } else {
          emit(ResentEmailFormatNotCorrectState());
        }
      }
    });
  }
}
