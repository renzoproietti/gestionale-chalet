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

//Widget contatore che permette di aggiornare lo stato quando cambia il counter.
//Lo stato mette a disposizione metodi per l'aggiornamento al di fuori della classe.
class Count extends StatefulWidget {
  final int counter;

  const Count(Key key, this.counter) : super(key: key);

  @override
  CountState createState() => CountState();
}

class CountState extends State<Count> {
  int counter;

  CountState({this.counter = 0});

  @override
  Widget build(BuildContext context) {
    return createText('$counter', color: Colors.black);
  }

  void decrement() {
    setState(() {
      counter--;
    });
  }

  void increment() {
    setState(() {
      counter++;
    });
  }

  bool checkPositive() {
    return counter > 0;
  }
}
