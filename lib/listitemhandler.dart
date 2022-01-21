import 'package:flutter/material.dart';

abstract class ListItem {
  Icon icon;

  bool isExpanded;
  String header;
  String body;
  String infos;

  ListItem({
    this.isExpanded = false,
    this.header = '\t',
    this.body = '\t',
    this.infos = '\t',
    this.icon = empty_icon,
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
  }) : super(
          isExpanded: false,
          header: header,
          body: body,
          infos: infos,
          icon: empty_icon,
        );
}

const Image empty_image = Image(
  image: AssetImage("lib/assets/green_circle.png"),
  width: 0,
  height: 0,
);
const Icon empty_icon = Icon(
  Icons.abc,
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

final List<ListItem> _cart = <ListItem>[];
