import 'dart:developer';

import 'package:hive_flutter/adapters.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:team_week_task/models/user_model.dart';
import 'package:team_week_task/services/auth_services.dart';
import 'package:team_week_task/services/user_cred.dart';

class DbServices implements AuthServices {
  @override
  Future<bool> userRegister(UserModel userModel) async {
    try {
      List<UserModel>userModels = await userLogin();
      userModels.forEach((model){
        log(model.email.toString());
        if(model.email==userModel.email){
          throw("This email is already registered");
        }
      });
      final db = await Hive.openBox<UserModel>('userregisterinfo');
      final key = await db.add(userModel);
      userModel.id = key;
      await db.put(key, userModel);
      log("User added in hive and sharedprf called");
      await UserCred.saveUser(userModel.email, userModel.password,key);
      return true;
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  Future<List<UserModel>> userLogin() async {
    List<UserModel> models = [];
    try {
      final db = await Hive.openBox<UserModel>('userregisterinfo');
      models.addAll(db.values.toList());
    } catch (e) {
      log(e.toString());
    }
    return models;
  }
  
  @override
  Future<void> logout()async {
   SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.clear();
  }

  Future<UserModel>getUser()async{
    SharedPreferences preferences = await SharedPreferences.getInstance();

    int? userId = preferences.getInt("userid");
    final db = await Hive.openBox<UserModel>('userregisterinfo');
    if(userId!=null){
      return db.getAt(userId)!;
      
    }else{
      log("User id is null while fetch user details");

    }
    throw "";
  }
  
}
