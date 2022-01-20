import 'package:flutter/material.dart';
import 'widgetsbuilder.dart';

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
    const Color(0xff356968), //gradient from
    MediaQuery.of(context).size.height / 15, //first padding
    MediaQuery.of(context).size.height / 5, //second padding
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
                children: [
                  createCustomSelectContainer(
                    context,
                    const Icon(Icons.fastfood_outlined),
                    'Bar',
                    MediaQuery.of(context).size.width / 5,
                  ),
                  createCustomSelectContainer(
                    context,
                    const Icon(Icons.fastfood_outlined),
                    'Ristorante',
                    MediaQuery.of(context).size.width / 7,
                    //green_light),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
