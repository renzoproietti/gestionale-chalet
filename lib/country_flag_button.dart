import 'package:flutter/material.dart';
import 'package:fluttertest/internationalization.dart';

class CountryFlagButton extends ElevatedButton {
  late Locale locale;

  CountryFlagButton(Function()? onPressed, Widget? child, Locale? locale)
      : super(onPressed: onPressed, child: child);

  void bindIcon() {
    this.locale = locale;
  }
}
