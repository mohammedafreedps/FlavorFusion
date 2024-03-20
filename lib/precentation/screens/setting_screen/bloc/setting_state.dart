
sealed class SettingState {}

final class SettingInitial extends SettingState {}

class AccountDeleteSuccsussState extends SettingState{
  String message;
  AccountDeleteSuccsussState({required this.message});
}

class AccountDeleteErrorState extends SettingState{
  String message;
  AccountDeleteErrorState({required this.message});
}
