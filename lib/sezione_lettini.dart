import 'package:flutter/material.dart';
import 'package:fluttertest/datepicker_dialog.dart';
import 'widgets_builder.dart';
import 'package:fluttertest/list_item_handler.dart';

List<LettiniItem> _lettini = <LettiniItem>[
  LettiniItem(
      header: "Lettini",
      body: 'Aggiungi',
      infos: '\t',
      icon: Icons.bedroom_child_outlined,
      number: 0),
  LettiniItem(
      header: "Sdraio",
      body: 'Aggiungi',
      infos: '\t',
      icon: Icons.king_bed_outlined,
      number: 0),
  LettiniItem(
    header: "Sedie",
    body: 'Aggiungi',
    infos: '\t',
    icon: Icons.chair_alt_outlined,
    number: 0,
  ),
];

List<LettiniItem> getLettini() {
  return _lettini;
}

Container createSezioneLettini(
  BuildContext context,
  PageController _pageController,
  Function(int, bool) callback,
) {
  return createPageContainer(
      context,
      const Color(0xffa00c18),
      MediaQuery.of(context).size.height / 15,
      MediaQuery.of(context).size.height / 7,
      createButton(_pageController, AssetImage("lib/assets/sunbed_icon.png"),
          48, 18, 0, Duration(milliseconds: 400)),
      Container(
        decoration: BoxDecoration(
          color: const Color(0xff800c18),
          border: Border.all(
            width: 2,
            color: Colors.white,
          ),
          borderRadius: BorderRadius.circular(5),
        ),
        width: MediaQuery.of(context).size.width - 65,
        child: Scrollbar(
          child: Center(
            child: ListView(
              shrinkWrap: true,
              children: <Widget>[
                ExpansionPanelList(
                  expandedHeaderPadding:
                      const EdgeInsets.symmetric(vertical: 4, horizontal: 0),
                  expansionCallback: callback,
                  children: _lettini.map((ListItem? item) {
                    final countKey = GlobalKey<CountState>();

                    return ExpansionPanel(
                      canTapOnHeader: true,
                      headerBuilder: (BuildContext context, bool isExpanded) {
                        return (Container(
                          padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width / 25),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                item != null ? item.header : "-1",
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontFamily: 'Raleway',
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        ));
                      },
                      isExpanded: item != null ? item.isExpanded : false,
                      body: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Flexible(
                              child: Row(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      //if the counter is positive then
                                      //decrease it on tap of remove icon.
                                      if (countKey.currentState
                                              ?.checkPositive() ==
                                          true) {
                                        countKey.currentState?.decrement();
                                      }
                                    },
                                    child: const Icon(
                                      Icons.remove,
                                      color: Colors.blue,
                                    ),
                                  ),
                                  Count(
                                      countKey, item != null ? item.number : 0),
                                  InkWell(
                                    onTap: () {
                                      countKey.currentState?.increment();
                                    },
                                    child: const Icon(
                                      Icons.add,
                                      color: Colors.blue,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Flexible(
                              child: TextButton(
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (context) =>
                                          LocalizationDatePicker());
                                },
                                child: createText(
                                  item != null ? item.body : "Aggiungi",
                                  TextAlign.center,
                                  FontWeight.w700,
                                  1,
                                  18,
                                  Colors.blue,
                                ),
                              ),
                            ),
                          ]),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        ),
      ));
}
