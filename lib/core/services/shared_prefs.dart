import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  factory SharedPref() {
    return preferences;
  }

  SharedPref._internal();
  static final SharedPref preferences = SharedPref._internal();

  static late SharedPreferences sharedPreferences;

  ///Below method is to initialize the SharedPreference instance.
  Future<dynamic> instantiatePreferences() async {
    log('Instantiating SharedPreferences');
    sharedPreferences = await SharedPreferences.getInstance();
    log('SharedPreferences instantiated');
  }

  ///Below method is to return the SharedPreference instance.
  SharedPreferences getPreferenceInstance() {
    log('Getting SharedPreference instance');
    return sharedPreferences;
  }

  ///Below method is to set the string value in the SharedPreferences.
  Future<dynamic> setString(String key, String stringValue) async {
    log('Setting string value for key: $key');
    await sharedPreferences.setString(key, stringValue);
    log('String value set: $stringValue for key: $key');
  }

  ///Below method is to get the string value from the SharedPreferences.
  String? getString(String key) {
    log('Getting string value for key: $key');
    final value = sharedPreferences.getString(key);
    log('String value retrieved: $value for key: $key');
    return value;
  }

  ///Below method is to set the boolean value in the SharedPreferences.
  Future<dynamic> setBoolean(String key, bool booleanValue) async {
    log('Setting boolean value for key: $key');
    await sharedPreferences.setBool(key, booleanValue);
    log('Boolean value set: $booleanValue for key: $key');
  }

  ///Below method is to get the boolean value from the SharedPreferences.
  bool? getBoolean(String key) {
    log('Getting boolean value for key: $key');
    final value = sharedPreferences.getBool(key);
    log('Boolean value retrieved: $value for key: $key');
    return value;
  }

  ///Below method is to set the double value in the SharedPreferences.
  Future<dynamic> setDouble(String key, double doubleValue) async {
    log('Setting double value for key: $key');
    await sharedPreferences.setDouble(key, doubleValue);
    log('Double value set: $doubleValue for key: $key');
  }

  ///Below method is to get the double value from the SharedPreferences.
  double? getDouble(String key) {
    log('Getting double value for key: $key');
    final value = sharedPreferences.getDouble(key);
    log('Double value retrieved: $value for key: $key');
    return value;
  }

  ///Below method is to set the int value in the SharedPreferences.
  Future<dynamic> setInt(String key, int intValue) async {
    log('Setting int value for key: $key');
    await sharedPreferences.setInt(key, intValue);
    log('Int value set: $intValue for key: $key');
  }

  ///Below method is to get the int value from the SharedPreferences.
  int? getInt(String key) {
    log('Getting int value for key: $key');
    final value = sharedPreferences.getInt(key);
    log('Int value retrieved: $value for key: $key');
    return value;
  }

  ///Below method is to remove the received preference.
  Future<dynamic> removePreference(String key) async {
    log('Removing preference for key: $key');
    await sharedPreferences.remove(key);
    log('Preference removed for key: $key');
  }

  ///Below method is to check the availability of the received preference.
  bool containPreference(String key) {
    log('Checking preference availability for key: $key');
    final result = sharedPreferences.get(key) != null;
    log('Preference availability for key: $key is $result');
    return result;
  }

  ///Below method is to clear the SharedPreference.
  Future<dynamic> clearPreferences() async {
    log('Clearing all SharedPreferences');
    await sharedPreferences.clear();
    log('All SharedPreferences cleared');
  }
}
