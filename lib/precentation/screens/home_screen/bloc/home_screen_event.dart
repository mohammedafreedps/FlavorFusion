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

class WishListClickedEvent extends HomeScreenEvent{
  String docId;
  User user;
  WishListClickedEvent({required this.docId, required this.user});
}

class RemoveWishListClickedEvent extends HomeScreenEvent{
  String docId;
  User user;
  RemoveWishListClickedEvent({required this.docId, required this.user});
}

class SearchingEvent extends HomeScreenEvent{
  String query;
  SearchingEvent({required this.query});
}

class CategorySearchEvent extends HomeScreenEvent{
  String query;
  CategorySearchEvent({required this.query});
}