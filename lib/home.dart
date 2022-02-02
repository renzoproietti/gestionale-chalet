import 'package:flutter/material.dart';
import 'widgets_builder.dart';

Container createHomeScreen(
    BuildContext context, PageController _pageController) {
  return Container(
    alignment: Alignment.center,
    decoration: const BoxDecoration(
      gradient: LinearGradient(
        colors: [Color(0xff161055), Color(0xff461055)],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ),
    ),
    child: MediaQuery.removePadding(
      context: context,
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
                const AssetImage("lib/assets/umbrella_icon.png"),
                64, //size
                24,
//padding
                1, //scrolla fino a questa pagina
                const Duration(milliseconds: 300), //durata della transizione
              ), //Bottone Sezione Ombrelloni
              Padding(
                  padding:
                      EdgeInsets.all(MediaQuery.of(context).size.width) / 30),
              createButton(
                _pageController,
                const AssetImage("lib/assets/sunbed_icon.png"),
                64,
                24,
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
                const AssetImage("lib/assets/bar_icon.png"),
                64,
                24,
                3,
                const Duration(milliseconds: 500),
              ), //Bottone Sezione Cibo/Bevande
              Padding(
                  padding:
                      EdgeInsets.all(MediaQuery.of(context).size.width) / 30),
              createButton(
                _pageController,
                const AssetImage("lib/assets/event_icon.png"),
                64,
                24,
                4,
                const Duration(milliseconds: 600),
              ), //Bottone Sezione Eventi
            ],
          ),
        ],
      ),
    ),
  );
}
