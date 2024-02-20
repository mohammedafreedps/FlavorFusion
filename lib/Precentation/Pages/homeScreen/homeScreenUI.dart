
import 'package:flavorfusion/Precentation/Pages/AuthenticationBloc/auth_Bloc.dart';
import 'package:flavorfusion/Precentation/Pages/AuthenticationBloc/auth_Event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreenUI extends StatelessWidget {
  const HomeScreenUI({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(onPressed: (){
          context.read<AuthenticationBloc>().add(LogginOutEvent());
        }, child: Text('SignOut')),
      ),
    );
  }
}