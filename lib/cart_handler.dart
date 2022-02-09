import 'package:flutter/material.dart';
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
              createText('Carrello',
                  alignment: TextAlign.center,
                  weight: FontWeight.normal,
                  letterSpacing: 1.2,
                  size: 20,
                  color: Colors.black),
            ],
          )),
    );
  }
}
