import 'package:team_week_task/models/user_model.dart';

abstract class AuthServices {
  Future<bool>userRegister(UserModel userModel);
  Future<List<UserModel>>userLogin();
  Future<void>logout();
}