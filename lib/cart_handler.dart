import 'package:flutter/material.dart';
import 'package:fluttertest/list_item_handler.dart';
import 'package:fluttertest/widgets_builder.dart';

class CartPopup extends StatefulWidget {
  @override
  CartPopupState createState() => CartPopupState();

  const CartPopup(Key key) : super(key: key);
}

class CartPopupState extends State<CartPopup> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetAnimationDuration: Duration(milliseconds: 300),
      backgroundColor: Colors.white,
      child: Container(
        width: MediaQuery.of(context).size.width / 3,
        height: MediaQuery.of(context).size.height / 3,
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 10),
            ),
            SizedBox(
              child: ListView(
                  children:
                      _children), //child: ListView(shrinkWrap: false, children: _items.map((key, value) => createText(key))),
              height: MediaQuery.of(context).size.height / 4,
            )
          ],
        ),
      ),
    );
  }
}

List<String> _categories = ["Ombrelloni", "Lettini", "Ristorante"];
List<Widget> _children = [];
Map<int, List<Widget>> _subChildren = {};

void _loadOrders(MultipleCounter counter, String category) {
  _clearOrders();
  _subChildren.putIfAbsent(
      counter.key!, () => _subChildrenToWidget(counter, category));
}

void updateOrders(MultipleCounter counter, String category) {
  _clearOrders();
  _loadOrders(counter, category);
  _subChildren.update(
      counter.key!, (value) => _subChildrenToWidget(counter, category));
}

void _clearOrders() {
  _subChildren.clear();
}

/// Inizializza il carrello
void initCart() {
  _children.clear();
  for (MultipleCounter counter in globalCounters.values) {
    _loadOrders(counter, counter.countMap.keys.first.category);
    _children.addAll(
        _initCategoryList(counter, counter.countMap.keys.first.category));
  }
}

/// Initializza una categoria.
/// Il titolo è applicato in base al nome della categoria,
/// A fine titolo attacco un'altra lista che è proprio quella degli ordini.
List<Widget> _initCategoryList(MultipleCounter counter, String category) {
  return <Widget>[
        createText(category,
            size: 20, weight: FontWeight.bold, color: Colors.black),
        const Padding(padding: EdgeInsets.only(top: 5)),
        const Divider(height: 2.5, indent: 25, endIndent: 25),
        const Padding(padding: EdgeInsets.only(top: 5))
      ] +
      _subChildrenToWidget(counter, category) +
      [
        const Padding(padding: EdgeInsets.only(top: 10)),
      ];
}

/// Filtra gli elementi del counter in base a quelli che appartengono
/// alla categoria e la cui quantità supera 0.
/// Questi elementi sono poi mappati in widget dentro [_createItemRow],
/// Ritorna la lista di tutti gli ordini, in [Row], creati per una categoria.
List<Widget> _subChildrenToWidget(MultipleCounter counter, String category) {
  return counter.countMap.keys
      .where((element) => element.category == category && element.number > 0)
      .map((item) => _createItemRow(item))
      .toList();
}

/// Crea la riga che contiene le informazioni di un item (Per ora nome
/// e quantità, da aggiungere il prezzo)
Row _createItemRow(ListItem item) {
  return Row(mainAxisAlignment: MainAxisAlignment.start, children: [
    const Padding(padding: EdgeInsets.only(left: 20)),
    SizedBox(
      child: createText(item.header,
          color: Colors.black, size: 14, alignment: TextAlign.left),
      width: 70,
    ),
    const Padding(padding: EdgeInsets.only(left: 40)),
    SizedBox(
      child: createText('x ' + item.number.toString(),
          color: Colors.black, size: 14, alignment: TextAlign.left),
      width: 30,
    ),
    const Padding(padding: EdgeInsets.only(left: 50)),
    InkWell(
      onTap: () {},
      child: const Image(
        image: AssetImage("lib/assets/pencil.png"),
        width: 24,
        height: 24,
      ),
    ),
    const Padding(padding: EdgeInsets.only(left: 5)),
    InkWell(
      onTap: () {},
      child: const Image(
        image: AssetImage("lib/assets/delete.png"),
        width: 24,
        height: 24,
      ),
    ),
  ]);
}
