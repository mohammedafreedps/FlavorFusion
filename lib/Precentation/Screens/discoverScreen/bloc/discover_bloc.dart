import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:flavorfusion/Data/Repository/mealApiModel.dart';
import 'package:flavorfusion/Precentation/Screens/discoverScreen/bloc/discover_event.dart';
import 'package:flavorfusion/Precentation/Screens/discoverScreen/bloc/discover_state.dart';
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
        emit(DataFechFailedState(
            error: 'A exeption has occured' + e.toString()));
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
          }else{
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
