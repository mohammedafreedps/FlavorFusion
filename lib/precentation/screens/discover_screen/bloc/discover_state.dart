
import 'package:flavorfusion/data/repository/meal_api_model.dart';

sealed class DiscoverState {}

final class PageDiscoverLodingState extends DiscoverState {}

class DataFechSuccessState extends DiscoverState {
  List<MealapiModel> mealAPIModels;
  DataFechSuccessState({required this.mealAPIModels});
}
class DataFechFailedState extends DiscoverState{
  String error;
  DataFechFailedState({required this.error});
}
class SearchFaildState extends DiscoverState{}