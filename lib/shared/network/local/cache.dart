import 'package:shared_preferences/shared_preferences.dart';

class Cache{
  static SharedPreferences sharedPreferences;

  static init() async{
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static void putString({String key, String value}){
    sharedPreferences.setString(key, value);
  }

  static void putBool({String key, bool value}){
    sharedPreferences.setBool(key, value);
  }

  static void putInt({String key, int value}){
    sharedPreferences.setInt(key, value);
  }

  static void putDouble({String key, double value}){
    sharedPreferences.setDouble(key, value);
  }

  static dynamic getValue({String key}){
    return sharedPreferences.get(key);
  }

  static void removeValue({String key}){
    sharedPreferences.remove(key);
  }
}