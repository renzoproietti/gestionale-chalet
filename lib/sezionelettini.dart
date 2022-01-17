import 'package:flutter/material.dart';
import 'widgetsbuilder.dart';

Container createSezioneLettini(
    BuildContext context, PageController _pageController) {
  return createPageContainer(
    context,
    const Color(0xff161055),
    const Color(0xff161055),
    MediaQuery.of(context).size.height / 15,
    MediaQuery.of(context).size.height / 5,
    createButton(
      _pageController,
      const AssetImage("lib/assets/sunbed.png"),
      48,
      18,
      _pageController,
      0,
      const Duration(milliseconds: 400),
    ),
    SizedBox(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black,
          border: Border.all(
            width: 2,
            color: Colors.white,
          ),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              createCustomSelectContainer(
                context,
                const Icon(Icons.bed_rounded),
                'Lettini',
                MediaQuery.of(context).size.width / 5,
              ),
              createCustomSelectContainer(
                context,
                const Icon(Icons.single_bed_rounded),
                'Sdraio',
                MediaQuery.of(context).size.width / 5,
              ),
              createCustomSelectContainer(
                context,
                const Icon(Icons.chair_rounded),
                'Sedie',
                MediaQuery.of(context).size.width / 5,
              ),
            ]),
        width: MediaQuery.of(context).size.width - 65,
      ),
    ),
  );
}
