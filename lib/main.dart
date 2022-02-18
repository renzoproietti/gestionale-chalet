import 'package:flutter/material.dart';
import 'package:fluttertest/internationalization.dart';
import 'home_page.dart';

void main() => runApp(const Chalet());

//Probabilmente si potrebbero gestire le varie istanze
//del locale con un notifier, invece di aggiornarle manualmente? (@filippo)
class Chalet extends StatefulWidget {
  const Chalet({Key? key}) : super(key: key);

  @override
  _ChaletState createState() => _ChaletState();

  static _ChaletState? of(BuildContext context) =>
      context.findAncestorStateOfType<_ChaletState>();

  static void setLocale(BuildContext context, Locale newLocale) async {
    _ChaletState? state = of(context);
    state!.changeLanguage(newLocale);
  }

  static Locale getLocale(BuildContext context) {
    return of(context)!._locale;
  }
}

class _ChaletState extends State<Chalet> {
  Locale _locale = getSupportedLocales().first;

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
      supportedLocales: getSupportedLocales(),
      localizationsDelegates: getDelegates(),
      localeResolutionCallback: localeResolutionCallback,
    );
  }
}
