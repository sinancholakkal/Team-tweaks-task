import 'dart:typed_data';

import 'package:hive_flutter/adapters.dart';


part 'user_model.g.dart';

@HiveType(typeId: 0)
class UserModel extends HiveObject {
  @HiveField(0)
  int? id;

  @HiveField(1)
  final String gender;

  @HiveField(2)
  final String name;

  @HiveField(3)
  final String phone;

  @HiveField(4)
  final String password;

  @HiveField(5)
  final Uint8List profile;

  @HiveField(6)
  final String email;

  UserModel({
    this.id,
    required this.gender,
    required this.name,
    required this.phone,
    required this.password,
    required this.profile,
    required this.email,
  });
}
