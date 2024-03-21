import 'package:firebase_core/firebase_core.dart';
import 'package:flavorfusion/constants/colors.dart';
import 'package:flavorfusion/precentation/Screens/create_account_screen/bloc/signup_validation_bloc.dart';
import 'package:flavorfusion/precentation/authentication_bloc/auth_Bloc.dart';
import 'package:flavorfusion/precentation/authentication_bloc/auth_Event.dart';
import 'package:flavorfusion/precentation/authentication_bloc/auth_State.dart';
import 'package:flavorfusion/precentation/screens/Intro_page_one_screen/intro_page_one_UI.dart';
import 'package:flavorfusion/precentation/screens/activity_screen/bloc/activity_bloc.dart';
import 'package:flavorfusion/precentation/screens/activity_screen/bloc/activity_event.dart';
import 'package:flavorfusion/precentation/screens/commant_screen/bloc/comment_bloc.dart';
import 'package:flavorfusion/precentation/screens/create_account_screen/create_account_UI.dart';
import 'package:flavorfusion/precentation/screens/create_cooking_time_screen/bloc/create_cooking_time_bloc.dart';
import 'package:flavorfusion/precentation/screens/create_fillIn_screen/bloc/create_fillin_bloc.dart';
import 'package:flavorfusion/precentation/screens/create_ingredients_screen/bloc/create_ingredients_bloc.dart';
import 'package:flavorfusion/precentation/screens/create_instructions_screen/bloc/create_instructions_bloc.dart';
import 'package:flavorfusion/precentation/screens/discover_screen/bloc/discover_bloc.dart';
import 'package:flavorfusion/precentation/screens/discover_screen/bloc/discover_event.dart';
import 'package:flavorfusion/precentation/screens/forget_passwrod_screen/bloc/forget_password_bloc.dart';
import 'package:flavorfusion/precentation/screens/home_screen/bloc/home_screen_bloc.dart';
import 'package:flavorfusion/precentation/screens/home_screen/bloc/home_screen_event.dart';
import 'package:flavorfusion/precentation/screens/intro_page_two_screen/intro_page_two_UI.dart';
import 'package:flavorfusion/precentation/screens/log_in_screen/bloc/login_validation_bloc.dart';
import 'package:flavorfusion/precentation/screens/log_in_screen/log_In_screen_UI.dart';
import 'package:flavorfusion/precentation/screens/profile_screen/bloc/profile_bloc.dart';
import 'package:flavorfusion/precentation/screens/saved_recipies/bloc/saved_recipes_bloc.dart';
import 'package:flavorfusion/precentation/screens/saved_recipies/bloc/saved_recipes_event.dart';
import 'package:flavorfusion/precentation/screens/setting_screen/bloc/setting_bloc.dart';
import 'package:flavorfusion/precentation/screens/splash_screen/splash_screen_ui.dart';
import 'package:flavorfusion/precentation/screens/starting_screen/starting_screen.dart';
import 'package:flavorfusion/constants/key.dart';
import 'package:flavorfusion/precentation/widgets/incorrect_cred_alert_dialog.dart';
import 'package:flavorfusion/precentation/widgets/loading_icon_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: apiKey,
          appId: appId,
          messagingSenderId: '827808614853',
          projectId: 'flavorfusion-74d39',
          storageBucket: 'gs://flavorfusion-74d39.appspot.com'));
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
        BlocProvider<ForgetPasswordBloc>(
            create: (context) => ForgetPasswordBloc()),
        BlocProvider<CreateIngredientsCountBloc>(
            create: (context) => CreateIngredientsCountBloc()),
        BlocProvider<CreateInstructionsBloc>(
            create: (context) => CreateInstructionsBloc()),
        BlocProvider<CreateCookingTimeBloc>(
            create: (context) => CreateCookingTimeBloc()),
        BlocProvider<CreateFillinBloc>(create: (context) => CreateFillinBloc()),
        BlocProvider<HomeScreenBloc>(
            create: ((context) =>
                HomeScreenBloc()..add(FechDataFromFirebaseEvent()))),
        BlocProvider<ActivityBloc>(
            create: (context) => ActivityBloc()..add(SortAndSetValueEvent())),
        BlocProvider<SavedRecipesBloc>(
            create: (context) =>
                SavedRecipesBloc()..add(LoadDataInSavedRecipieEvent())),
        BlocProvider<CommentBloc>(create: (context) => CommentBloc()),
        BlocProvider<ProfileBloc>(create: (context) => ProfileBloc()),
        BlocProvider<SettingBloc>(create: ((context) => SettingBloc()))
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: primaryColor,
        ),
        home: BlocListener<AuthenticationBloc, AuthenticationBlocState>(
          listener: (context, state) {
            if (state is IncorrectCredentialState) {
              incorrectCredAlertDialog(context);
            }
          },
          child: BlocBuilder<AuthenticationBloc, AuthenticationBlocState>(
            builder: (context, state) {
              print(state);
              if (state is SplashState) {
                return const SplashScreenUI();
              }
              if (state is ShowIntroPageTwoState) {
                return IntroPageTwoUI();
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
              if (state is NavigateToSigninPageState) {
                return CreateAccountUI();
              }
              return Scaffold(
                body: Center(child: loadingIconAnimation(null)),
              );
            },
          ),
        ),
      ),
    );
  }
}
