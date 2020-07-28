import 'package:shared_preferences/shared_preferences.dart';

class Session {

  SharedPreferences _sharedPreferences;

  final keys = {
    "keyToken": "UsersAppToken"
  };  

  static final Session _singleton = new Session._internal();
  Session._internal() { _initData(); }
  static Session get instance => _singleton;


  void _initData() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  void setToken(String token) {
    _sharedPreferences.setString(keys['keyToken'], token);
  }

  String getToken() {
    return _sharedPreferences.getString(keys['keyToken']);
  }

}