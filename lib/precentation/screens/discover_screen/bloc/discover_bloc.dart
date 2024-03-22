import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flavorfusion/data/repository/meal_api_model.dart';
import 'package:flavorfusion/precentation/screens/discover_screen/bloc/discover_event.dart';
import 'package:flavorfusion/precentation/screens/discover_screen/bloc/discover_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

class DiscoverBloc extends Bloc<DiscoverEvent, DiscoverState> {
  DiscoverBloc() : super(PageDiscoverLodingState()) {
    on<FechDataEvent>((event, emit) async {
      final url =
          Uri.parse('https://www.themealdb.com/api/json/v1/1/search.php?s=');
      try {
        final response = await http.get(url);
        if (response.statusCode == 200) {
          final decodedData = json.decode(response.body)['meals'] as List;
          final meals =
              decodedData.map((meals) => MealapiModel.fromJson(meals)).toList();
          emit(DataFechSuccessState(mealAPIModels: meals));
        } else {
          emit(DataFechFailedState(error: 'Error to fech data'));
        }
      } catch (e) {
        if (e is SocketException) {
          emit(DataFechFailedState(
              error: "Network error. Please check you internet connection"));
        }
        if (e is TimeoutException) {
          emit(DataFechFailedState(
              error: 'Request time out. Please try again later'));
        }

        Exception(e);
      }
    });
    on<SearchForRecipeEvent>((event, emit) async {
      emit(PageDiscoverLodingState());
      final url = Uri.parse(
          'https://www.themealdb.com/api/json/v1/1/search.php?s=${event.searchKeywork}');
      try {
        final response = await http.get(url);
        if (response.statusCode == 200) {
          final decodedData = json.decode(response.body)['meals'];
          if (decodedData != null) {
            decodedData as List;
            final meals = decodedData
                .map((meals) => MealapiModel.fromJson(meals))
                .toList();
            emit(DataFechSuccessState(mealAPIModels: meals));
          } else {
            emit(DataFechFailedState(error: '!_Item Not Found_!'));
          }
        }
      } catch (e) {
        emit(DataFechFailedState(
            error: 'A exeption has occured' + e.toString()));
        // Exception(e);
      }
    });
  }
}
