import 'dart:convert';
import 'dart:developer';

import 'package:dream_home/core/cache/shred_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../feature/auth/data/model/user_model.dart';

Future<void> saveUserToSharedPreferences(UserModel user) async {
  final prefs = await SharedPreferences.getInstance();
  final userData = jsonEncode(user.toJson());
  await prefs.setString(ShredKeys.user, userData);
}

Future<UserModel?> getUserFromSharedPreferences() async {
  final prefs = await SharedPreferences.getInstance();
  final userJson = prefs.getString(ShredKeys.user);
  if (userJson != null) {
    log("cached User Data $userJson");
    return UserModel.fromJson(jsonDecode(userJson));
  }
  return null;
}

Future<void> clearUserData() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.remove(ShredKeys.user);
}
