import 'package:flutter/material.dart';

// Models
import 'package:users/models/user.dart';
import 'package:users/models/dataResponse.dart';

// Resources
import 'package:users/resources/mainResource.dart';

class HomeController extends ChangeNotifier {

  final MainResource _mainResource = MainResource();

  DataResponse responseGetUsers = DataResponse(null, null, null);

  List<User> users = [];
  
  void getUsers() async {
    responseGetUsers = DataResponse(ResponseStates.LOADING, null, null);
    notifyListeners();
    responseGetUsers = await _mainResource.fetchGetUsers();
    if(responseGetUsers.state == ResponseStates.SUCCESS) users = responseGetUsers.data;
    notifyListeners();
  }

}