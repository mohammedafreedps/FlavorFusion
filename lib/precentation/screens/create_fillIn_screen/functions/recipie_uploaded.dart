import 'dart:async';
import 'package:flavorfusion/precentation/screens/activity_screen/bloc/activity_bloc.dart';
import 'package:flavorfusion/precentation/screens/activity_screen/bloc/activity_event.dart';
import 'package:flavorfusion/precentation/screens/home_screen/bloc/home_screen_bloc.dart';
import 'package:flavorfusion/precentation/screens/home_screen/bloc/home_screen_event.dart';
import 'package:flavorfusion/precentation/screens/profile_screen/bloc/profile_bloc.dart';
import 'package:flavorfusion/precentation/screens/profile_screen/bloc/profile_event.dart';
import 'package:flavorfusion/precentation/widgets/bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void recipieUploaded(BuildContext context, Size screenSize) {
  bottomSheet('Recipie Uploaded Succesfully', context,screenSize.width,
      screenSize.height);
  context.read<HomeScreenBloc>().add(FechDataFromFirebaseEvent());
  Timer(Duration(seconds: 1), () {
    context.read<ActivityBloc>().add(SortAndSetValueEvent());
    context.read<ProfileBloc>().add(CountTotalLikeandPostEvent());
  });
}
