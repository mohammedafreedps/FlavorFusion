
sealed class DiscoverEvent {}

class FechDataEvent extends DiscoverEvent {}
class SearchForRecipeEvent extends DiscoverEvent{
  String searchKeywork;
  SearchForRecipeEvent({required this.searchKeywork});
}


