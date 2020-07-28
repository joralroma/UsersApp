import 'dart:async';

// Models
import 'package:users/models/dataResponse.dart';

// Providers
import 'package:users/providers/mainProvider.dart';


class MainResource {

  final mainProvider = MainProvider();

  Future<DataResponse> fetchLogin(String username, String password) => mainProvider.fetchLogin(username, password);
  Future<DataResponse> fetchGetUsers() => mainProvider.fetchGetUsers();

}

final mainResource = MainResource();