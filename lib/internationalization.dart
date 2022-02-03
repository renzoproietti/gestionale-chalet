import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class Internationalization extends Localizations {
  late Locale _locale;
  final List<LocalizationsDelegate> _delegates = <LocalizationsDelegate>[
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalMaterialLocalizations.delegate,
  ];

  Internationalization(Locale _locale, List<LocalizationsDelegate> _delegates)
      : super(locale: _locale, delegates: _delegates);

  //Future<String> chooseLanguage(String )
}
