

sealed class CreateInstructionsEvent {}

class AddStepsButtonClickedEvent extends CreateInstructionsEvent {
  String instruction;
  AddStepsButtonClickedEvent({required this.instruction});
}

class DeleteStepsButtonClickedEvent extends CreateInstructionsEvent{
  int index;
  DeleteStepsButtonClickedEvent({required this.index});
}