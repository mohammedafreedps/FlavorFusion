sealed class CreateCookingTimeEvent {}

class SetAllTimeButtonClickedEvent extends CreateCookingTimeEvent {
  String prpTime;
  String cookingTime;
  String totalTime;
  SetAllTimeButtonClickedEvent(
      {required this.prpTime,
      required this.cookingTime,
      required this.totalTime});
}

// class EditCookingTimeEvent extends CreateCookingTimeEvent {
//   String prepTime;
//   String cookingTime;
//   String totalTime;
//   EditCookingTimeEvent(
//       {required this.prepTime,
//       required this.cookingTime,
//       required this.totalTime});
// }
