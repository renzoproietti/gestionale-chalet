import 'package:flutter/material.dart';
import 'widgetsbuilder.dart';

Container createHomeScreen(
    BuildContext context, PageController _pageController) {
  return Container(
    constraints: BoxConstraints.expand(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height),
    alignment: Alignment.center,
    decoration: BoxDecoration(
      border: Border.all(
        color: const Color(0xff161055),
        style: BorderStyle.solid,
      ),
      gradient: const LinearGradient(
        colors: <Color>[Color(0xff161055), Color(0xff161055)],
        tileMode: TileMode.clamp,
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
    ),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            createButton(
              _pageController, //controller
              const AssetImage("lib/assets/umbrella.png"),
              64, //size
              24, //padding
              _pageController, //controller pagina
              1, //scrolla fino a questa pagina
              const Duration(milliseconds: 300), //durata della transizione
            ), //Bottone Sezione Ombrelloni
            Padding(
                padding:
                    EdgeInsets.all(MediaQuery.of(context).size.width) / 30),
            createButton(
              _pageController,
              const AssetImage("lib/assets/sunbed.png"),
              64,
              24,
              _pageController,
              2,
              const Duration(milliseconds: 400),
            ), //Bottone Sezione lettini
          ],
        ),
        Padding(
            padding: EdgeInsets.all(MediaQuery.of(context).size.height) / 50),
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            createButton(
              _pageController,
              const AssetImage("lib/assets/fast-food.png"),
              64,
              24,
              _pageController,
              3,
              const Duration(milliseconds: 500),
            ), //Bottone Sezione Cibo/Bevande
            Padding(
                padding:
                    EdgeInsets.all(MediaQuery.of(context).size.width) / 30),
            createButton(
              _pageController,
              const AssetImage("lib/assets/party.png"),
              64,
              24,
              _pageController,
              4,
              const Duration(milliseconds: 600),
            ), //Bottone Sezione Eventi
          ],
        ),
      ],
    ),
  );
}
