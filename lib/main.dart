import 'package:firebase_core/firebase_core.dart';
import 'package:flavorfusion/constants/colors.dart';
import 'package:flavorfusion/precentation/Screens/IntroPageOneScreen/introPageOneUI.dart';
import 'package:flavorfusion/precentation/Screens/createAccountScreen/bloc/signup_validation_bloc.dart';
import 'package:flavorfusion/precentation/Screens/createAccountScreen/createAccountUI.dart';
import 'package:flavorfusion/precentation/Screens/forgetPasswrodScreen/bloc/forget_password_bloc.dart';
import 'package:flavorfusion/precentation/Screens/logInScreen/bloc/login_validation_bloc.dart';
import 'package:flavorfusion/precentation/Screens/splashScreen/splashScreenUI.dart';
import 'package:flavorfusion/precentation/AuthenticationBloc/auth_Bloc.dart';
import 'package:flavorfusion/precentation/AuthenticationBloc/auth_Event.dart';
import 'package:flavorfusion/precentation/AuthenticationBloc/auth_State.dart';
import 'package:flavorfusion/precentation/Screens/discoverScreen/bloc/discover_bloc.dart';
import 'package:flavorfusion/precentation/Screens/discoverScreen/bloc/discover_event.dart';
import 'package:flavorfusion/precentation/Screens/startingScreen/startingScreen.dart';
import 'package:flavorfusion/precentation/Screens/logInScreen/logInScreenUI.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: 'AIzaSyCrwrpjeZ867GENIn-N_zJaPegBrufbZmI',
          appId: '1:827808614853:android:e1be907c0d9584873ee3ac',
          messagingSenderId: '827808614853',
          projectId: 'flavorfusion-74d39'));
  // await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthenticationBloc>(
            create: (context) => AuthenticationBloc()..add(CheckLoginEvent())),
        BlocProvider<DiscoverBloc>(
            create: (context) => DiscoverBloc()..add(FechDataEvent())),
        BlocProvider<LoginValidationBloc>(
            create: (context) => LoginValidationBloc()),
        BlocProvider<SignupValidationBloc>(
            create: (context) => SignupValidationBloc()),
        BlocProvider<ForgetPasswordBloc>(create: (context) => ForgetPasswordBloc())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: primaryColor,
        ),
        home: BlocBuilder<AuthenticationBloc, AuthenticationBlocState>(
          builder: (context, state) {
            print(state);
            if (state is SplashState) {
              return const SplashScreenUI();
            }
            if (state is FirstOpeningState) {
              return const IntroPageOneUI();
            }
            if (state is LoggedInState) {
              return const StartingScreenUI();
            }
            if (state is LoggedOutState) {
              return LogInScreenUI();
            }
            if (state is NavigateToSigninPageState){
              return CreateAccountUI();
            }
            return Scaffold(
              body: Center(
                child: Center(
                    child: CircularProgressIndicator(
                  color: baseColor,
                )),
              ),
            );
          },
        ),
      ),
    );
  }
}