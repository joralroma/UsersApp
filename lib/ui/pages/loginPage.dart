import 'package:flutter/material.dart';

// Widgets
import 'package:users/ui/widgets/botWidget.dart';
import 'package:users/ui/widgets/formLogin.dart';

// Utils
import 'package:users/utils/style.dart';
import 'package:users/utils/responsive.dart';

class LoginPage extends StatelessWidget {

  const LoginPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Responsive responsive = Responsive(context);

    Widget _contentBottom = Flexible(
      child: Container(
        padding: const EdgeInsets.only(top: 50, right: 20, bottom: 20, left: 30),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(100)
          )
        ),
        child: FormLogin(),
      )
    );

    return Scaffold(
      backgroundColor: Style.PrimaryColor,
      resizeToAvoidBottomPadding: true,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            height: responsive.height,
            child: Column(
              children: <Widget>[
                const BotWidget(),
                _contentBottom
              ],
            ),
          ),
        ),
      ),
    );

  }

}