import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper
{
  static SharedPreferences ?sharedPreferences;

  static init() async
  {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool?> putData({
    required String key,
    required bool value,
  }) async
  {
    return await sharedPreferences!.setBool(key, value);
  }

  static bool? getData({
    required String key,
  })
  {
    return sharedPreferences!.getBool(key);
  }


  static Future<bool> putCountryData({
    required String key,
    required String? value,
  }) async
  {
    return await sharedPreferences!.setString(key, value!);
  }

  static String? getCountryData({
    required String key,
  })
  {
    return sharedPreferences!.getString(key);
  }
}