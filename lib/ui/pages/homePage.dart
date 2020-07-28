import 'package:flutter/material.dart';

// Widgets
import 'package:users/ui/widgets/topBar.dart';
import 'package:users/ui/widgets/listUsersWidget.dart';

class HomePage extends StatelessWidget {
  
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        top: false,
        child: Column(
          children: <Widget>[
            const TopBar(),
            const ListUsers(),
          ],
        )
      ),
    );
  }
}