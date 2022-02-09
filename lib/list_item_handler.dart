import 'package:flutter/material.dart';
import 'package:fluttertest/widgets_builder.dart';

abstract class ListItem {
  Icon icon;

  bool isExpanded;
  String header;
  String body;
  String infos;
  int number;

  ListItem({
    this.isExpanded = false,
    this.header = '\t',
    this.body = '\t',
    this.infos = '\t',
    this.icon = empty_icon,
    this.number = 0,
  });
}

class OmbrelloniItem extends ListItem {
  OmbrelloniItem({isExpanded, header, body, infos, icon})
      : super(
          isExpanded: false,
          header: header,
          body: body,
          infos: infos,
          icon: const Icon(Icons.beach_access_rounded),
        );
}

class LettiniItem extends ListItem {
  LettiniItem({
    isExpanded,
    header,
    body,
    infos,
    icon,
    number,
  }) : super(
          isExpanded: false,
          header: header,
          body: body,
          infos: infos,
          icon: empty_icon,
          number: number,
        );
}

class MultipleCounter {
  Map<ListItem, int> countMap = {};

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

const Image empty_image = Image(
  image: AssetImage("lib/assets/green_circle.png"),
  width: 0,
  height: 0,
);
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
