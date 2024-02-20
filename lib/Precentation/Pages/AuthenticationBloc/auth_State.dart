


sealed class AuthenticationBlocState {}

final class GlobalInitial extends AuthenticationBlocState {}
final class LoggedInState extends AuthenticationBlocState{}
final class LoggedOutState extends AuthenticationBlocState{}
final class SplashState extends AuthenticationBlocState{}
final class FirstOpeningState extends AuthenticationBlocState{}
final class IncorrectCredentialState extends AuthenticationBlocState{}
final class LoadingState extends AuthenticationBlocState{}
