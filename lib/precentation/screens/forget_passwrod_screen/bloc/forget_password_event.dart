
sealed class ForgetPasswordEvent {}

final class SentEmailButtonClickedEvent extends ForgetPasswordEvent{
  String email;
  SentEmailButtonClickedEvent({required this.email});
}