import 'package:flutter/material.dart';

class ListItem {
  double prezzo = 0.0;
  String header = '\t';
  String body = '\t';
  String? infos;
  String category = '\t';
  bool isExpanded;
  int number;

  ListItem({
    required this.prezzo,
    required this.header,
    required this.body,
    this.isExpanded = false,
    this.infos = '\t',
    this.category = '\t',
    this.number = 0,
  });
}

class OmbrelloniItem extends ListItem {
  Image? busyIcon;

  OmbrelloniItem(
      {isExpanded,
      header,
      body = '\t',
      infos,
      prezzo = 0.0,
      category = 'Ombrelloni',
      this.busyIcon})
      : super(
          isExpanded: isExpanded!,
          header: header,
          body: body,
          infos: infos,
          category: category,
          prezzo: prezzo,
        );
}

class LettiniItem extends ListItem {
  LettiniItem({
    isExpanded,
    header,
    body,
    infos,
    category = 'Lettini',
    prezzo,
    number,
  }) : super(
          isExpanded: isExpanded!,
          header: header,
          body: body,
          infos: infos,
          category: category,
          number: number,
          prezzo: prezzo,
        );
}

class MenuItem extends ListItem {
  MenuItem(
      {header,
      isExpanded,
      body = '\t',
      this.nome = '\t',
      this.id = 42,
      prezzo = 0.0,
      category = 'Ristorante'})
      : super(
            body: body,
            header: header,
            category: category,
            prezzo: prezzo,
            isExpanded: isExpanded!);

  final String nome;
  //final double prezzo;
  final double id;
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

///Classe che gestisce il numero di oggetti selezionati in una sezione.
///L'hashmap [countMap] associa ad ogni tipo un contatore, che è il numero
///di items selezionato dall'utente.
///[MultipleCounter] si occupa quindi di salvare le informazioni e di
///fornirle al carrello che le dispone in base alla categoria.
class MultipleCounter {
  Map<ListItem, int> countMap = {};
  String? category;

  MultipleCounter({this.category});

  void addEntry(MapEntry<ListItem, int> entry) {
    countMap.addEntries([entry]);
  }

  void clear() {
    for (ListItem item in countMap.keys) {
      item.number = 0;
    }
  }

  void resetItem(ListItem item) {
    for (ListItem e in countMap.keys) {
      if (e == item) e.number = 0;
    }
  }

  int getCounterFromItem(ListItem item) {
    for (ListItem e in countMap.keys) {
      if (e == item) return item.number;
    }
    throw Exception();
  }
}

void addItem(ListItem item, MultipleCounter counter) {
  item.number++;
}

void removeItem(ListItem item, MultipleCounter counter) {
  if (item.number > 0) {
    item.number--;
  }
}

final Map<int, MultipleCounter> globalCounters = {};

const Image greenLight = Image(
  image: AssetImage("lib/assets/green_circle.png"),
  width: 24,
  height: 24,
);
const Image redLight = Image(
  image: AssetImage("lib/assets/red_circle.png"),
  width: 24,
  height: 24,
);
