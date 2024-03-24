import 'package:flavorfusion/precentation/screens/activity_screen/bloc/activity_bloc.dart';
import 'package:flavorfusion/precentation/screens/activity_screen/bloc/activity_event.dart';
import 'package:flavorfusion/precentation/screens/discover_screen/bloc/discover_bloc.dart';
import 'package:flavorfusion/precentation/screens/discover_screen/bloc/discover_event.dart';
import 'package:flavorfusion/precentation/screens/home_screen/bloc/home_screen_bloc.dart';
import 'package:flavorfusion/precentation/screens/home_screen/bloc/home_screen_event.dart';
import 'package:flavorfusion/precentation/screens/profile_screen/bloc/profile_bloc.dart';
import 'package:flavorfusion/precentation/screens/profile_screen/bloc/profile_event.dart';
import 'package:flavorfusion/precentation/screens/saved_recipies/bloc/saved_recipes_bloc.dart';
import 'package:flavorfusion/precentation/screens/saved_recipies/bloc/saved_recipes_event.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void refresh(BuildContext context) {
  context.read<HomeScreenBloc>().add(FechDataFromFirebaseEvent());
  context.read<SavedRecipesBloc>().add(LoadDataInSavedRecipieEvent());
  context.read<ProfileBloc>().add(CountTotalLikeandPostEvent());
  context.read<DiscoverBloc>().add(FechDataEvent());
  context.read<ActivityBloc>().add(SortAndSetValueEvent());
  context.read<SavedRecipesBloc>().add(LoadDataInSavedRecipieEvent());
}
