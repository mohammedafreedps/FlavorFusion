sealed class CreateCookingTimeState {}

final class CreateCookingTimeInitial extends CreateCookingTimeState {}

class AllTimeSettedState extends CreateCookingTimeState {}

// class EditCookingTimeState extends CreateCookingTimeState {
//   String prepTime;
//   String cookingTime;
//   String totalTime;

//   EditCookingTimeState({required this.prepTime, required this.cookingTime, required this.totalTime});
// }
