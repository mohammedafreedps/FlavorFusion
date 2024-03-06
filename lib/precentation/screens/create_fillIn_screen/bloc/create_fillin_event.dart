sealed class CreateFillinEvent {}

class CookingTimeSettedEvent extends CreateFillinEvent {}

class TakeImageFromCameraButtonClickedEvent extends CreateFillinEvent {}

class TakeImageFromGalleryButtonClickedEvent extends CreateFillinEvent {}

class UploadRecipieButtonClickedEvent extends CreateFillinEvent {
  String imagePath;
  String imageName;
  String recipeTitle;
  List<String> ingredients;
  List<String> quantitys;
  List<String> instructions;
  String prepTime;
  String cookTime;
  String totalTime;
  int difficultyLevel;
  String additionalNotes;
  UploadRecipieButtonClickedEvent(
      {required this.imagePath,
      required this.imageName,
      required this.recipeTitle,
      required this.ingredients,
      required this.quantitys,
      required this.instructions,
      required this.prepTime,
      required this.cookTime,
      required this.totalTime,
      required this.difficultyLevel,
      required this.additionalNotes});
}

class FieldFilledCheckErrorEvent extends CreateFillinEvent {}

class EditPreviewImageEvent extends CreateFillinEvent {
  String imagePath;
  EditPreviewImageEvent({required this.imagePath});
}

class SelectImageEvent extends CreateFillinEvent {}

class EditedRecipieUploadButtonClickedEvent extends CreateFillinEvent {
  int index;
  String imagePath;
  String imageName;
  String recipeTitle;
  List<String> ingredients;
  List<String> quantitys;
  List<String> instructions;
  String prepTime;
  String cookTime;
  String totalTime;
  int difficultyLevel;
  String additionalNotes;
  EditedRecipieUploadButtonClickedEvent(
      {
        required this.index,
        required this.imagePath,
      required this.imageName,
      required this.recipeTitle,
      required this.ingredients,
      required this.quantitys,
      required this.instructions,
      required this.prepTime,
      required this.cookTime,
      required this.totalTime,
      required this.difficultyLevel,
      required this.additionalNotes});
}
