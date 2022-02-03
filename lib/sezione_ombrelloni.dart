import 'package:flutter/material.dart';
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
  OmbrelloniItem(header: "5", body: "Prenota", infos: "prima fila"),
  OmbrelloniItem(header: "6", body: "Prenota", infos: "seconda fila"),
  OmbrelloniItem(header: "7", body: "Prenota", infos: "seconda fila"),
  OmbrelloniItem(header: "8", body: "Prenota", infos: "terza fila"),
  OmbrelloniItem(header: "9", body: "Prenota", infos: "quarta fila"),
];

List<OmbrelloniItem> getOmbrelloni() {
  return _ombrelloni;
}

Container createSezioneOmbrelloni(
  BuildContext context,
  PageController _pageController,
  Function(int, bool) callback,
) {
  return createPageContainer(
    context,
    const Color(0xffe6ab10),
    createButton(
      _pageController,
      AssetImage("lib/assets/umbrella_icon.png"),
      48,
      18,
      0,
      Duration(milliseconds: 300),
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
          child: MediaQuery.removePadding(
            removeTop: true,
            context: context,
            child: ListView(
              shrinkWrap: false,
              children: <Widget>[
<<<<<<< Updated upstream
                custom_panel.ExpansionPanelList(
                  expandedHeaderPadding:
                      EdgeInsets.symmetric(vertical: 9, horizontal: 0),
                  expansionCallback: callback,
                  inBetweenPadding: 0.5,
                  children: _ombrelloni.map((ListItem? item) {
                    return CustomExpansionPanel(
                      backgroundColor: Colors.white,
=======
                ExpansionPanelList(
                  expandedHeaderPadding:
                      EdgeInsets.symmetric(vertical: 9, horizontal: 0),
                  expansionCallback: callback,
                  children: _ombrelloni.map((ListItem? item) {
                    return ExpansionPanel(
>>>>>>> Stashed changes
                      canTapOnHeader: true,
                      headerBuilder: (BuildContext context, bool isExpanded) {
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
                                      left: MediaQuery.of(context).size.width /
                                          9)),
                              item != null
                                  ? item.icon
                                  : Icon(Icons.beach_access_rounded),
                              Text(
                                item != null ? item.header : "-1",
                                textAlign: TextAlign.center,
                                style: const TextStyle(
<<<<<<< Updated upstream
                                    fontFamily: 'Raleway',
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1,
                                    fontSize: 16,
                                    color: Colors.black),
                              ),
                              Padding(
                                  padding: EdgeInsets.only(
                                      left: MediaQuery.of(context).size.width /
                                          21)),
                              createText(item != null ? item.infos : "n-fila",
                                  alignment: TextAlign.center,
                                  weight: FontWeight.normal,
                                  letterSpacing: 1,
                                  size: 16,
                                  color: Colors.black),
                            ],
                          ),
                        ));
                      },
                      isExpanded: item != null ? item.isExpanded : false,
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
                                          LocalizationDatePicker());
                                },
                                child: createText(
                                  item != null ? item.body : "Prenota",
                                  alignment: TextAlign.center,
                                  weight: FontWeight.w700,
                                  letterSpacing: 1,
                                  size: 20,
                                  color: Colors.blue,
                                ),
                              ),
=======
                                  fontFamily: 'Raleway',
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1,
                                  fontSize: 16,
                                ),
                              ),
                              Padding(
                                  padding: EdgeInsets.only(
                                      left: MediaQuery.of(context).size.width /
                                          21)),
                              createText(
                                item != null ? item.infos : "n-fila",
                                TextAlign.center,
                                FontWeight.normal,
                                1,
                                16,
                              ),
                            ],
                          ),
                        ));
                      },
                      isExpanded: item != null ? item.isExpanded : false,
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
                                          LocalizationDatePicker());
                                },
                                child: createText(
                                  item != null ? item.body : "Prenota",
                                  TextAlign.center,
                                  FontWeight.w700,
                                  1,
                                  20,
                                  Colors.blue,
                                ),
                              ),
>>>>>>> Stashed changes
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
    firstPadding: MediaQuery.of(context).size.height / 15,
    secondPadding: MediaQuery.of(context).size.height / 15,
    gradientFrom: Color(0xff461055),
    gradientTo: Color(0xff701c18), //const Color(0xfffd8d45),
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter, //const Color(0xffe6ab10),
  );
}
