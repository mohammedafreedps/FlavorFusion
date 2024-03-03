import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flavorfusion/data/temp_value_holder.dart';
import 'package:flavorfusion/precentation/screens/create_fillIn_screen/bloc/create_fillin_event.dart';
import 'package:flavorfusion/precentation/screens/create_fillIn_screen/bloc/create_fillin_state.dart';
import 'package:image_picker/image_picker.dart';

class CreateFillinBloc extends Bloc<CreateFillinEvent, CreateFillinState> {
  ImagePicker picker = ImagePicker();
  CreateFillinBloc() : super(CreateFillinInitial()) {
    on<CreateFillinEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<CookingTimeSettedEvent>((event, emit) {
      print(hprepTime! + 'fillin');
      emit(CookingTimesState(
          prpTime: hprepTime!,
          cookingTime: hcookTime!,
          totalTime: htotalTime!));
    });

    on<TakeImageFromCameraButtonClickedEvent>((event, emit) async {
      XFile? image = await picker.pickImage(source: ImageSource.camera);
      if (image != null) {
        himagePath = image.path;
        emit(ShowSelectedImageState(image: image));
      }
    });

    on<TakeImageFromGalleryButtonClickedEvent>((event, emit) async {
      XFile? image = await picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        himagePath = image.path;
        emit(ShowSelectedImageState(image: image));
      }
    });

    on<UploadRecipieButtonClickedEvent>((event, emit) async {
      emit(RecipieUploadingStete());
      final firebase_storage.FirebaseStorage storage =
          firebase_storage.FirebaseStorage.instance;
      String fileName = event.imageName;
      File imageFile = File(event.imagePath);
      try {
        await storage.ref('thumbnails/$fileName').putFile(imageFile);
        String downlordURL =
            await storage.ref('thumbnails/$fileName').getDownloadURL();
        print(downlordURL + 'uploaded imge in firesoter');
        final User? _user = FirebaseAuth.instance.currentUser;
        String docName = DateTime.now().toString();
        await FirebaseFirestore.instance
            .collection('recipes')
            .doc('recipie$docName')
            .set({
          'userEmail': _user!.email,
          'imageURL': downlordURL,
          'recipeTitle': event.recipeTitle,
          'ingredients': event.ingredients,
          'quantitys': event.quantitys,
          'instructions': event.instructions,
          'prepTime': event.prepTime,
          'cookTime': event.cookTime,
          'totalTime': event.totalTime,
          'difficultyLevel': event.difficultyLevel,
          'additionalNotes': event.additionalNotes
        });
        emit(RecipieUploadedStete());
      } on FirebaseException catch (e) {
        emit(ImageUploadFailedState(message: e.message.toString()));
      }
    });

    on<FieldFilledCheckErrorEvent>((event, emit) {
      emit(NotFilledAllFieldsState());
    });
  }
}
