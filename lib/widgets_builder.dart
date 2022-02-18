import 'package:flutter/material.dart';

/**File utility per la creazione dell'interfaccia base.
Tutti i metodi riguardanti operazioni che vengono 
effettuate più volte vanno inseriti qui.*/

///Crea bottone di default con un'icona e altri parametri esposti.
///Il bottone è collegato ad un _pageController e può o meno
///effettuare una transition ad una pagina se desiderato.
class CustomHomeButton extends Container {
  PageController? _pageController;
  Function()? _onPressed;
  int? _page;
  Duration? _animationTime;
  double? _size;
  EdgeInsets? _innerPadding;

  CustomHomeButton(
      {required Widget? child,
      Function()? onPressed,
      Key? key,
      PageController? pageController,
      int? page,
      Duration? animationTime,
      required EdgeInsets? innerPadding})
      : super(child: child, key: key) {
    _pageController = pageController;
    _page = page;
    _animationTime = animationTime;
    _innerPadding = innerPadding;
    _onPressed = onPressed;
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: _onPressed ??
          () {
            if (_pageController!.hasClients) {
              _pageController!.animateToPage(_page!,
                  duration: _animationTime!, curve: Curves.linearToEaseOut);
            }
          },
      child: child,
      style: ElevatedButton.styleFrom(
        primary: Colors.white10,
        shape: const CircleBorder(
          side: BorderSide(
              style: BorderStyle.solid, color: Colors.white, width: 2.0),
        ),
        padding: _innerPadding!,
        elevation: 4.0,
      ),
    );
  }
}

///crea container che occupa tutta la pagina visibile nel contesto.
class PageContainer extends Container {
  List<Color>? _gradients;

  PageContainer(
      {Key? key, required Widget child, required List<Color> gradients})
      : super(key: key, child: child) {
    _gradients = gradients;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: child,
        padding: EdgeInsets.only(top: MediaQuery.of(context).size.height / 11),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: _gradients!,
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter),
        ));
  }
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

//Transizione dalla sezione home alla sezione profilo.
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
