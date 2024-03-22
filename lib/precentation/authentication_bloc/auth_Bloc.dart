import 'package:flavorfusion/data/temp_value_holder.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flavorfusion/Constants/textes.dart';
import 'package:flavorfusion/precentation/authentication_bloc/auth_Event.dart';
import 'package:flavorfusion/precentation/authentication_bloc/auth_State.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationBlocEvent, AuthenticationBlocState> {
  AuthenticationBloc() : super(SplashState()) {
    on<CheckLoginEvent>((event, emit) async {
      if (testing == true) {
        emit(FirstOpeningState());
      } else {
        User? _user = await FirebaseAuth.instance.currentUser;
        if (_user == null) {
          emit(LoggedOutState());
        } else {
          huser = await FirebaseAuth.instance.currentUser;
          emit(LoggedInState());
        }
      }
    });

    on<LoginButtonClickedEvent>((event, emit) async {
      emit(AuthenticationLoadingState());
      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: event.email.trim(), password: event.password.trim());
      } on FirebaseAuthException catch (e) {
        print(e);
        emit(IncorrectCredentialState());
      }
      User? _user = await FirebaseAuth.instance.currentUser;
      if (_user != null) {
        emit(LoggedInState());
      } else {
        emit(LoggedOutState());
      }
    });

    on<LogginOutEvent>((event, emit) async {
      await FirebaseAuth.instance.signOut();
      User? _user = await FirebaseAuth.instance.currentUser;
      if (_user == null) {
        emit(LoggedOutState());
      }
    });

    on<LogginWithGooogleButtonClickedEvent>((event, emit) async {
      try {
        GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
        GoogleSignInAuthentication? googleAuth =
            await googleUser?.authentication;
        if (googleAuth != null) {
          AuthCredential creadential = GoogleAuthProvider.credential(
              accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
          await FirebaseAuth.instance.signInWithCredential(creadential);
          emit(LoggedInState());
        }
      } on FirebaseAuthException catch (e) {
        print(e.message);
        emit(LoginWithGoogleErrorState(message: e.message!));
      }
    });

    on<RegisterAccountbuttonclickedEvent>(((event, emit) async {
      emit(AuthenticationLoadingState());
      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: event.email, password: event.password);
        User? _user = await FirebaseAuth.instance.currentUser;
        if (_user != null) {
          emit(LoggedInState());
        } else {
          emit(LoggedOutState());
        }
      } on FirebaseAuthException catch (e) {
        emit(RegisterErrorState(RMessage: e.toString()));
        print(e);
      }
    }));

    on<SigninButtonClickedEvent>((event, emit) {
      emit(NavigateToSigninPageState());
    });

    on<BackToLoginButtonClickedEvent>((event, emit) {
      emit(LoggedOutState());
    });

    on<ShowIntroPageTwoEvent>((event, emit) {
      emit(ShowIntroPageTwoState());
    });
  }
}
