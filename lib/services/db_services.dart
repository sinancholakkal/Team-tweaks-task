import 'dart:developer';

import 'package:hive_flutter/adapters.dart';
import 'package:team_week_task/models/user_model.dart';
import 'package:team_week_task/services/auth_services.dart';
import 'package:team_week_task/services/user_cred.dart';

class DbServices implements AuthServices {
  @override
  Future<bool> userRegister(UserModel userModel) async {
    try {
      final db = await Hive.openBox<UserModel>('userregisterinfo');
      final key = await db.add(userModel);
      userModel.id = key;
      await db.put(key, userModel);
      log("User added in hive and sharedprf called");
      await UserCred.saveUser(userModel.email, userModel.password);
      return true;
    } catch (e) {
      return false;
    }
  }
}
