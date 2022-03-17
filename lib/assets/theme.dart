import 'package:flutter/cupertino.dart';

class AppColours {
  const AppColours();

  static const Color colorStart = Color(0xFF0d47a1);
  static const Color colorEnd = Color(0xFF1565c0);

  static const buttonGradient = LinearGradient(
    colors: [colorStart, colorEnd],
    stops: [0.0, 1.0],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}
