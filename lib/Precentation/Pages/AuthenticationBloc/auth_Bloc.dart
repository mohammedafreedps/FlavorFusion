
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flavorfusion/Constants/textes.dart';
import 'package:flavorfusion/Precentation/Pages/AuthenticationBloc/auth_Event.dart';
import 'package:flavorfusion/Precentation/Pages/AuthenticationBloc/auth_State.dart';


class AuthenticationBloc extends Bloc<AuthenticationBlocEvent, AuthenticationBlocState> {
  AuthenticationBloc() : super(SplashState()) {
    on<CheckLoginEvent>((event, emit) async {
      if(testing == true){
        emit(FirstOpeningState());
      }else{
        User? _user = await FirebaseAuth.instance.currentUser;
        if(_user == null){
          emit(LoggedOutState());
        }else{
          emit(LoggedInState());
        }
      }
    });

    on<LoginButtonClickedEvent>((event, emit)async{
      emit(LoadingState());
      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(email: event.email.trim(), password: event.password.trim());
      } on FirebaseAuthException catch (e) {
        print(e);
        emit(IncorrectCredentialState());
      }
      
      User? _user = await FirebaseAuth.instance.currentUser;
      if(_user != null){
        emit(LoggedInState());
      }else{
        emit(LoggedOutState());
      }
    });

    on<LogginOutEvent>((event, emit)async{
      await FirebaseAuth.instance.signOut();
      User? _user = await FirebaseAuth.instance.currentUser;
      if (_user == null) {
        emit(LoggedOutState());
      }
    });
  }

  
}
