import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

/**File utility per la creazione dell'interfaccia base.
Tutti i metodi riguardanti operazioni che vengono 
effettuate più volte vanno inseriti qui.*/

///Crea bottone di default con un'icona e altri parametri esposti.
///Il bottone è collegato ad un _pageController e può o meno
///effettuare una transizione ad una pagina se desiderato.
ElevatedButton createButton(
    PageController _pageController,
    AssetImage buttonIcon,
    double size,
    double innerPadding,
    int page,
    Duration animationTime) {
  return ElevatedButton(
    onPressed: () {
      if (_pageController.hasClients) {
        _pageController.animateToPage(page,
            duration: animationTime, curve: Curves.linearToEaseOut);
      }
    },
    child: Image(
      image: buttonIcon,
      width: size,
      height: size,
    ),
    style: ElevatedButton.styleFrom(
      primary: Colors.white10,
      shape: const CircleBorder(
        side: BorderSide(
            style: BorderStyle.solid, color: Colors.white, width: 2.0),
      ),
      padding: EdgeInsets.all(innerPadding),
      elevation: 4.0,
    ),
  );
}

///crea container che occupa tutta la pagina visibile nel contesto.
Container createPageContainer(
    BuildContext context, Color background, ElevatedButton button, Widget child,
    {double firstPadding = 0,
    double secondPadding = 0,
    Color gradientFrom = Colors.transparent,
    Color gradientTo = Colors.transparent,
    Alignment begin = Alignment.topCenter,
    Alignment end = Alignment.bottomCenter}) {
  return Container(
    padding: EdgeInsets.only(top: MediaQuery.of(context).size.height / 11),
    alignment: Alignment.center,
    decoration: BoxDecoration(
      gradient: LinearGradient(
          colors: [gradientFrom, gradientTo], begin: begin, end: end),
      color: background,
    ),
    child: Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Padding(padding: EdgeInsets.only(top: firstPadding)),
        button,
        Padding(padding: EdgeInsets.only(top: secondPadding)),
        child,
      ],
    ),
  );
}

///Crea testo semplice con font Raleway e alcuni parametri esposti.
Text createText(String text,
    {TextAlign alignment = TextAlign.center,
    FontWeight weight = FontWeight.normal,
    double letterSpacing = 1.0,
    double size = 24,
    Color color = Colors.white}) {
  return Text(
    text,
    textAlign: alignment,
    style: TextStyle(
        fontFamily: 'Raleway',
        fontWeight: weight,
        fontSize: size,
        letterSpacing: letterSpacing,
        color: color),
  );
}

Route createRoute(Widget loginPage) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => loginPage,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(-1.0, 0.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}

Localizations initLocalizations(Locale locale) {
  return Localizations(locale: locale, delegates: const <LocalizationsDelegate>[
    AppLocalizations.delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ]);
}
