

sealed class CreateInstructionsEvent {}

class AddStepsButtonClickedEvent extends CreateInstructionsEvent {
  String instruction;
  AddStepsButtonClickedEvent({required this.instruction});
}

class DeleteStepsButtonClickedEvent extends CreateInstructionsEvent{
  int index;
  DeleteStepsButtonClickedEvent({required this.index});
}

class EditStepsEvent extends CreateInstructionsEvent{
  List<String> instruction;
  EditStepsEvent({required this.instruction});
}