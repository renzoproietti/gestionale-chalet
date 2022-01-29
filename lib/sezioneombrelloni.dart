import 'package:flutter/material.dart';
import 'package:fluttertest/datepickerdialog.dart';
import 'widgetsbuilder.dart';
import 'package:fluttertest/listitemhandler.dart';

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
    MediaQuery.of(context).size.height / 15,
    MediaQuery.of(context).size.height / 15,
    createButton(
      _pageController,
      AssetImage("lib/assets/umbrella_icon.png"),
      48,
      18,
      0,
      Duration(milliseconds: 300),
    ),
    Container(
      decoration: BoxDecoration(
        color: const Color(0xffe6ab10),
        border: Border.all(
          width: 2,
          color: Colors.white,
        ),
        borderRadius: BorderRadius.circular(5),
      ),
      width: MediaQuery.of(context).size.width - 65,
      height: MediaQuery.of(context).size.height / 1.85,
      child: Scrollbar(
        child: Center(
          child: ListView(
            shrinkWrap: false,
            children: <Widget>[
              ExpansionPanelList(
                expandedHeaderPadding:
                    EdgeInsets.symmetric(vertical: 9, horizontal: 0),
                expansionCallback: callback,
                children: _ombrelloni.map((ListItem? item) {
                  return ExpansionPanel(
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
                                    left:
                                        MediaQuery.of(context).size.width / 9)),
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
  );
}
