import 'package:flutter/material.dart';

ElevatedButton createButton(
    PageController _pageController,
    AssetImage buttonIcon,
    double size,
    double innerPadding,
    PageController pageController,
    int page,
    Duration animationTime) {
  return ElevatedButton(
    onPressed: () {
      if (_pageController.hasClients) {
        _pageController.animateToPage(page,
            duration: animationTime, curve: Curves.easeInOutCirc);
      }
    },
    child: Image(
      image: buttonIcon,
      width: size,
      height: size,
    ),
    style: ElevatedButton.styleFrom(
      shape: const CircleBorder(
        side: BorderSide(
            style: BorderStyle.solid, color: Colors.white, width: 2.0),
      ),
      padding: EdgeInsets.all(innerPadding),
      elevation: 4.0,
    ),
  );
}

//metodo per la creazione dei container a pagina 2 (Sezione lettini).
AnimatedContainer createCustomSelectContainer(
    BuildContext context, Icon icon, String text, double arrowPadding) {
  return AnimatedContainer(
    duration: const Duration(milliseconds: 0),
    curve: Curves.easeInOut,
    color: Colors.white,
    padding: EdgeInsets.symmetric(
        vertical: 20, horizontal: MediaQuery.of(context).size.width / 25),
    child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
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

//crea container che occupa tutta la pagina visibile nel contesto
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
      gradient: LinearGradient(
        colors: <Color>[gradientFrom, gradientTo],
        tileMode: TileMode.clamp,
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
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
