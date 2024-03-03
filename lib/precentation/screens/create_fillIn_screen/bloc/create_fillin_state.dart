
import 'package:image_picker/image_picker.dart';

sealed class CreateFillinState {}

final class CreateFillinInitial extends CreateFillinState {}

final class CookingTimesState extends CreateFillinState {
  String prpTime;
  String cookingTime;
  String totalTime;

  CookingTimesState({required this.prpTime, required this.cookingTime, required this.totalTime});
}

class ShowSelectedImageState extends CreateFillinState {
  XFile image;
  ShowSelectedImageState({required this.image});
}

class ImageUploadFailedState extends CreateFillinState{
  String message;
  ImageUploadFailedState({required this.message});
}

class NotFilledAllFieldsState extends CreateFillinState{}

class RecipieUploadingStete extends CreateFillinState{}

class RecipieUploadedStete extends CreateFillinState{}