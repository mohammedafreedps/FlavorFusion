
import 'package:firebase_core/firebase_core.dart';
import 'package:flavorfusion/constants/colors.dart';
import 'package:flavorfusion/precentation/Screens/create_account_screen/bloc/signup_validation_bloc.dart';
import 'package:flavorfusion/precentation/authentication_bloc/auth_Bloc.dart';
import 'package:flavorfusion/precentation/authentication_bloc/auth_Event.dart';
import 'package:flavorfusion/precentation/authentication_bloc/auth_State.dart';
import 'package:flavorfusion/precentation/screens/Intro_page_one_screen/intro_page_one_UI.dart';
import 'package:flavorfusion/precentation/screens/create_account_screen/create_account_UI.dart';
import 'package:flavorfusion/precentation/screens/create_ingredients_screen/bloc/create_ingredients_count_bloc.dart';
import 'package:flavorfusion/precentation/screens/discover_screen/bloc/discover_bloc.dart';
import 'package:flavorfusion/precentation/screens/discover_screen/bloc/discover_event.dart';
import 'package:flavorfusion/precentation/screens/forget_passwrod_screen/bloc/forget_password_bloc.dart';
import 'package:flavorfusion/precentation/screens/log_in_screen/bloc/login_validation_bloc.dart';
import 'package:flavorfusion/precentation/screens/log_in_screen/log_In_screen_UI.dart';
import 'package:flavorfusion/precentation/screens/splash_screen/splash_screen_ui.dart';
import 'package:flavorfusion/precentation/screens/starting_screen/starting_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
        BlocProvider<ForgetPasswordBloc>(create: (context) => ForgetPasswordBloc()),
        BlocProvider<CreateIngredientsCountBloc>(create: (context)=> CreateIngredientsCountBloc())
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