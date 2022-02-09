import 'package:flutter/material.dart';
import 'package:fluttertest/internationalization.dart';
import 'home_page.dart';

///Il main lancia CasottoHome, che altro non è che un
void main() => runApp(const Chalet());

class Chalet extends StatefulWidget {
  const Chalet({Key? key}) : super(key: key);

  @override
  _ChaletState createState() => _ChaletState();

  static _ChaletState? of(BuildContext context) =>
      context.findAncestorStateOfType<_ChaletState>();

  static void setLocale(BuildContext context, Locale newLocale) async {
    _ChaletState? state = context.findAncestorStateOfType<_ChaletState>();
    state!.changeLanguage(newLocale);
  }

  static Locale getLocale(BuildContext context) {
    _ChaletState? state = context.findAncestorStateOfType<_ChaletState>();
    return state!._locale;
  }
}

class _ChaletState extends State<Chalet> {
  Locale _locale = const Locale('it', 'IT');

  void changeLanguage(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      locale: _locale,
      supportedLocales: supportedLocales,
      localizationsDelegates: delegates,
      localeResolutionCallback: localeResolutionCallback,
    );
  }
}
