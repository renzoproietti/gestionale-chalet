import 'package:flutter/material.dart';
import 'package:fluttertest/list_item_handler.dart';
import 'cart_handler.dart';
import 'custom_expansion_panel.dart';
import 'widgets_builder.dart';
import 'custom_expansion_panel.dart' as custom_panel;
import 'main.dart';

Container createSezioneBar(BuildContext context, PageController _pageController,
    Function(int, bool) callback) {
  MultipleCounter counter = MultipleCounter(category: "Bar");
  globalCounters.putIfAbsent(2, () => counter);
  return PageContainer(
    gradients: const <Color>[Color(0xffffb643), Color(0xff33a284)],
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).size.height / 15)),
        CustomHomeButton(
          pageController: _pageController,
          child: const Image(
            image: AssetImage("lib/assets/bar_icon.png"),
            width: 48,
            height: 48,
          ),
          innerPadding: const EdgeInsets.all(18),
          page: 0,
          animationTime: const Duration(milliseconds: 500),
        ),
        Padding(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).size.height / 15)),
        Container(
          width: MediaQuery.of(context).size.width / 1.2,
          height: MediaQuery.of(context).size.height / 2,
          decoration: BoxDecoration(
            color: Colors.black,
            border: Border.all(
              width: 2,
              color: Colors.white,
            ),
            borderRadius: BorderRadius.circular(5),
          ),
          child: MediaQuery.removePadding(
            removeTop: true,
            context: context,
            child: Scrollbar(
              child: Center(
                child: ListView(
                  shrinkWrap: false,
                  children: <Widget>[
                    custom_panel.ExpansionPanelList(
                      inBetweenPadding: 0.2,
                      expandedHeaderPadding: const EdgeInsets.symmetric(
                          vertical: 4, horizontal: 0),
                      expansionCallback: callback,
                      children: getMenu().map((MenuItem? section) {
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
                                  createText(section!.header,
                                      alignment: TextAlign.left,
                                      weight: FontWeight.bold,
                                      letterSpacing: 1.2,
                                      size: 20,
                                      color: Colors.black),
                                ],
                              );
                            },
                            isExpanded: section!.isExpanded,
                            body: ListView(
                                shrinkWrap: true,
                                physics: const BouncingScrollPhysics(),
                                children: _pickItem(section.header)
                                    .map((MenuItem pietanza) {
                                  counter.addEntry(
                                      MapEntry(pietanza, pietanza.number));

                                  return listContainer(pietanza,
                                      counter.getCounterFromItem(pietanza), () {
                                    removeItem(pietanza, counter);
                                    Chalet.of(context)!.setState(() {});
                                  }, () {
                                    addItem(pietanza, counter);
                                    Chalet.of(context)!.setState(() {});
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

List<MenuItem> _pickItem(String item) {
  switch (item) {
    case 'Antipasti':
      return getAntipasti();
    case 'Primi':
      return getPrimi();
    case 'Secondi':
      return getSecondi();
    case 'Contorni':
      return getContorni();
    case 'Dolci':
      return getDolci();
    case 'Bevande':
      return getBevande();
    case 'Vini':
      return getVini();
    case 'Amari/Digestivi':
      return getAmari();
    default:
      return getPrimi();
  }
}
