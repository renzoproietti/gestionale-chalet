import 'package:flutter/material.dart';

class ListItem {
  Icon icon;

  bool isExpanded;
  String header;
  String body;
  String infos;
  String category;
  int number;

  ListItem({
    this.isExpanded = false,
    this.header = '\t',
    this.body = '\t',
    this.infos = '\t',
    this.category = '\t',
    this.icon = empty_icon,
    this.number = 0,
  });
}

class OmbrelloniItem extends ListItem {
  OmbrelloniItem(
      {isExpanded, header, body, infos, icon, category = 'Ombrelloni'})
      : super(
          isExpanded: false,
          header: header,
          body: body,
          infos: infos,
          category: category,
          icon: const Icon(Icons.beach_access_rounded),
        );
}

class LettiniItem extends ListItem {
  LettiniItem({
    isExpanded,
    header,
    body,
    infos,
    category = 'Lettini',
    icon,
    number,
  }) : super(
          isExpanded: false,
          header: header,
          body: body,
          infos: infos,
          category: category,
          icon: empty_icon,
          number: number,
        );
}

class MenuItem extends ListItem {
  MenuItem(
      {header,
      isExpanded,
      this.nome = '\t',
      this.prezzo = 0,
      this.id = 42,
      category = 'Ristorante'})
      : super(header: header, category: category);

  final String nome;
  final double prezzo;
  final double id;
}

final List<MenuItem> _menu = <MenuItem>[
  MenuItem(header: 'Antipasti'),
  MenuItem(header: 'Primi'),
  MenuItem(header: 'Secondi'),
  MenuItem(header: 'Contorni'),
  MenuItem(header: 'Dolci'),
  MenuItem(header: 'Bevande'),
  MenuItem(header: 'Vini'),
  MenuItem(header: 'Digestivi/Amari')
];
final List<MenuItem> _antipasti = <MenuItem>[
  MenuItem(header: 'Melone', prezzo: 5),
  MenuItem(header: 'Salmone', prezzo: 7),
  MenuItem(header: 'Patatine', prezzo: 2),
  MenuItem(header: 'Olive', prezzo: 5),
];
final List<MenuItem> _primi = <MenuItem>[
  MenuItem(header: 'Spaghetti', prezzo: 11),
  MenuItem(header: 'Strozzapreti', prezzo: 9),
  MenuItem(header: 'Lasagne', prezzo: 10),
  MenuItem(header: 'Gnocchi', prezzo: 8),
];
final List<MenuItem> _secondi = <MenuItem>[
  MenuItem(header: 'Grigliata mista', prezzo: 15),
  MenuItem(header: 'Fritto Misto', prezzo: 13),
  MenuItem(header: 'Fritto gamberi/calamari', prezzo: 11),
];
final List<MenuItem> _contorni = <MenuItem>[
  MenuItem(header: 'Patatine', prezzo: 5),
  MenuItem(header: 'Olive Ascolane', prezzo: 5),
  MenuItem(header: 'Crocchette', prezzo: 5),
  MenuItem(header: 'Cozze', prezzo: 7),
  MenuItem(header: 'Insalata', prezzo: 6),
];
final List<MenuItem> _dolci = <MenuItem>[
  MenuItem(header: 'Tiramisù', prezzo: 4),
  MenuItem(header: 'Panna cotta', prezzo: 4),
  MenuItem(header: 'Sorbetto', prezzo: 3),
  MenuItem(header: 'Gelato', prezzo: 2.50),
];
final List<MenuItem> _bevande = <MenuItem>[
  MenuItem(header: 'Acqua naturale', prezzo: 1),
  MenuItem(header: 'Acqua frizzante', prezzo: 1),
  MenuItem(header: 'Coca-Cola', prezzo: 2.50),
  MenuItem(header: 'Fanta', prezzo: 2.50),
  MenuItem(header: 'Sprite', prezzo: 2.50),
  MenuItem(header: 'Birra', prezzo: 3.50),
];
final List<MenuItem> _vini = <MenuItem>[
  MenuItem(header: 'Rosso', prezzo: 4),
  MenuItem(header: 'Bianco', prezzo: 4),
];
final List<MenuItem> _amari = <MenuItem>[
  MenuItem(header: 'Rosso', prezzo: 4),
  MenuItem(header: 'Bianco', prezzo: 4),
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

class MultipleCounter {
  Map<ListItem, int> countMap = {};
  int? key;

  MultipleCounter({this.key});

  void updateMap(ListItem item, bool increment) {
    countMap.update(item, (value) => increment ? value++ : value--);
  }

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
    throw Exception("No items found");
  }
}

void addItem(ListItem item, MultipleCounter counter, State state) {
  item.number++;
  counter.updateMap(item, true);
  state.setState(() {});
}

void removeItem(ListItem item, MultipleCounter counter, State state) {
  if (item.number > 0) {
    item.number--;
    counter.updateMap(item, false);
    state.setState(() {});
  }
}

const Image empty_image = Image(
  image: AssetImage("lib/assets/green_circle.png"),
  width: 0,
  height: 0,
);
const ImageProvider<Object> empty_image_provider = AssetImage("");

const Icon empty_icon = Icon(
  Icons.ac_unit,
  size: 0,
);
const Image green_light = Image(
  image: AssetImage("lib/assets/green_circle.png"),
  width: 24,
  height: 24,
);
const Image red_light = Image(
  image: AssetImage("lib/assets/red_circle.png"),
  width: 24,
  height: 24,
);
