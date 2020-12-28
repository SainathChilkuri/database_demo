import 'dart:convert';

import 'package:database_demo/Model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Sessions{
  static final USER_KEY = "user";
  static bool userLoggedin = false;
  static SharedPreferences _preference;
  static Future<SharedPreferences> get preferences async {
    if(_preference == null){
      _preference = await SharedPreferences.getInstance();
    }
    return _preference;
  }
  static storeData(UserModel userModel) async {
    userLoggedin =true;
    var preference = await preferences;
    print("Storing Data");
    preference.setString(USER_KEY, json.encode(userModel.toMap()));
  }
   static Future<UserModel> getData() async {
    var pref = await preferences;
    print("getting Data");
    UserModel result = await UserModel.fromMap(json.decode(pref.getString(USER_KEY)));
    print(result.fname);
    return result;
    //return result;
  }
  static clearData() async{
    userLoggedin = false;
    var pref = await preferences;
    pref.remove(USER_KEY);
  }
  
}