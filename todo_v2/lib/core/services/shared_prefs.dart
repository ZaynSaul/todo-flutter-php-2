import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_v2/model/user_model.dart';

class SharedPreferencesManager {
  SharedPreferences? preferences;

  SharedPreferencesManager() {
    SharedPreferences.getInstance();
  }

  Future<bool> putBool(String key, bool value) async {
    final preferences = await SharedPreferences.getInstance();
    return preferences.setBool(key, value);
  }

  Future<bool> getBool(String key) async {
    final preferences = await SharedPreferences.getInstance();
    return preferences.getBool(key) ?? false;
  }

  Future<bool> putDouble(String key, double value) async {
    final preferences = await SharedPreferences.getInstance();
    return preferences.setDouble(key, value);
  }

  Future<double?> getDouble(String key) async {
    final preferences = await SharedPreferences.getInstance();
    return preferences.getDouble(key);
  }

  Future<bool?> putInt(String key, int value) async {
    final preferences = await SharedPreferences.getInstance();
    return preferences.setInt(key, value);
  }

  Future<int?> getInt(String key) async {
    final preferences = await SharedPreferences.getInstance();
    return preferences.getInt(key);
  }

  Future<bool?> putString(String key, String value) async {
    final preferences = await SharedPreferences.getInstance();
    return preferences.setString(key, value);
  }

  Future<String?> getString(String key) async {
    final preferences = await SharedPreferences.getInstance();
    return preferences.getString(key);
  }

  Future<bool?> putStringList(String key, List<String> value) async {
    final preferences = await SharedPreferences.getInstance();
    return preferences.setStringList(key, value);
  }

  Future<bool?> putUserData(String key, UserModel value) async {
    final preferences = await SharedPreferences.getInstance();
    String userJson = json.encode(value.toJson());
    return preferences.setString(key, userJson);
  }

  Future<List<String>?> getStringList(String key) async {
    final preferences = await SharedPreferences.getInstance();
    return preferences.getStringList(key);
  }

  Future<UserModel?> loadUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userJson = prefs.getString('user');
    if (userJson != null) {
      Map<String, dynamic> userMap = json.decode(userJson);
      return UserModel.fromJson(userMap);
    } else {
      return null;
    }
  }

  Future<bool> isKeyExists(String key) async {
    final preferences = await SharedPreferences.getInstance();
    return preferences.containsKey(key);
  }

  Future<bool?> clearKey(String key) async {
    final preferences = await SharedPreferences.getInstance();
    return preferences.remove(key);
  }

  Future<bool?> clearAll() async {
    final preferences = await SharedPreferences.getInstance();
    return preferences.clear();
  }
}
