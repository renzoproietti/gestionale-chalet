import 'package:flutter/material.dart';
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
  return customScrollableListView(
    context,
    _pageController,
    callback,
    const AssetImage("lib/assets/umbrella_icon.png"),
    const Duration(milliseconds: 300),
    _ombrelloni,
    width: MediaQuery.of(context).size.width - 65,
    height: MediaQuery.of(context).size.height / 1.85,
    circle: green_light,
    background: const Color(0xffffb643),
    itemIcon: const Icon(Icons.beach_access_outlined),
  );
}
