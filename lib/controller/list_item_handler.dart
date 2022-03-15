import 'package:Chalet/model/items.dart';
import 'package:flutter/material.dart';

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

  void update(ListItem key) {
    countMap.update(key, (value) => value);
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
  counter.update(item);
}

void removeItem(ListItem item, MultipleCounter counter) {
  if (item.number > 0) {
    item.number--;
    counter.update(item);
  }
}

void removeOnlyItem(ListItem item) {
  item.number--;
}

final Map<int, MultipleCounter> globalCounters = {};
