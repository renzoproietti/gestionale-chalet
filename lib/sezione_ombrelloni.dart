import 'package:flutter/material.dart';
import 'package:fluttertest/cart_handler.dart';
import 'package:fluttertest/datepicker_dialog.dart';
import 'custom_expansion_panel.dart';
import 'widgets_builder.dart';
import 'package:fluttertest/list_item_handler.dart';
import 'package:fluttertest/custom_expansion_panel.dart' as custom_panel;

List<OmbrelloniItem> _ombrelloni = <OmbrelloniItem>[
  OmbrelloniItem(header: "1", body: "Prenota", infos: "prima fila"),
  OmbrelloniItem(header: "2", body: "Prenota", infos: "prima fila"),
  OmbrelloniItem(header: "3", body: "Prenota", infos: "prima fila"),
  OmbrelloniItem(header: "4", body: "Prenota", infos: "prima fila"),
  OmbrelloniItem(header: "5", body: "Prenota", infos: "seconda fila"),
  OmbrelloniItem(header: "6", body: "Prenota", infos: "seconda fila"),
  OmbrelloniItem(header: "7", body: "Prenota", infos: "seconda fila"),
  OmbrelloniItem(header: "8", body: "Prenota", infos: "terza fila"),
  OmbrelloniItem(header: "9", body: "Prenota", infos: "terza fila"),
  OmbrelloniItem(header: "10", body: "Prenota", infos: "terza fila"),
  OmbrelloniItem(header: "11", body: "Prenota", infos: "quarta fila"),
  OmbrelloniItem(header: "12", body: "Prenota", infos: "quarta fila"),
];

List<OmbrelloniItem> getOmbrelloni() {
  return _ombrelloni;
}

Container createSezioneOmbrelloni(
  BuildContext context,
  PageController _pageController,
  Function(int, bool) callback,
) {
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
          animationTime: Duration(milliseconds: 300),
          innerPadding: EdgeInsets.all(18),
        ),
        Padding(
          padding:
              EdgeInsets.only(top: MediaQuery.of(context).size.height / 15),
        ),
        Container(
          width: MediaQuery.of(context).size.width / 1.2,
          height: MediaQuery.of(context).size.height / 2,
          decoration: BoxDecoration(
            color: Colors.transparent,
            border: Border.all(
              width: 2,
              color: Colors.white,
            ),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Scrollbar(
            child: Center(
              //necessario rimuovere il padding quando
              //l'appBar è transparente o rimossa.
              child: MediaQuery.removePadding(
                removeTop: true,
                context: context,
                child: ListView(
                  shrinkWrap: false,
                  children: <Widget>[
                    custom_panel.ExpansionPanelList(
                      expandedHeaderPadding:
                          EdgeInsets.symmetric(vertical: 9, horizontal: 0),
                      expansionCallback: callback,
                      inBetweenPadding: 0.2,
                      children: _ombrelloni.map((ListItem? item) {
                        return CustomExpansionPanel(
                          backgroundColor: Colors.white,
                          canTapOnHeader: true,
                          headerBuilder:
                              (BuildContext context, bool isExpanded) {
                            return (Container(
                              padding: EdgeInsets.only(
                                  left: MediaQuery.of(context).size.width / 25),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  green_light,
                                  Padding(
                                      padding: EdgeInsets.only(
                                          left: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              9)),
                                  item != null
                                      ? item.icon
                                      : Icon(Icons.beach_access_rounded),
                                  Text(
                                    item != null ? item.header : "-1",
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                        fontFamily: 'Raleway',
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 1,
                                        fontSize: 16,
                                        color: Colors.black),
                                  ),
                                  Padding(
                                      padding: EdgeInsets.only(
                                          left: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              21)),
                                  createText(
                                      item != null ? item.infos : "n-fila",
                                      alignment: TextAlign.center,
                                      weight: FontWeight.normal,
                                      letterSpacing: 1,
                                      size: 16,
                                      color: Colors.black),
                                ],
                              ),
                            ));
                          },
                          isExpanded: item!.isExpanded,
                          body: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Flexible(
                                  child: TextButton(
                                    onPressed: () {
                                      showDialog(
                                              context: context,
                                              builder: (context) =>
                                                  CustomDatePicker())
                                          .then((value) => {});
                                    },
                                    child: createText(
                                      item.body,
                                      alignment: TextAlign.center,
                                      weight: FontWeight.w700,
                                      letterSpacing: 1,
                                      size: 20,
                                      color: Colors.blue,
                                    ),
                                  ),
                                ),
                              ]),
                        );
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
