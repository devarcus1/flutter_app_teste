import 'package:shared_preferences/shared_preferences.dart';

class SharedPreference {

  static final SharedPreference _instance = SharedPreference._construtor();
  factory SharedPreference(){
    return _instance;
  }

  SharedPreference._construtor();

  SharedPreferences _prefs;

  init() async{
    _prefs = await SharedPreferences.getInstance();
  }

  bool get themeLight {
    return _prefs?.getBool('theme') ?? true ;
  }

  set themeLight(bool value) {
    _prefs?.setBool('theme', value);
  }


}
