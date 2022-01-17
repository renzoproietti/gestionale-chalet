import 'package:flutter/material.dart';
import 'widgetsbuilder.dart';

Container createSezioneEventi(
    BuildContext context, PageController _pageController) {
  return createPageContainer(
      context,
      const Color(0xff161055),
      const Color(0xff161055), //gradient to
      MediaQuery.of(context).size.height / 15, //first padding
      MediaQuery.of(context).size.height / 5, //second padding
      createButton(
          _pageController,
          const AssetImage("lib/assets/party.png"),
          48,
          18,
          _pageController,
          0,
          const Duration(milliseconds: 600)), //fast-food button
      const SizedBox());
}
