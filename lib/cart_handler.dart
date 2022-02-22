import 'package:flutter/material.dart';
import 'package:fluttertest/list_item_handler.dart';
import 'package:fluttertest/main.dart';
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
        alignment: Alignment.center,
        //color: Colors.white10,
        width: MediaQuery.of(context).size.width / 3,
        height: MediaQuery.of(context).size.height / 3,
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 10),
            ),
            createText('Carrello',
                alignment: TextAlign.center,
                weight: FontWeight.normal,
                letterSpacing: 1.1,
                size: 20,
                color: Colors.black),
            const Padding(
              padding: EdgeInsets.only(top: 20),
            ),
            SizedBox(
              child: ListView(
                shrinkWrap: false,
                children: cartList(context),
              ),
              height: MediaQuery.of(context).size.height / 4,
            )
          ],
        ),
      ),
    );
  }
}

Map<ListItem, int> _cart = {};

Set<ListItem> removeAllIf(MultipleCounter counter) {
  return _cart.keys.where((element) => element.number < 1).toSet();
}

void loadItemsOnCart(MultipleCounter counter) {
  _cart.addAll(counter.countMap);
  removeAllIf(counter).forEach((element) {
    _cart.remove(element);
  });
}

void loadItemOnCart(ListItem item) {
  MapEntry<ListItem, int> entry = MapEntry(item, item.number);
  List<MapEntry<ListItem, int>> list = [entry];
  if (item.number > 0) _cart.addEntries(list);
}

void removeItemFromCart(ListItem item, State state) {
  _cart.remove(item);
  state.setState(() {});
}

List<Widget> cartList(BuildContext context) {
  List<Widget> cartList = [];
  for (ListItem item in _cart.keys) {
    cartList.add(Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 2),
      child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
        SizedBox(
          child: createText(item.header,
              color: Colors.black, size: 18, alignment: TextAlign.left),
          width: MediaQuery.of(context).size.width / 4,
        ),
        SizedBox(
          child: createText('x' + item.number.toString(),
              color: Colors.black, size: 18),
          width: MediaQuery.of(context).size.width / 8,
        ),
        Padding(padding: EdgeInsets.only(left: 20)),
        InkWell(
          child: Image(
            image: AssetImage("lib/assets/pencil.png"),
            width: 32,
            height: 32,
          ),
          onTap: () {},
        ),
        Padding(padding: EdgeInsets.only(left: 5)),
        InkWell(
          child: Image(
            image: AssetImage("lib/assets/delete.png"),
            width: 32,
            height: 32,
          ),
          onTap: () {
            removeItemFromCart(item, Chalet.of(context) as State);
          },
        )
      ]),
    ));
  }
  return cartList;
}
