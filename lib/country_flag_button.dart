import 'package:flutter/material.dart';

class CountryFlagButton extends ElevatedButton {
  final Locale locale;
  static const Locale dummy = Locale('it');
  final ButtonStyle buttonStyle;
  static const styleDummy = ButtonStyle();

  CountryFlagButton({
    Function()? onPressed,
    Widget? child,
    this.locale = dummy,
    this.buttonStyle = styleDummy,
  }) : super(onPressed: onPressed, child: child, style: buttonStyle);
}
