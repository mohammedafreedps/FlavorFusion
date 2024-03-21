
sealed class SettingEvent {}

class DeleteAccountButtonClickedEvent extends SettingEvent{
  String password;
  DeleteAccountButtonClickedEvent({required this.password});
}