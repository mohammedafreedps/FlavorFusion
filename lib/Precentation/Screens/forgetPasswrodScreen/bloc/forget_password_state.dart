
sealed class ForgetPasswordState {}

final class ForgetPasswordInitial extends ForgetPasswordState {}

final class EmailSentedSuccesState extends ForgetPasswordState{
  String message = 'Email Have been sented';
}

final class EmailSentErrorState extends ForgetPasswordState{
  String message;
  EmailSentErrorState({required this.message});
}

final class ResentEmailFormatNotCorrectState extends ForgetPasswordState{
  String message = 'Email Format not Correct';
}

final class ResentEmailIsEmptyState extends ForgetPasswordState{
  String message = 'Enter Email';
}