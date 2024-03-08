class SavedRecipeModel {
  final String docId;
  final String additionalNotes;
  final String cookTime;
  final int difficultyLevel;
  final String imageURL;
  final List<String> ingredients;
  final List<String> instructions;
  final String prepTime;
  final List<String> quantitys;
  final String recipeTitle;
  final String totalTime;
  final String userEmail;
  final List likes;
  final List wishlist;
  SavedRecipeModel({
    required this.docId,
    required this.additionalNotes,
    required this.cookTime,
    required this.difficultyLevel,
    required this.imageURL,
    required this.ingredients,
    required this.instructions,
    required this.prepTime,
    required this.quantitys,
    required this.recipeTitle,
    required this.totalTime,
    required this.userEmail,
    required this.likes,
    required this.wishlist
  });

  factory SavedRecipeModel.fromMap(String docId, Map<String, dynamic> map) {
    return SavedRecipeModel(
      docId: docId,
      additionalNotes: map['additionalNotes'],
      cookTime: map['cookTime'],
      difficultyLevel: map['difficultyLevel'],
      imageURL: map['imageURL'],
      ingredients: List<String>.from(map['ingredients']),
      instructions: List<String>.from(map['instructions']),
      prepTime: map['prepTime'],
      quantitys: List<String>.from(map['quantitys']),
      recipeTitle: map['recipeTitle'],
      totalTime: map['totalTime'],
      userEmail: map['userEmail'],
      likes : map['likes'],
      wishlist : map['wishlist']
    );
  }
}
