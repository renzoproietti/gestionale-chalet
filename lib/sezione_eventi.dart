import 'package:flutter/material.dart';
import 'widgets_builder.dart';

Container createSezioneEventi(
    BuildContext context, PageController _pageController) {
  return createPageContainer(
      context,
      const Color(0xff640135),
      createButton(
        _pageController,
        const AssetImage("lib/assets/event_icon.png"),
        48,
        18,
        0,
        const Duration(milliseconds: 600),
      ),
      const SizedBox(),
      firstPadding: MediaQuery.of(context).size.height / 15,
      secondPadding: MediaQuery.of(context).size.height / 5,
      gradientFrom: Color(0xff33a284),
      gradientTo: Color(0xff1a5643));
}
