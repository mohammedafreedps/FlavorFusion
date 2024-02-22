import 'dart:convert';

class MealapiModel {
  String mealId;
  String strMeal;
  String strCategory;
  String strInstructions;
  String strMealThumb;
  List<String> strIngredients;
  List<String> strMeasures;

  MealapiModel({
    required this.mealId,
    required this.strMeal,
    required this.strCategory,
    required this.strInstructions,
    required this.strMealThumb,
    required this.strIngredients,
    required this.strMeasures,
  });

  factory MealapiModel.fromJson(Map<String, dynamic> json) {
    List<String> ingredients = [];
    List<String> measures = [];

    // Extract ingredients and measures from JSON
    for (int i = 1; i <= 20; i++) {
      String ingredientKey = 'strIngredient$i';
      String measureKey = 'strMeasure$i';

      String? ingredient = json[ingredientKey];
      String? measure = json[measureKey];

      if (ingredient != null && ingredient.isNotEmpty) {
        ingredients.add(ingredient);
        measures.add(measure ?? '');
      }
    }

    return MealapiModel(
      mealId: json['idMeal'],
      strMeal: json['strMeal'],
      strCategory: json['strCategory'],
      strInstructions: json['strInstructions'],
      strMealThumb: json['strMealThumb'],
      strIngredients: ingredients,
      strMeasures: measures,
    );
  }
}

List<MealapiModel> parseMealapiModels(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
  return parsed
      .map<MealapiModel>((json) => MealapiModel.fromJson(json))
      .toList();
}
