import 'package:flutter/material.dart';
import 'widgets_builder.dart';

Container createSezioneEventi(
    BuildContext context, PageController _pageController) {
  return PageContainer(
      gradients: const <Color>[Color(0xff33a284), Color(0xff1a5643)],
      child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        Padding(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).size.height / 15)),
        CustomHomeButton(
          pageController: _pageController,
          child: const Image(
              image: AssetImage("lib/assets/event_icon.png"),
              width: 48,
              height: 48),
          innerPadding: EdgeInsets.all(18),
          page: 0,
          animationTime: Duration(milliseconds: 600),
        ),
        Padding(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).size.height / 5)),
        Container(
          decoration: BoxDecoration(
            color: Colors.transparent,
            border: Border.all(
              width: 2,
              color: Colors.white,
            ),
            borderRadius: BorderRadius.circular(5),
          ),
        ),
      ]));
}
