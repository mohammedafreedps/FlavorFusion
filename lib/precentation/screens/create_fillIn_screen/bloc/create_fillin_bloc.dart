import 'dart:io';
import 'dart:typed_data';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flavorfusion/data/temp_value_holder.dart';
import 'package:flavorfusion/precentation/screens/create_fillIn_screen/bloc/create_fillin_event.dart';
import 'package:flavorfusion/precentation/screens/create_fillIn_screen/bloc/create_fillin_state.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

class CreateFillinBloc extends Bloc<CreateFillinEvent, CreateFillinState> {
  ImagePicker picker = ImagePicker();
  CreateFillinBloc() : super(CreateFillinInitial()) {
    on<CreateFillinEvent>((event, emit) {});

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
      // File imageFile = File(event.imagePath);
      final Uint8List? compressedImage =
          await FlutterImageCompress.compressWithFile(
        event.imagePath,
        quality: 60,
      );
      final tempDir = await getTemporaryDirectory();
      final tempPath = tempDir.path;
      final tempFile = File('$tempPath/$fileName');
      await tempFile.writeAsBytes(compressedImage!);
      try {
        await storage.ref('thumbnails/$fileName').putFile(tempFile);
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
          'additionalNotes': event.additionalNotes,
          'likes': [],
          'wishlist': []
        });

        emit(RecipieUploadedStete());
      } on FirebaseException catch (e) {
        emit(ImageUploadFailedState(message: e.message.toString()));
      }
    });

    on<FieldFilledCheckErrorEvent>((event, emit) {
      emit(NotFilledAllFieldsState());
    });

    on<EditPreviewImageEvent>((event, emit) {
      emit(EditPreviewImageState(imagePath: event.imagePath));
    });

    on<SelectImageEvent>((event, emit) {
      emit(SelectImageState());
    });

    on<EditedRecipieUploadButtonClickedEvent>((event, emit) async {
      emit(RecipieUploadingStete());
      final storage = FirebaseStorage.instance;
      String imgPath = hposterRecipes[event.index].imageURL;
      // File imgFile = File(event.imagePath);
      String docId = hposterRecipes[event.index].docId;
      String imageName = DateTime.now().toString();
      final colRef =
          FirebaseFirestore.instance.collection('recipes').doc(docId);
      final imageRef = FirebaseStorage.instance.refFromURL(imgPath);
      try {
        await imageRef.delete();
        final Uint8List? compressedImage =
            await FlutterImageCompress.compressWithFile(
          event.imagePath,
          quality: 60,
        );
        final tempDir = await getTemporaryDirectory();
        final tempPath = tempDir.path;
        final String fileName = 'recipe'+ DateTime.now().toString();
        final tempFile = File('$tempPath/$fileName');
        await tempFile.writeAsBytes(compressedImage!);
        await storage.ref('thumbnails/$imageName').putFile(tempFile);
        String downlordURL =
            await storage.ref('thumbnails/$imageName').getDownloadURL();
        colRef.update({
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
        emit(EditRecipieUploadedState());
      } on FirebaseAuthException catch (e) {
        emit(EditRecipieUploadFailState(message: e.message.toString()));
      }
    });
  }
}
