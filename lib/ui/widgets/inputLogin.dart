import 'package:flutter/material.dart';

// Utils
import 'package:users/utils/style.dart';
import 'package:users/utils/responsive.dart';

class InputLogin extends StatelessWidget {

  final String label;
  final IconData icon;
  final bool isSecure;
  final String errorText;
  final Function(String) onChange;

  InputLogin({
    Key key,
    @required this.label,
    @required this.icon,
    @required this.onChange,
    this.isSecure = false,
    this.errorText
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {

    final responsive = Responsive(context);

    return Container(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Icon( icon, size: 25, color: Style.PrimaryColor ),
          SizedBox(width: 20),
          Expanded(
            child: TextFormField(
              textAlignVertical: TextAlignVertical.bottom,
              onChanged: onChange,
              obscureText: isSecure,
              style: TextStyle( fontSize: responsive.ip(1.5), color: Style.TextColor ),
              decoration: InputDecoration(
                errorText: errorText,
                contentPadding: new EdgeInsets.only(top: 10, right: 5, bottom: 10, left: 15),
                errorStyle: TextStyle( fontSize: responsive.ip(1.4) ),
                focusedErrorBorder: _getStyle(color: Colors.red),
                focusedBorder: _getStyle(),
                enabledBorder: _getStyle(),
                errorBorder: _getStyle(color: Colors.red),
                hintText: label,
                hintStyle: Style.StyleText.copyWith( fontSize: responsive.ip(1.8) ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  UnderlineInputBorder _getStyle({Color color = Style.PrimaryColor}) {
    return UnderlineInputBorder(
      borderRadius: BorderRadius.circular(5),
      borderSide: BorderSide( color: color, width: 3 ),
    );
  }

}