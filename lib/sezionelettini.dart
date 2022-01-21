import 'package:flutter/material.dart';
import 'widgetsbuilder.dart';
import 'package:fluttertest/listitemhandler.dart';

List<LettiniItem> _lettini = <LettiniItem>[
  LettiniItem(
      header: "Lettini",
      body: '0',
      infos: '\t',
      icon: Icons.bedroom_child_outlined),
  LettiniItem(
      header: "Sdraio", body: '0', infos: '\t', icon: Icons.king_bed_outlined),
  LettiniItem(
      header: "Sedie", body: '0', infos: '\t', icon: Icons.chair_alt_outlined),
];

List<LettiniItem> getLettini() {
  return _lettini;
}

Container createSezioneLettini(
  BuildContext context,
  PageController _pageController,
  Function(int, bool) callback,
) {
  return customScrollableListView(
    context,
    _pageController,
    callback,
    AssetImage("lib/assets/sunbed_icon.png"),
    Duration(milliseconds: 400),
    _lettini,
    width: MediaQuery.of(context).size.width - 65,
    height: MediaQuery.of(context).size.height / 4.5,
    secondPaddingColumn: MediaQuery.of(context).size.height / 6,
    firstPaddingRow: MediaQuery.of(context).size.width / 30,
    background: Color(0xffa00c18),
    itemIcon: const Icon(Icons.bedroom_child_outlined),
    cartIcon: const Icon(Icons.add_shopping_cart_rounded),
    minusIcon: const Icon(
      Icons.remove,
      size: 20,
      color: Colors.black,
    ),
    firstPaddingBodyRow: 1,
    plusIcon: const Icon(
      Icons.add,
      size: 20,
      color: Colors.black,
    ),
    secondPaddingBodyRow: MediaQuery.of(context).size.width / 5,
    plusMinusIconsSizes: 1,
  );
}
