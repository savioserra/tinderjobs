import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Fonts {
  static Widget montserrat(
    String text, {
    Color color = Colors.black,
    FontWeight fontWeight = FontWeight.w400,
    double fontSize = 14.0,
  }) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontFamily: "Montserrat",
        fontSize: fontSize,
      ),
    );
  }
}
