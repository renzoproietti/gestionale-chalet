import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

List<Locale> _supportedLocales = const <Locale>[
  Locale('it', 'IT'),
  Locale('en', 'UK'),
];

List<LocalizationsDelegate> _delegates = const [
  AppLocalizations.delegate,
  GlobalCupertinoLocalizations.delegate,
  GlobalMaterialLocalizations.delegate,
  GlobalWidgetsLocalizations.delegate
];

Locale? localeResolutionCallback(
    Locale? locale, Iterable<Locale?> supportedLocales) {
  for (var supportedLocale in supportedLocales) {
    if (supportedLocale!.languageCode == locale!.languageCode &&
        supportedLocale.countryCode == locale.countryCode) {
      return supportedLocale;
    }
  }
  return supportedLocales.first;
}

List<Locale> getSupportedLocales() {
  return _supportedLocales;
}

List<LocalizationsDelegate> getDelegates() {
  return _delegates;
}
