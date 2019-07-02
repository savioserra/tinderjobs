import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Fonts {
  static Widget montserrat(String text,
      {Color color = Colors.black,
      FontWeight fontWeight = FontWeight.w400,
      double fontSize = 14.0,
      TextAlign align = TextAlign.left}) {
    return Text(
      text,
      textAlign: align,
      style: TextStyle(
        color: color,
        fontFamily: "Montserrat",
        fontSize: fontSize,
      ),
    );
  }
}
