sealed class EditEvent {}

class OnEditTitleButtonClickedEvent extends EditEvent {
  String newTitle;
  int index;
  OnEditTitleButtonClickedEvent({required this.newTitle, required this.index});
}

class OnEditAdditonalNotesClickedEvent extends EditEvent {
  String newAditionalNotes;
  int index;
  OnEditAdditonalNotesClickedEvent(
      {required this.newAditionalNotes, required this.index});
}

class OnSelectImageFromGallaryClickedEvent extends EditEvent {}

class OnEditImageClickedEvent extends EditEvent {
  String imagePath;
  int index;
  OnEditImageClickedEvent({required this.imagePath, required this.index});
}

class OnEditCookingTimeClickedEvent extends EditEvent {
  String prpTime;
  String cookTime;
  String totalTime;
  int index;
  OnEditCookingTimeClickedEvent(
      {required this.prpTime,
      required this.cookTime,
      required this.totalTime,
      required this.index});
}
