import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

// Controllers
import 'package:users/controllers/loginController.dart';

// Models
import 'package:users/models/dataResponse.dart';

// Widgets
import 'package:users/ui/widgets/inputLogin.dart';

// utils
import 'package:users/utils/style.dart';
import 'package:users/utils/responsive.dart';

class FormLogin extends StatelessWidget {
  
  const FormLogin({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    LoginController _loginController = Provider.of<LoginController>(context);

    Responsive responsive = Responsive(context);

    void _login() {
      FocusScope.of(context).requestFocus(FocusNode());
      _loginController.login(context);
    }    

    Widget _textError = Text(
      (_loginController.responseLogin.state == ResponseStates.ERROR) ? _loginController.responseLogin.msm : '',
      style: Style.StyleTitle.copyWith(color: Colors.red),
    );

    Widget _btnItem = MaterialButton(
      onPressed: _loginController.isValid ? _login : null,
      minWidth: responsive.wp(85),
      height: 55,
      color: Style.PrimaryColor,
      disabledColor: Colors.black12,
      shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(30) ),
      child: Text(
        'SIGN IN',
        style: Style.StyleText.copyWith( color: Colors.white, letterSpacing: 2, fontSize: responsive.ip(1.8) ),
      ),
    );

    Widget _footerText = RichText(
      text: TextSpan(
        text: 'Don’t have an account?   ',
        style: Style.StyleText.copyWith(fontSize: responsive.ip(1.6) ),
        children: [
          TextSpan(
            text: 'SIGN UP',
            style: Style.StyleTitle.copyWith(fontSize: responsive.ip(1.6), color: Style.PrimaryColor ),
          )
        ]
      ),
    );
    
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        _textError,
        InputLogin(
          label: 'Username',
          icon: Icons.person_outline,
          errorText: _loginController.username.error,
          onChange: _loginController.onChangeUsername,
        ),
        InputLogin(
          label: 'Password',
          icon: Icons.security,
          isSecure: true,
          errorText: _loginController.password.error,
          onChange: _loginController.onChangePasssword,
        ),
        (_loginController.responseLogin.state == ResponseStates.LOADING) ? CircularProgressIndicator() : _btnItem,
        _footerText
      ],
    );

  }

}