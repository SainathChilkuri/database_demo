import 'package:flutter/material.dart';
class CustomColors{

  static LinearGradient gradient() {
    return LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color(0xff9c27b0),
          Color(0xffd31ba3)
        ]
    );

  }
  static const labeltextColor = Color(0xffd31ba3);
}
