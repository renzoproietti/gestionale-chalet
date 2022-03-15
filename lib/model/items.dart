import 'package:Chalet/view/core/widgets_builder.dart';
import 'package:flutter/material.dart';

class ListItem {
  String header;
  double? prezzo;
  String? body;
  String? infos;
  String? category;
  bool? isExpanded;
  int number;

  ListItem({
    required this.header,
    this.prezzo,
    this.body,
    this.isExpanded,
    this.infos,
    this.category,
    this.number = 0,
  });
}

class OmbrelloniItem extends ListItem {
  Image? busyIcon;

  OmbrelloniItem(
      {isExpanded,
      header,
      body,
      infos,
      prezzo,
      category = 'Ombrelloni',
      number = 0,
      this.busyIcon})
      : super(
            isExpanded: isExpanded,
            header: header,
            body: body,
            infos: infos,
            category: category,
            prezzo: prezzo,
            number: number);
}

List<OmbrelloniItem> _file = <OmbrelloniItem>[
  OmbrelloniItem(
      header: "Prima fila",
      isExpanded: false,
      busyIcon: greenLight,
      prezzo: 15.00),
  OmbrelloniItem(
      header: "Seconda fila",
      isExpanded: false,
      busyIcon: redLight,
      prezzo: 13.00),
  OmbrelloniItem(
      header: "Terza fila",
      isExpanded: false,
      busyIcon: greenLight,
      prezzo: 11.00),
  OmbrelloniItem(
      header: "Quarta fila",
      isExpanded: false,
      busyIcon: greenLight,
      prezzo: 9.00),
  OmbrelloniItem(
      header: "Quinta fila",
      isExpanded: false,
      busyIcon: redLight,
      prezzo: 7.00),
  OmbrelloniItem(
      header: "Sesta fila",
      isExpanded: false,
      busyIcon: greenLight,
      prezzo: 5.00),
  OmbrelloniItem(
      header: "Settima fila",
      isExpanded: false,
      busyIcon: greenLight,
      prezzo: 4.00),
];
const int ombrelloniPerFila = 10;

List<OmbrelloniItem> initFila(OmbrelloniItem fila) {
  List<OmbrelloniItem> _ombrelloni = <OmbrelloniItem>[];
  for (int i = 1; i < ombrelloniPerFila; i++) {
    _ombrelloni.add(OmbrelloniItem(
        header: '$i',
        prezzo: fila.prezzo,
        body: "Prenota",
        isExpanded: false,
        number: 0));
  }

  return _ombrelloni;
}

List<OmbrelloniItem> getFile() {
  return _file;
}

class LettiniItem extends ListItem {
  LettiniItem({
    header,
    isExpanded,
    body,
    infos,
    category = 'Lettini',
    prezzo,
    number,
  }) : super(
          header: header,
          isExpanded: isExpanded,
          body: body,
          infos: infos,
          category: category,
          prezzo: prezzo,
          number: number,
        );
}

List<LettiniItem> _lettini = <LettiniItem>[
  LettiniItem(
      header: "Lettini",
      body: 'Aggiungi',
      infos: '\t',
      number: 0,
      prezzo: 6.0,
      isExpanded: false),
  LettiniItem(
      header: "Sdraio",
      body: 'Aggiungi',
      infos: '\t',
      number: 0,
      prezzo: 5.0,
      isExpanded: false),
  LettiniItem(
      header: "Sedie",
      body: 'Aggiungi',
      infos: '\t',
      number: 0,
      prezzo: 4.0,
      isExpanded: false),
];

List<LettiniItem> getLettini() {
  return _lettini;
}

class MenuItem extends ListItem {
  MenuItem({header, isExpanded, prezzo, category = 'Ristorante'})
      : super(
          header: header,
          isExpanded: isExpanded,
          prezzo: prezzo,
          category: category,
        );
}

final List<MenuItem> _menu = <MenuItem>[
  MenuItem(header: 'Antipasti', isExpanded: false),
  MenuItem(header: 'Primi', isExpanded: false),
  MenuItem(header: 'Secondi', isExpanded: false),
  MenuItem(header: 'Contorni', isExpanded: false),
  MenuItem(header: 'Dolci', isExpanded: false),
  MenuItem(header: 'Bevande', isExpanded: false),
  MenuItem(header: 'Vini', isExpanded: false),
  MenuItem(header: 'Digestivi/Amari', isExpanded: false)
];
final List<MenuItem> _antipasti = <MenuItem>[
  MenuItem(header: 'Melone', prezzo: 5.0, isExpanded: false),
  MenuItem(header: 'Salmone', prezzo: 7.0, isExpanded: false),
  MenuItem(header: 'Patatine', prezzo: 2.0, isExpanded: false),
  MenuItem(header: 'Olive', prezzo: 5.0, isExpanded: false),
];
final List<MenuItem> _primi = <MenuItem>[
  MenuItem(header: 'Spaghetti', prezzo: 11.0, isExpanded: false),
  MenuItem(header: 'Strozzapreti', prezzo: 9.0, isExpanded: false),
  MenuItem(header: 'Lasagne', prezzo: 10.0, isExpanded: false),
  MenuItem(header: 'Gnocchi', prezzo: 8.0, isExpanded: false),
];
final List<MenuItem> _secondi = <MenuItem>[
  MenuItem(header: 'Grigliata mista', prezzo: 15.0, isExpanded: false),
  MenuItem(header: 'Fritto Misto', prezzo: 13.0, isExpanded: false),
  MenuItem(header: 'Fritto gamberi/calamari', prezzo: 11.0, isExpanded: false),
];
final List<MenuItem> _contorni = <MenuItem>[
  MenuItem(header: 'Patatine', prezzo: 5.0, isExpanded: false),
  MenuItem(header: 'Olive Ascolane', prezzo: 5.0, isExpanded: false),
  MenuItem(header: 'Crocchette', prezzo: 5.0, isExpanded: false),
  MenuItem(header: 'Cozze', prezzo: 7.0, isExpanded: false),
  MenuItem(header: 'Insalata', prezzo: 6.0, isExpanded: false),
];
final List<MenuItem> _dolci = <MenuItem>[
  MenuItem(header: 'Tiramisù', prezzo: 4.0, isExpanded: false),
  MenuItem(header: 'Panna cotta', prezzo: 4.0, isExpanded: false),
  MenuItem(header: 'Sorbetto', prezzo: 3.0, isExpanded: false),
  MenuItem(header: 'Gelato', prezzo: 2.50, isExpanded: false),
];
final List<MenuItem> _bevande = <MenuItem>[
  MenuItem(header: 'Acqua naturale', prezzo: 1.0, isExpanded: false),
  MenuItem(header: 'Acqua frizzante', prezzo: 1.0, isExpanded: false),
  MenuItem(header: 'Coca-Cola', prezzo: 2.50, isExpanded: false),
  MenuItem(header: 'Fanta', prezzo: 2.50, isExpanded: false),
  MenuItem(header: 'Sprite', prezzo: 2.50, isExpanded: false),
  MenuItem(header: 'Birra', prezzo: 3.50, isExpanded: false),
];
final List<MenuItem> _vini = <MenuItem>[
  MenuItem(header: 'Rosso', prezzo: 4.0, isExpanded: false),
  MenuItem(header: 'Bianco', prezzo: 4.0, isExpanded: false),
];
final List<MenuItem> _amari = <MenuItem>[
  MenuItem(header: 'Rosso', prezzo: 4.0, isExpanded: false),
  MenuItem(header: 'Bianco', prezzo: 4.0, isExpanded: false),
];

List<MenuItem> getMenu() {
  return _menu;
}

List<MenuItem> getAntipasti() {
  return _antipasti;
}

List<MenuItem> getPrimi() {
  return _primi;
}

List<MenuItem> getSecondi() {
  return _secondi;
}

List<MenuItem> getContorni() {
  return _contorni;
}

List<MenuItem> getDolci() {
  return _dolci;
}

List<MenuItem> getBevande() {
  return _bevande;
}

List<MenuItem> getVini() {
  return _vini;
}

List<MenuItem> getAmari() {
  return _amari;
}

class EventiItem extends ListItem {
  EventiItem({
    required this.eventSpawnRange,
    required this.maxPartecipanti,
    header,
  }) : super(
          header: header,
          prezzo: 0.0,
        );

  final DateTimeRange eventSpawnRange;
  int maxPartecipanti;
}

final List<EventiItem> _eventi = [
  EventiItem(
      header: 'Torneo di beach volley maschile',
      maxPartecipanti: 32,
      eventSpawnRange: DateTimeRange(
          start: DateTime(2022, 06, 14), end: DateTime(2022, 06, 27))),
  EventiItem(
      header: 'Torneo di beach volley femminile',
      maxPartecipanti: 32,
      eventSpawnRange: DateTimeRange(
          start: DateTime(2022, 06, 14), end: DateTime(2022, 06, 27))),
  EventiItem(
      header: 'Torneo di beach volley misto',
      maxPartecipanti: 32,
      eventSpawnRange: DateTimeRange(
          start: DateTime(2022, 07, 06), end: DateTime(2022, 07, 19))),
  EventiItem(
      header: 'Torneo di briscola',
      maxPartecipanti: 50,
      eventSpawnRange: DateTimeRange(
          start: DateTime(2022, 07, 01), end: DateTime(2022, 07, 04))),
  EventiItem(
      header: 'Torneo di burraco',
      maxPartecipanti: 40,
      eventSpawnRange: DateTimeRange(
          start: DateTime(2022, 07, 05), end: DateTime(2022, 07, 09))),
  EventiItem(
      header: 'Calcio saponato',
      maxPartecipanti: 80,
      eventSpawnRange: DateTimeRange(
          start: DateTime(2022, 07, 10), end: DateTime(2022, 07, 22))),
];

List<EventiItem> getEventi() {
  return _eventi;
}
