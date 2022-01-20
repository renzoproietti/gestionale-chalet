import 'package:flutter/material.dart';
import 'widgetsbuilder.dart';

class OmbrelloneItem extends ListItem {
  OmbrelloneItem({isExpanded, header, body, infos})
      : super(isExpanded: false, header: header, body: body, infos: infos);
}

List<OmbrelloneItem> _ombrelloni = <OmbrelloneItem>[
  OmbrelloneItem(header: "1", body: "Body", infos: "prima fila"),
  OmbrelloneItem(header: "2", body: "Body2", infos: "prima fila"),
  OmbrelloneItem(header: "3", body: "Body3", infos: "prima fila"),
  OmbrelloneItem(header: "4", body: "Body", infos: "prima fila"),
  OmbrelloneItem(header: "5", body: "Body2", infos: "prima fila"),
  OmbrelloneItem(header: "6", body: "Body3", infos: "seconda fila"),
  OmbrelloneItem(header: "7", body: "Body", infos: "seconda fila"),
  OmbrelloneItem(header: "8", body: "Body2", infos: "terza fila"),
  OmbrelloneItem(header: "9", body: "Body3", infos: "quarta fila"),
];

List<OmbrelloneItem> getOmbrelloni() {
  return _ombrelloni;
}

Container createSezioneOmbrelloni(
  BuildContext context,
  PageController _pageController,
  Function(int, bool) callback,
) {
  return customScrollableListView(
    context,
    _pageController,
    callback,
    AssetImage("lib/assets/umbrella_icon.png"),
    Duration(milliseconds: 300),
    _ombrelloni,
    width: MediaQuery.of(context).size.width - 65,
    height: MediaQuery.of(context).size.height / 1.85,
    circle: green_light,
    background: Color(0xffffb643),
  );
}
