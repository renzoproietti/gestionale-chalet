import 'package:flutter/material.dart';
import 'widgetsbuilder.dart';

Container createSezioneBar(
    BuildContext context, PageController _pageController) {
  return createPageContainer(
      context,
      const Color(0xffffb643), //gradient from
      const Color(0xffe6ab10), //gradient to
      MediaQuery.of(context).size.height / 15, //first padding
      MediaQuery.of(context).size.height / 5, //second padding
      createButton(
          _pageController,
          const AssetImage("lib/assets/fast-food.png"),
          48,
          18,
          _pageController,
          0,
          const Duration(milliseconds: 500)), //fast-food button
      const SizedBox());
}
