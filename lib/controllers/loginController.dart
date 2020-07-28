import 'package:flutter/material.dart';

// Models
import 'package:users/models/inputData.dart';
import 'package:users/models/dataResponse.dart';

// Resources
import 'package:users/resources/mainResource.dart';

// Utils
import 'package:users/utils/extensions.dart';

class LoginController extends ChangeNotifier {

  final Extension _extension = Extension();

  final MainResource _mainResource = MainResource();

  DataResponse responseLogin = DataResponse(null, null, null);

  InputData _username = InputData(null, null);
  InputData _password = InputData(null, null);
  bool get isValid => (_username.value != null && _password.value != null);

  InputData get username => _username;
  InputData get password => _password;

  void onChangeUsername(String value) {
    value = value?.trim();
    if(_extension.validatedEmail(value)) {
      _username = InputData(value, null);
    } else {
      _username = InputData(null, 'Is not a valid email.'); 
    }
    notifyListeners();
  }

  void onChangePasssword(String value) {
    value = value?.trim();
    if(value.length >= 4) {
      _password = InputData(value, null);
    } else {
      _password = InputData(null, 'Invalid Password (min 4 characters).');
    }
    notifyListeners();
  }

  void login(BuildContext context) async {
    responseLogin = DataResponse(ResponseStates.LOADING, null, null);
    notifyListeners();
    responseLogin = await _mainResource.fetchLogin(username.value, password.value);
    notifyListeners();
    if(responseLogin.state == ResponseStates.SUCCESS) {
      Navigator.of(context).pushReplacementNamed('home');
    }
  }

}