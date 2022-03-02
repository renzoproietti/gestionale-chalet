import 'package:flutter/material.dart';
import 'package:fluttertest/main.dart';
import 'custom_expansion_panel.dart';
import 'widgets_builder.dart';
import 'package:fluttertest/list_item_handler.dart';
import 'package:fluttertest/custom_expansion_panel.dart' as custom_panel;

List<OmbrelloniItem> _file = <OmbrelloniItem>[
  OmbrelloniItem(header: "Prima fila", isExpanded: false),
  OmbrelloniItem(header: "Seconda fila", isExpanded: false),
  OmbrelloniItem(header: "Terza fila", isExpanded: false),
  OmbrelloniItem(header: "Quarta fila", isExpanded: false),
];
const int ombrelloniPerFila = 10;

List<OmbrelloniItem> initFila(OmbrelloniItem fila) {
  List<OmbrelloniItem> _ombrelloni = <OmbrelloniItem>[];
  for (int i = 1; i < ombrelloniPerFila; i++) {
    _ombrelloni.add(OmbrelloniItem(
        header: '$i', prezzo: fila.prezzo, body: "Prenota", isExpanded: false));
  }

  return _ombrelloni;
}

List<OmbrelloniItem> getFile() {
  return _file;
}

Container createSezioneOmbrelloni(
  BuildContext context,
  PageController _pageController,
  Function(int, bool) callback,
) {
  MultipleCounter counter = MultipleCounter(category: "Ombrelloni");
  globalCounters.putIfAbsent(0, () => counter);

  return PageContainer(
    gradients: const <Color>[
      Color(0xff461055),
      Color(0xff701c18),
    ],
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding:
              EdgeInsets.only(top: MediaQuery.of(context).size.height / 15),
        ),
        CustomHomeButton(
          child: const Image(
              image: AssetImage("lib/assets/umbrella_icon.png"),
              width: 48,
              height: 48),
          pageController: _pageController,
          page: 0,
          animationTime: const Duration(milliseconds: 300),
          innerPadding: const EdgeInsets.all(18),
        ),
        Padding(
          padding:
              EdgeInsets.only(top: MediaQuery.of(context).size.height / 11),
        ),
        Container(
          width: MediaQuery.of(context).size.width / 1.2,
          height: MediaQuery.of(context).size.height / 3.39,

          decoration: BoxDecoration(
            color: Colors.transparent,
            border: Border.all(
              width: 2,
              color: Colors.white,
            ),
            borderRadius: BorderRadius.circular(5),
          ),
          //necessario rimuovere il padding quando
          //l'appBar è transparente o rimossa.
          child: MediaQuery.removePadding(
            removeTop: true,
            context: context,
            child: Scrollbar(
              isAlwaysShown: true,
              interactive: true,
              child: Center(
                child: ListView(
                  shrinkWrap: false,
                  children: <Widget>[
                    custom_panel.ExpansionPanelList(
                      inBetweenPadding: 0.2,
                      expandedHeaderPadding: const EdgeInsets.symmetric(
                          vertical: 4, horizontal: 0),
                      expansionCallback: callback,
                      children: getFile().map((OmbrelloniItem fila) {
                        initFila(fila);
                        return CustomExpansionPanel(
                            canTapOnHeader: true,
                            headerBuilder:
                                (BuildContext context, bool isExpanded) {
                              return Row(
                                children: <Widget>[
                                  Padding(
                                      padding: EdgeInsets.only(
                                          left: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              20)),
                                  createText(fila.header,
                                      alignment: TextAlign.left,
                                      weight: FontWeight.bold,
                                      letterSpacing: 1.2,
                                      size: 20,
                                      color: Colors.black),
                                ],
                              );
                            },
                            isExpanded: fila.isExpanded,
                            body: ListView(
                                physics: BouncingScrollPhysics(),
                                shrinkWrap: true,
                                children:
                                    initFila(fila).map((ListItem ombrellone) {
                                  counter.addEntry(
                                      MapEntry(ombrellone, ombrellone.number));

                                  return listContainer(ombrellone,
                                      counter.getCounterFromItem(ombrellone),
                                      () {
                                    removeItem(ombrellone, counter,
                                        Chalet.of(context) as State);
                                  }, () {
                                    addItem(ombrellone, counter,
                                        Chalet.of(context) as State);
                                  }, context);
                                }).toList()));
                      }).toList(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
