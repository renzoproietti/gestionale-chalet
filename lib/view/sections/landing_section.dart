import 'package:flutter/material.dart';
import '../core/widgets_builder.dart';

Container createHomeScreen(
    BuildContext context, PageController _pageController) {
  return PageContainer(
    gradients: const <Color>[Color(0xff161055), Color(0xff461055)],
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
                child: const Image(
                    image: AssetImage("lib/assets/umbrella_icon.png"),
                    width: 64,
                    height: 64),
                pageController: _pageController,
                page: 1,
                animationTime: Duration(milliseconds: 300),
                innerPadding: EdgeInsets.all(28),
              ),
              Padding(
                  padding:
                      EdgeInsets.all(MediaQuery.of(context).size.width) / 30),
              CustomHomeButton(
                child: const Image(
                    image: AssetImage("lib/assets/sunbed_icon.png"),
                    width: 64,
                    height: 64),
                pageController: _pageController,
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
                child: const Image(
                  image: AssetImage("lib/assets/bar_icon.png"),
                  width: 64,
                  height: 64,
                ),
                pageController: _pageController,
                page: 3,
                animationTime: Duration(milliseconds: 500),
                innerPadding: EdgeInsets.all(28),
              ), //Bottone Sezione Cibo/Bevande
              Padding(
                  padding:
                      EdgeInsets.all(MediaQuery.of(context).size.width) / 30),
              CustomHomeButton(
                child: const Image(
                    image: AssetImage("lib/assets/event_icon.png"),
                    width: 64,
                    height: 64),
                pageController: _pageController,
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
