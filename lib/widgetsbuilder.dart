import 'package:flutter/material.dart';
import 'package:fluttertest/listitemhandler.dart';

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

///metodo per la creazione dei container a pagina 2 (Sezione lettini).
AnimatedContainer createCustomSelectContainer(
    BuildContext context, Icon icon, String text, double arrowPadding,
    [double firstPadding = 0,
    double secondPadding = 0,
    Image image = empty_image]) {
  return AnimatedContainer(
    duration: const Duration(milliseconds: 0),
    curve: Curves.easeInOut,
    color: Colors.white,
    padding: EdgeInsets.symmetric(
        vertical: 20, horizontal: MediaQuery.of(context).size.width / 25),
    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      image,
      Padding(padding: EdgeInsets.only(left: firstPadding)),
      icon,
      Padding(padding: EdgeInsets.only(left: secondPadding)),
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
  Color background,
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
      color: background,
      border: Border.all(
        style: BorderStyle.solid,
      ),
      shape: BoxShape.rectangle,
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
    [TextAlign alignment = TextAlign.center,
    FontWeight weight = FontWeight.normal,
    double letterSpacing = 1.0,
    double size = 24,
    Color color = Colors.white]) {
  return Text(
    text,
    textAlign: alignment,
    style: TextStyle(
        fontFamily: 'Raleway',
        fontWeight: weight,
        fontSize: size,
        color: color != Colors.white ? color : Colors.black),
  );
}

///Mostra il carrello come dialog.
///Hero permette la transizione da floating button a un altro widget.(guarda main per tag).
Hero showCart(BuildContext context, Color currentColor) {
  return Hero(
      tag: 'cartpopup',
      child: Dialog(
        insetAnimationCurve: Curves.easeOut,
        insetAnimationDuration: Duration(milliseconds: 300),
        backgroundColor: Colors.white70,
        child: Container(
            decoration: BoxDecoration(
              color: currentColor,
              shape: BoxShape.rectangle,
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(15),
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
