import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

Locale _locale = Locale('it');

void setLocale(Locale locale) {
  _locale = locale;
}

Locale getLocale() {
  return _locale;
}

Localizations localizations() {
  return Localizations(
      locale: _locale,
      delegates: const <LocalizationsDelegate>[
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ]);
}
