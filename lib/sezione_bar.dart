import 'package:flutter/material.dart';
import 'widgets_builder.dart';

class Bevanda {
  Bevanda(
      {this.isExpanded = false,
      this.nome = '\t',
      this.prezzo = 0,
      this.id = 42});

  bool isExpanded;
  final String nome;
  final double prezzo;
  final double id;
}

Container createSezioneBar(
    BuildContext context, PageController _pageController) {
  return createPageContainer(
      context,
      const Color(0xff3eb489),
      createButton(_pageController, const AssetImage("lib/assets/bar_icon.png"),
          48, 18, 0, const Duration(milliseconds: 500)),
      FittedBox(
        fit: BoxFit.contain,
        child: Container(
          width: MediaQuery.of(context).size.width - 65,
          decoration: BoxDecoration(
            color: Colors.black,
            border: Border.all(
              width: 2,
              color: Colors.white,
            ),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Scrollbar(
            child: ListView(
              shrinkWrap: true,
              //scrollDirection: Axis.horizontal,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [],
                ),
              ],
            ),
          ),
        ),
      ),
      firstPadding: MediaQuery.of(context).size.height / 15,
      secondPadding: MediaQuery.of(context).size.height / 5,
      gradientFrom: Color(0xffffb643),
      gradientTo: Color(0xff33a284));
}
