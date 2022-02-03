import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class AppLocalizations extends Localizations {
  late Locale _locale;

  final List<Locale> _supportedLocales = <Locale>[
    Locale('en', 'UK'),
    Locale('it', 'IT'),
  ];

  final List<LocalizationsDelegate> _delegates = <LocalizationsDelegate>[
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalMaterialLocalizations.delegate,
  ];

  AppLocalizations(Locale locale, List<LocalizationsDelegate> delegates)
      : super(locale: locale, delegates: delegates);

  void setLocale(Locale locale) {
    _locale = locale;
  }

  List<Locale?> getSupportedLocales() {
    return _supportedLocales;
  }
}
