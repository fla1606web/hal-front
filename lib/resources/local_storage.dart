import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static late SharedPreferences prefs;

  static Future<void> configurePrefs() async {
    prefs = await SharedPreferences.getInstance();
  }    

  static Future<bool> saveUserData (String key, String data) async {
    return await prefs.setString(key, data);
  }

  static String getUserData (String key) {
    return prefs.getString(key) ?? "";
  }
    
}