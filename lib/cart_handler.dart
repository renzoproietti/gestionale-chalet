import 'package:flutter/material.dart';
import 'package:fluttertest/widgets_builder.dart';

class CartPopup extends StatefulWidget {
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
              createText(
                  'Carrello', TextAlign.center, FontWeight.normal, 1.2, 20),
            ],
          )),
    );
  }
}
