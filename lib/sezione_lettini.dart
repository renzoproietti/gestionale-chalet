import 'package:flutter/material.dart';
import 'package:fluttertest/datepicker_dialog.dart';
import 'custom_expansion_panel.dart';
import 'widgets_builder.dart';
import 'package:fluttertest/list_item_handler.dart';
import 'package:fluttertest/custom_expansion_panel.dart' as custom_panel;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
      createButton(
        _pageController,
        AssetImage("lib/assets/sunbed_icon.png"),
        48,
        18,
        0,
        Duration(milliseconds: 400),
      ),
      Container(
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(
            width: 2,
            color: Colors.white,
          ),
          borderRadius: BorderRadius.circular(5),
        ),
        width: MediaQuery.of(context).size.width - 65,
        child: Scrollbar(
          child: Center(
            child: MediaQuery.removePadding(
              removeTop: true,
              context: context,
              child: ListView(
                shrinkWrap: true,
                children: <Widget>[
                  custom_panel.ExpansionPanelList(
                    expandedHeaderPadding:
                        const EdgeInsets.symmetric(vertical: 2, horizontal: 0),
                    expansionCallback: callback,
                    inBetweenPadding: 0.2,
                    children: _lettini.map((ListItem? item) {
                      final countKey = GlobalKey<CountState>();

                      return CustomExpansionPanel(
                        backgroundColor: Colors.white,
                        canTapOnHeader: true,
                        headerBuilder: (BuildContext context, bool isExpanded) {
                          return (Container(
                            padding: EdgeInsets.only(left: 40),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
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
                                      color: Colors.black),
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
                                    Count(countKey,
                                        item != null ? item.number : 0),
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
                                            CustomDatePicker());
                                  },
                                  child: createText(
                                    item != null ? item.body : "Aggiungi",
                                    alignment: TextAlign.center,
                                    weight: FontWeight.w700,
                                    letterSpacing: 1,
                                    size: 18,
                                    color: Colors.blue,
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
        ),
      ),
      firstPadding: MediaQuery.of(context).size.height / 15,
      secondPadding: MediaQuery.of(context).size.height / 7,
      gradientFrom: const Color(0xff701c18),
      gradientTo: const Color(0xffffb643));
}
