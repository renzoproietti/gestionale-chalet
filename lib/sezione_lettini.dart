import 'package:flutter/material.dart';
import 'package:fluttertest/datepicker_dialog.dart';
import 'custom_expansion_panel.dart';
import 'widgets_builder.dart';
import 'main.dart';
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
  final lettiniMapKey = GlobalKey();
  MultipleCounter counter = MultipleCounter();
  return createPageContainer(
      context,
      const Color(0xffa00c18),
      CustomHomeButton(
        pageController: _pageController,
        buttonIcon: AssetImage("lib/assets/sunbed_icon.png"),
        size: 48,
        innerPadding: EdgeInsets.all(18),
        page: 0,
        animationTime: Duration(milliseconds: 400),
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
                    children: _lettini.map((ListItem item) {
                      counter.addEntry(MapEntry(item, item.number));
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
                                createText(item.header,
                                    alignment: TextAlign.center,
                                    weight: FontWeight.bold,
                                    size: 20,
                                    color: Colors.black),
                              ],
                            ),
                          ));
                        },
                        isExpanded: item.isExpanded,
                        body: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Flexible(
                                child: Row(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        //if the counter is positive then
                                        //decrease it on tap of remove icon.
                                        if (item.number > 0) {
                                          item.number--;
                                          counter.updateMap(item, false);
                                          Chalet.of(context)!.setState(() {});
                                        }
                                      },
                                      child: const Icon(
                                        Icons.remove,
                                        color: Colors.blue,
                                      ),
                                    ),
                                    createText(
                                        counter
                                            .getCounterFromItem(item)
                                            .toString(),
                                        size: 26,
                                        color: Colors.black),
                                    InkWell(
                                      onTap: () {
                                        item.number++;
                                        counter.updateMap(item, true);
                                        Chalet.of(context)!.setState(() {});
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
                                    AppLocalizations.of(context)!.aggiungi,
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
