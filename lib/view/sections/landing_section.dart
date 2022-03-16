import 'package:flutter/material.dart';
import '../core/widgets_builder.dart';

Container createHomeScreen(
    BuildContext context, PageController _pageController) {
  return PageContainer(
    gradients: const <Color>[Color(0xff161055), Color(0xff461055)],
    child: MediaQuery.removePadding(
      removeTop: true,
      removeBottom: true,
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
                    image: AssetImage("lib/assets/images/umbrella_icon.png"),
                    width: 64,
                    height: 64),
                pageController: _pageController,
                page: 1,
                animationTime: const Duration(milliseconds: 300),
                innerPadding: const EdgeInsets.all(28),
              ),
              Padding(
                  padding:
                      EdgeInsets.all(MediaQuery.of(context).size.width) / 30),
              CustomHomeButton(
                child: const Image(
                    image: AssetImage("lib/assets/images/sunbed_icon.png"),
                    width: 64,
                    height: 64),
                pageController: _pageController,
                page: 2,
                animationTime: const Duration(milliseconds: 400),
                innerPadding: const EdgeInsets.all(28),
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
                  image: AssetImage("lib/assets/images/bar_icon.png"),
                  width: 64,
                  height: 64,
                ),
                pageController: _pageController,
                page: 3,
                animationTime: const Duration(milliseconds: 500),
                innerPadding: const EdgeInsets.all(28),
              ), //Bottone Sezione Cibo/Bevande
              Padding(
                  padding:
                      EdgeInsets.all(MediaQuery.of(context).size.width) / 30),
              CustomHomeButton(
                child: const Image(
                    image: AssetImage("lib/assets/images/event_icon.png"),
                    width: 64,
                    height: 64),
                pageController: _pageController,
                page: 4,
                animationTime: const Duration(milliseconds: 600),
                innerPadding: const EdgeInsets.all(28),
              ), //Bottone Sezione Eventi
            ],
          ),
          Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).size.height / 15),
          )
        ],
      ),
    ),
  );
}
