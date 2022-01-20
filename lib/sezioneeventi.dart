import 'package:flutter/material.dart';
import 'widgetsbuilder.dart';

Container createSezioneEventi(
    BuildContext context, PageController _pageController) {
  return createPageContainer(
      context,
      const Color(0xff640135), //gradient from
      const Color(0xff640135), //gradient to
      MediaQuery.of(context).size.height / 15, //first padding
      MediaQuery.of(context).size.height / 5, //second padding
      createButton(
        _pageController,
        const AssetImage("lib/assets/event_icon.png"),
        48,
        18,
        0,
        const Duration(milliseconds: 600),
      ),
      const SizedBox());
}
