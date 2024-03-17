import 'package:flavorfusion/data/repository/recipe_from_firebase_model.dart';
import 'package:flavorfusion/data/temp_value_holder.dart';
import 'package:flavorfusion/precentation/screens/profile_screen/bloc/profile_event.dart';
import 'package:flavorfusion/precentation/screens/profile_screen/bloc/profile_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileInitial()) {
    on<ProfileEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<CountTotalLikeandPostEvent>((event, emit) {
      int post = 0;
      int likes = 0;
      List<RecipeFromFireBaseModel> resHold = hrecipies
          .where((recip) => recip.userEmail
              .toLowerCase()
              .contains(huser!.email!))
          .toList();
      post = resHold.length;
      for(int i = 0; i < resHold.length; i++){
        likes += resHold[i].likes.length;
      }
      emit(TotalLikeandPostState(totalLike: likes.toString(), totalPost: post.toString()));
    });
  }
}
