import 'package:flutter/material.dart';

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

///metodo per la creazione dei container a pagina 2 (Sezione lettini).
AnimatedContainer createCustomSelectContainer(
    BuildContext context, Icon icon, String text, double arrowPadding) {
  return AnimatedContainer(
    duration: const Duration(milliseconds: 0),
    curve: Curves.easeInOut,
    color: Colors.white,
    padding: EdgeInsets.symmetric(
        vertical: 20, horizontal: MediaQuery.of(context).size.width / 25),
    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      const Image(
        image: AssetImage("lib/assets/green_circle.png"),
        width: 24,
        height: 24,
      ),
      Padding(
          padding:
              EdgeInsets.only(left: MediaQuery.of(context).size.width / 6)),
      icon,
      Padding(
          padding:
              EdgeInsets.only(left: MediaQuery.of(context).size.width / 25)),
      Text(
        text,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontFamily: 'Raleway',
          fontWeight: FontWeight.normal,
          letterSpacing: 1,
          fontSize: 14,
        ),
      ),
      Padding(padding: EdgeInsets.only(left: arrowPadding)),
      const Icon(Icons.arrow_forward_ios_rounded),
    ]),
  );
}

///crea container che occupa tutta la pagina visibile nel contesto.
Container createPageContainer(
  BuildContext context,
  Color gradientFrom,
  Color gradientTo,
  double firstPadding,
  double secondPadding,
  ElevatedButton button,
  Widget child,
) {
  return Container(
    constraints: BoxConstraints.expand(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height),
    alignment: Alignment.center,
    decoration: BoxDecoration(
      border: Border.all(
        style: BorderStyle.solid,
      ),
      shape: BoxShape.rectangle,
      gradient: LinearGradient(
        colors: <Color>[gradientFrom, gradientTo],
        tileMode: TileMode.clamp,
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ),
    ),
    child: Column(
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
Text createText(String text, TextAlign alignment, FontWeight weight,
    double spacing, double size) {
  return Text(
    text,
    textAlign: alignment,
    style: TextStyle(
      fontFamily: 'Raleway',
      fontWeight: weight,
      fontSize: size,
    ),
  );
}

///Mostra il carrello come dialog.
///Hero permette la transizione da floating button a un altro widget.(guarda main per tag).
Hero showCart(BuildContext context, Color currentColor) {
  return Hero(
      tag: 'cartpopup',
      child: Dialog(
        backgroundColor: Colors.white70,
        child: Container(
            decoration: BoxDecoration(
              color: currentColor,
              shape: BoxShape.rectangle,
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(25),
            ),
            alignment: Alignment.center,
            //color: Colors.white10,
            width: MediaQuery.of(context).size.width / 3,
            height: MediaQuery.of(context).size.height / 3,
            child: Column(
              children: [
                createText(
                    'Carrello', TextAlign.center, FontWeight.w400, 1.2, 18),
              ],
            )),
      ));
}
