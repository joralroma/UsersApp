import 'package:flutter/cupertino.dart';

// Pages
import 'package:users/ui/pages/homePage.dart';
import 'package:users/ui/pages/loginPage.dart';

final Map<String, WidgetBuilder> routes = <String, WidgetBuilder> {
  'login': (context) => LoginPage(),
  'home': (context) => HomePage(),
};