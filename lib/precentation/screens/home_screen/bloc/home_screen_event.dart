
import 'package:firebase_auth/firebase_auth.dart';

sealed class HomeScreenEvent {}

class FechDataFromFirebaseEvent extends HomeScreenEvent{}

class LikeButtonClickedEvent extends HomeScreenEvent{
  String docId;
  User user;
  LikeButtonClickedEvent({required this.docId,required this.user});
}
class DislikeButtonClickedEvent extends HomeScreenEvent{
  String docId;
  User user;
  DislikeButtonClickedEvent({required this.docId,required this.user});
}