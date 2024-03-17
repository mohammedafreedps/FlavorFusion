
sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}

class TotalLikeandPostState extends ProfileState{
  String totalLike;
  String totalPost;
  TotalLikeandPostState({required this.totalLike,required this.totalPost});
}