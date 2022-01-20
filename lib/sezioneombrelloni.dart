import 'package:flutter/material.dart';
import 'widgetsbuilder.dart';

class OmbrelloneItem {
  OmbrelloneItem(
      {this.isExpanded = false,
      this.header = 'h',
      this.body = 'b',
      this.fila = 'f'});

  bool isExpanded;
  final String header;
  final String fila;
  final String body;
}

List<OmbrelloneItem> _ombrelloni = <OmbrelloneItem>[
  OmbrelloneItem(header: "1", body: "Body", fila: "prima fila"),
  OmbrelloneItem(header: "2", body: "Body2", fila: "prima fila"),
  OmbrelloneItem(header: "3", body: "Body3", fila: "prima fila"),
  OmbrelloneItem(header: "4", body: "Body", fila: "prima fila"),
  OmbrelloneItem(header: "5", body: "Body2", fila: "prima fila"),
  OmbrelloneItem(header: "6", body: "Body3", fila: "seconda fila"),
  OmbrelloneItem(header: "7", body: "Body", fila: "seconda fila"),
  OmbrelloneItem(header: "8", body: "Body2", fila: "terza fila"),
  OmbrelloneItem(header: "9", body: "Body3", fila: "quarta fila"),
];

List<OmbrelloneItem> getOmbrelloni() {
  return _ombrelloni;
}

Container createSezioneOmbrelloni(BuildContext context,
    PageController _pageController, Function(int, bool)? callback) {
  return createPageContainer(
    context,
    const Color(0xffffb643),
    const Color(0xffffb643),
    MediaQuery.of(context).size.height / 15,
    MediaQuery.of(context).size.height / 15,
    createButton(
      _pageController,
      const AssetImage("lib/assets/umbrella_icon.png"),
      48,
      18,
      0,
      const Duration(milliseconds: 300),
    ),
    SizedBox(
      child: Container(
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
          child: ListView(
            shrinkWrap: true,
            children: <Widget>[
              ExpansionPanelList(
                expansionCallback: callback,
                /*(int index, bool isExpanded) {
                              setState(() {
                                _ombrelloni[index].isExpanded =
                                    !_ombrelloni[index].isExpanded;
                              });
                            },*/
                children: _ombrelloni.map((OmbrelloneItem item) {
                  return ExpansionPanel(
                      canTapOnHeader: true,
                      headerBuilder: (BuildContext context, bool isExpanded) {
                        return (Container(
                            padding: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width / 25),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Image(
                                  image:
                                      AssetImage("lib/assets/green_circle.png"),
                                  width: 24,
                                  height: 24,
                                ),
                                Padding(
                                    padding: EdgeInsets.only(
                                        left:
                                            MediaQuery.of(context).size.width /
                                                9)),
                                const Icon(Icons.beach_access),
                                Text(
                                  item.header,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontFamily: 'Raleway',
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1,
                                    fontSize: 18,
                                  ),
                                ),
                                Padding(
                                    padding: EdgeInsets.only(
                                        left:
                                            MediaQuery.of(context).size.width /
                                                11)),
                                createText(
                                  item.fila,
                                  TextAlign.center,
                                  FontWeight.normal,
                                  1,
                                  14,
                                ),
                              ],
                            )));
                      },
                      isExpanded: item.isExpanded,
                      body: FittedBox(
                          child: TextButton(
                              onPressed: () {},
                              child: createText(
                                "Prenota",
                                TextAlign.center,
                                FontWeight.w700,
                                1,
                                16,
                              ))));
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
