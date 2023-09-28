
 import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

 final  sharedPrefdata = sharedPref._();

 class sharedPref{

  sharedPref._();
  late SharedPreferences _preferences;
  Future<void> init() async {
   _preferences = await SharedPreferences.getInstance();
  }
  String? getString(String key) {
   log("get $key");
   return _preferences.getString(key);
  }
  void setString(String key, String val) {
   log('setString $key: $val', name: 'yatri_PREFERENCES');
   _preferences.setString(key, val);

  }
  void removeString(String key){
   log("get $key");
   _preferences.remove(key);
  // return _preferences.remove(key);
  }

 }