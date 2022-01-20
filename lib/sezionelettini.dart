import 'package:flutter/material.dart';
import 'widgetsbuilder.dart';

class LettinoItem extends ListItem {
  LettinoItem({isExpanded, header, body, infos})
      : super(isExpanded: false, header: header, body: body, infos: infos);
}

List<LettinoItem> _lettini = <LettinoItem>[
  LettinoItem(header: "Lettini", body: '\t', infos: '\t'),
  LettinoItem(header: "Sdraio", body: '\t', infos: '\t'),
  LettinoItem(header: "Sedie", body: '\t', infos: '\t'),
];

List<LettinoItem> getLettini() {
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
    height: MediaQuery.of(context).size.height / 2.85,
    circle: green_light,
    background: Color(0xffc00c18),
  );
}
