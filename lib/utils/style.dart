import 'package:flutter/material.dart';

class Style {

// Fonts
  static const GibsonBold =  "GibsonBold";
  static const GibsonRegular =  "GibsonRegular";


// Colors
  static const PrimaryColor =  Color(0xFFFEDD7C);
  static const TextColor =  Color(0xFF707070);
  static const BtnColor =  Color(0xFF1A1A1A);


  static const StyleTitle = TextStyle(
    color: Style.TextColor,
    fontSize: 18,
    fontFamily: Style.GibsonBold
  );

  static const StyleText = TextStyle(
    color: Style.TextColor,
    fontSize: 15,
    fontFamily: Style.GibsonRegular
  );
  
}