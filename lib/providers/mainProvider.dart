import 'dart:convert';

// Models
import 'package:users/models/user.dart';
import 'package:users/models/dataResponse.dart';

// Providers
import 'package:users/providers/httpProvider.dart';

// Utils
import 'package:users/utils/session.dart';

class MainProvider {

  Session _session = Session.instance;

  HttpProvider _http = HttpProvider();

  Future<DataResponse> fetchLogin(String username, String password) async {
    try {
      final response = await _http.httpPost('login', { 'email': username, 'password': password });
      final body = json.decode(response.body);
      if (response.statusCode == 200) {
        final String token = body['token'];
        _session.setToken(token);
        return DataResponse(ResponseStates.SUCCESS, token, '');
      } else {
        final String error = body['error'] ?? 'Error en el login.';
        return DataResponse(ResponseStates.ERROR, null, error);
      }      
    } catch (e) {
      return DataResponse(ResponseStates.ERROR, null, 'Error en el login.');
    }
  }

  Future<DataResponse> fetchGetUsers() async {
    try {
      final response = await _http.httpGet('users');
      final body = json.decode(response.body);
      if (response.statusCode == 200) {
        final Iterable data = body['data'];
        List<User> listUser = data.map((model)=> User.fromJson(model)).toList();
        return DataResponse(ResponseStates.SUCCESS, listUser, '');
      } else {
        return DataResponse(ResponseStates.ERROR, null, 'Error al traer la información.');
      }      
    } catch (e) {
      return DataResponse(ResponseStates.ERROR, null, 'Error al traer la información.');
    }
  }


}