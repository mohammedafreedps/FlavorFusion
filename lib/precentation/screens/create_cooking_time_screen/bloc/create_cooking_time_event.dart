
sealed class CreateCookingTimeEvent {}

class SetAllTimeButtonClickedEvent extends CreateCookingTimeEvent{
  String prpTime;
  String cookingTime;
  String totalTime;
  SetAllTimeButtonClickedEvent({required this.prpTime, required this.cookingTime, required this.totalTime});
}