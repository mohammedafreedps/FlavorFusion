import 'package:shared_preferences/shared_preferences.dart';

void firstTimeLogin()async{
  print('login bool function called');
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setBool('isFirstLogin', true);
}