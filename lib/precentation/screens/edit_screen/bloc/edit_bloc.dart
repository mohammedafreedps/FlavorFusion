import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flavorfusion/data/temp_value_holder.dart';
import 'package:flavorfusion/precentation/screens/edit_screen/bloc/edit_event.dart';
import 'package:flavorfusion/precentation/screens/edit_screen/bloc/edit_state.dart';
import 'package:image_picker/image_picker.dart';

class EditBloc extends Bloc<EditEvent, EditState> {
  ImagePicker picker = ImagePicker();
  EditBloc() : super(EditInitial()) {
    on<EditEvent>((event, emit) {});

    on<OnEditTitleButtonClickedEvent>((event, emit) async {
      emit(UpdatingState());
      String _docId = hposterRecipes[event.index].docId;
      final colRef =
          FirebaseFirestore.instance.collection('recipes').doc(_docId);
      try {
        await colRef.update({'recipeTitle': event.newTitle});
        emit(UpdatedState(message: 'Title Updated Succesfully'));
      } on FirebaseException catch (e) {
        print(e);
      }
    });

    on<OnEditAdditonalNotesClickedEvent>((event, emit) async {
      emit(UpdatingState());
      String _docId = hposterRecipes[event.index].docId;
      final colRef =
          FirebaseFirestore.instance.collection('recipes').doc(_docId);
      try {
        await colRef.update({'additionalNotes': event.newAditionalNotes});
        emit(UpdatedState(message: 'Additional Notes Updated'));
      } on FirebaseException catch (e) {
        print(e);
      }
    });

    on<OnSelectImageFromGallaryClickedEvent>((event, emit) async {
      XFile? image = await picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        himagePath = image.path;
        emit(NewImageSelectedState(image: image));
      }
    });

    on<OnEditImageClickedEvent>((event, emit) async {
      emit(UpdatingState());
      final storage = FirebaseStorage.instance;
      String imgPath =
          hposterRecipes[event.index].imageURL; //firebase imgae link
      File imgFile = File(event.imagePath); // from device image linl
      String docId = hposterRecipes[event.index].docId;
      String imageName = DateTime.now().toString();
      final colRef =
          FirebaseFirestore.instance.collection('recipes').doc(docId);
      final imageRef = FirebaseStorage.instance.refFromURL(imgPath);
      try {
        await imageRef.delete();
        await storage.ref('thumbnails/$imageName').putFile(imgFile);
        String downlordURL =
            await storage.ref('thumbnails/$imageName').getDownloadURL();
        await colRef.update({'imageURL': downlordURL});
        emit(UpdatedState(message: 'Image Have been Updated'));
      } on FirebaseException catch (e) {
        print(e);
      }
    });

    on<OnEditCookingTimeClickedEvent>((event, emit) async {
      String _docId = hposterRecipes[event.index].docId;
      final colRef =
          FirebaseFirestore.instance.collection('recipes').doc(_docId);
      try {
        await colRef.update({
          'prepTime': event.prpTime,
          'cookTime': event.cookTime,
          'totalTime': event.totalTime
        });
        emit(UpdatedState(message: 'Cooking Time Updated Succesfully'));
      } on FirebaseException catch (e) {
        print(e);
      }
    });
  }
}
