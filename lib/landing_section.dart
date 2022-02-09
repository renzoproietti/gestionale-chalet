import 'package:flutter/material.dart';
import 'widgets_builder.dart';

Container createHomeScreen(
    BuildContext context, PageController _pageController) {
  return PageContainer(
    gradients: [Color(0xff161055), Color(0xff461055)],
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
              CustomHomeButton(
                buttonIcon: AssetImage("lib/assets/umbrella_icon.png"),
                pageController: _pageController,
                size: 64,
                page: 1,
                animationTime: Duration(milliseconds: 300),
                innerPadding: EdgeInsets.all(28),
              ),
              /*createButton(
                _pageController, //controller
                const AssetImage("lib/assets/umbrella_icon.png"),
                64, //size
                24, //padding
                1, //scrolla fino a questa pagina
                const Duration(milliseconds: 300), //durata della transizione
              ),*/
              Padding(
                  padding:
                      EdgeInsets.all(MediaQuery.of(context).size.width) / 30),
              CustomHomeButton(
                buttonIcon: AssetImage("lib/assets/sunbed_icon.png"),
                pageController: _pageController,
                size: 64,
                page: 2,
                animationTime: Duration(milliseconds: 400),
                innerPadding: EdgeInsets.all(28),
              ), //Bottone Sezione lettini
            ],
          ),
          Padding(
              padding: EdgeInsets.all(MediaQuery.of(context).size.height) / 50),
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomHomeButton(
                buttonIcon: AssetImage("lib/assets/bar_icon.png"),
                pageController: _pageController,
                size: 64,
                page: 3,
                animationTime: Duration(milliseconds: 500),
                innerPadding: EdgeInsets.all(28),
              ), //Bottone Sezione Cibo/Bevande
              Padding(
                  padding:
                      EdgeInsets.all(MediaQuery.of(context).size.width) / 30),
              CustomHomeButton(
                buttonIcon: AssetImage("lib/assets/event_icon.png"),
                pageController: _pageController,
                size: 64,
                page: 4,
                animationTime: Duration(milliseconds: 600),
                innerPadding: EdgeInsets.all(28),
              ), //Bottone Sezione Eventi
            ],
          ),
        ],
      ),
    ),
  );
}
