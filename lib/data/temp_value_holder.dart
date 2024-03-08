import 'package:firebase_auth/firebase_auth.dart';
import 'package:flavorfusion/data/repository/recipe_from_firebase_model.dart';
import 'package:flavorfusion/data/repository/saved_recipes_model.dart';

List<String> hcreatedIngredents = [];
  List<String> hcreatedQuantitys = [];
  List<String> hinstructionsSteps = [];
  String? hprepTime ='';
  String? hcookTime ='';
  String? htotalTime ='';
  String? himagePath;
  List<RecipeFromFireBaseModel> hrecipies = [];
  List<RecipeFromFireBaseModel> hposterRecipes = [];
  User? huser;
  List hlikes = [];
  List<SavedRecipeModel> hsavedRecipes = [];