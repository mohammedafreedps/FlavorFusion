import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flavorfusion/data/repository/recipe_from_firebase_model.dart';
import 'package:flavorfusion/data/temp_value_holder.dart';
import 'package:flavorfusion/precentation/screens/setting_screen/bloc/setting_event.dart';
import 'package:flavorfusion/precentation/screens/setting_screen/bloc/setting_state.dart';

class SettingBloc extends Bloc<SettingEvent, SettingState> {
  SettingBloc() : super(SettingInitial()) {
    on<SettingEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<DeleteAccountButtonClickedEvent>((event, emit) async {
      emit(DeletingAccountState());
      List<RecipeFromFireBaseModel> resHold = hrecipies
          .where(
              (recip) => recip.userEmail.toLowerCase().contains(huser!.email!))
          .toList();

      for (var i = 0; i < resHold.length; i++) {
        String docId = resHold[i].docId;
        String imgPath = resHold[i].imageURL;
        final docRef =
            FirebaseFirestore.instance.collection('recipes').doc(docId);
        final imageRef = FirebaseStorage.instance.refFromURL(imgPath);
        try {
          await imageRef.delete();
          await docRef.delete();
        } on FirebaseException catch (e) {
          emit(AccountDeleteErrorState(message: e.message.toString()));
          throw e;
        }
      }
      try {
        if (huser != null && huser!.email!.isNotEmpty) {
          AuthCredential _credential = EmailAuthProvider.credential(
              email: huser!.email!, password: event.password.trim());
          await huser!.reauthenticateWithCredential(_credential);
        }
        await huser!.delete();
        emit(AccountDeleteSuccsussState(message: 'Account deleted Successfully'));
      } on FirebaseException catch (e) {
        emit(AccountDeleteErrorState(message: e.message.toString()));
        print(e);
      }
    });
  }
}
