
sealed class CreateInstructionsState {}

final class CreateInstructionsInitial extends CreateInstructionsState {}

class ShowInstructionsState extends CreateInstructionsState{
  final List<String> instructions;
  ShowInstructionsState({required this.instructions});
}