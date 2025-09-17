import 'package:shared_preferences/shared_preferences.dart';

class UserCred {
  static Future<void> saveUser(String email, String password,int userId) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('email', email);
  await prefs.setString('password', password);
  await prefs.setInt('userid', userId);
}
}