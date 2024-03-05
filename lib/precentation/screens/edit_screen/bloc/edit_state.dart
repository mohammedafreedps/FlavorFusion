import 'package:image_picker/image_picker.dart';

sealed class EditState {}

final class EditInitial extends EditState {}

class UpdatedState extends EditState {
  String message;
  UpdatedState({required this.message});
}

class UpdatingState extends EditState {}

class NewImageSelectedState extends EditState {
  XFile image;
  NewImageSelectedState({required this.image});
}
