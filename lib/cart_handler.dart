import 'package:flutter/material.dart';
import 'package:fluttertest/datepicker_dialog.dart';
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
      insetAnimationDuration: const Duration(milliseconds: 300),
      backgroundColor: Colors.white,
      child: SizedBox(
        width: MediaQuery.of(context).size.width / 3,
        height: MediaQuery.of(context).size.height / 3,
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 10),
            ),
            SizedBox(
              child: ListView(children: _children),
              height: MediaQuery.of(context).size.height / 4,
            ),
            const Padding(padding: EdgeInsets.only(top: 5)),
            OutlinedButton(
              child: const Icon(Icons.payments_rounded),
              onPressed: null,
              style: OutlinedButton.styleFrom(
                  shape: const CircleBorder(), primary: Colors.blueGrey),
            )
          ],
        ),
      ),
    );
  }
}

const List<String> _categories = ["Ombrelloni", "Lettini", "Ristorante"];
List<Widget> _children = [];
Map<String, List<Widget>> _subChildren = {};

/// Carica gli ordini se non sono presenti
void _loadOrders(MultipleCounter counter, String category) {
  _clearOrders();
  _subChildren.putIfAbsent(
      counter.category!, () => _subChildrenToWidget(counter, category));
}

/// Aggiunge gli ordini non presenti e aggiorna quelli già presenti
void updateOrders(MultipleCounter counter, String category) {
  _clearOrders();
  _loadOrders(counter, category);
  _subChildren.update(
      counter.category!, (value) => _subChildrenToWidget(counter, category));
}

/// Pulisce gli ordini
void _clearOrders() {
  _subChildren.clear();
}

/// Inizializza il carrello
void initCart(BuildContext context) {
  _children.clear();
  for (MultipleCounter counter in globalCounters.values) {
    _loadOrders(counter, counter.countMap.keys.first.category);
    _children.addAll(_initCategoryList(
        context, counter, counter.countMap.keys.first.category));
  }
}

/// Initializza una categoria.
/// Il titolo è applicato in base al nome della categoria,
/// A fine titolo è attaccata un'altra lista che è proprio quella degli ordini.
List<Widget> _initCategoryList(
    BuildContext context, MultipleCounter counter, String category) {
  return <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Padding(padding: EdgeInsets.only(left: 1)),
            createText(category,
                size: 20, weight: FontWeight.bold, color: Colors.black),
            OutlinedButton(
                child: const Icon(Icons.date_range_rounded),
                onPressed: category == "Ombrelloni"
                    ? null
                    : () {
                        showDialog(
                            context: context,
                            builder: (context) => CustomDatePicker());
                      },
                style: OutlinedButton.styleFrom(
                  shape: const CircleBorder(),
                  primary: Colors.blueGrey,
                )),
          ],
        ),
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

/// Crea la riga che contiene le informazioni di un item.
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
