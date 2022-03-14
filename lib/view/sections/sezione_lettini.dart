import 'package:flutter/material.dart';
import '../external/custom_expansion_panel.dart';
import '../core/widgets_builder.dart';
import 'package:fluttertest/controller/list_item_handler.dart';
import 'package:fluttertest/view/external/custom_expansion_panel.dart'
    as custom_panel;

List<LettiniItem> _lettini = <LettiniItem>[
  LettiniItem(
      header: "Lettini",
      body: 'Aggiungi',
      infos: '\t',
      number: 0,
      prezzo: 6.0,
      isExpanded: false),
  LettiniItem(
      header: "Sdraio",
      body: 'Aggiungi',
      infos: '\t',
      number: 0,
      prezzo: 5.0,
      isExpanded: false),
  LettiniItem(
      header: "Sedie",
      body: 'Aggiungi',
      infos: '\t',
      number: 0,
      prezzo: 4.0,
      isExpanded: false),
];

List<LettiniItem> getLettini() {
  return _lettini;
}

class SezioneLettini extends StatefulWidget {
  @override
  _SezioneLettiniState createState() => _SezioneLettiniState();

  late final PageController pageController;
  final MultipleCounter counter = MultipleCounter(category: "Lettini");
  final void Function(int, bool)? callback;

  SezioneLettini({required this.pageController, this.callback});
}

class _SezioneLettiniState extends State<SezioneLettini> {
  @override
  void initState() {
    super.initState();
    globalCounters.putIfAbsent(1, () => widget.counter);
  }

  @override
  Widget build(BuildContext context) {
    return PageContainer(
      gradients: const <Color>[
        Color(0xff701c18),
        Color(0xffffb643),
      ],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).size.height / 15),
          ),
          CustomHomeButton(
            pageController: widget.pageController,
            child: const Image(
                image: AssetImage("lib/assets/sunbed_icon.png"),
                width: 48,
                height: 48),
            innerPadding: const EdgeInsets.all(18),
            page: 0,
            animationTime: const Duration(milliseconds: 400),
          ),
          Padding(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).size.height / 6),
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
            child: MediaQuery.removePadding(
              removeTop: true,
              removeBottom: true,
              context: context,
              child: Scrollbar(
                child: Center(
                  child: ListView(
                    shrinkWrap: true,
                    children: <Widget>[
                      custom_panel.ExpansionPanelList(
                        expandedHeaderPadding: const EdgeInsets.symmetric(
                            vertical: 9, horizontal: 0),
                        expansionCallback: widget.callback,
                        inBetweenPadding: 0.2,
                        children: _lettini.map((ListItem item) {
                          widget.counter.addEntry(MapEntry(item, item.number));
                          return CustomExpansionPanel(
                            backgroundColor: Colors.white,
                            canTapOnHeader: true,
                            headerBuilder:
                                (BuildContext context, bool isExpanded) {
                              return Container(
                                padding: EdgeInsets.only(
                                    left:
                                        MediaQuery.of(context).size.width / 10),
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
                              );
                            },
                            isExpanded: item.isExpanded,
                            body: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left:
                                            MediaQuery.of(context).size.width /
                                                10),
                                  ),
                                  Flexible(
                                    child: InkWell(
                                      onTap: () {
                                        //if the counter is positive then
                                        //decrease it on tap of remove icon.
                                        setState(() {
                                          removeItem(item, widget.counter);
                                        });
                                      },
                                      child: const Icon(
                                        Icons.remove,
                                        color: Colors.blue,
                                      ),
                                    ),
                                  ),
                                  Flexible(
                                    child: createText(item.number.toString(),
                                        size: 26, color: Colors.black),
                                  ),
                                  Flexible(
                                    child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          addItem(item, widget.counter);
                                        });
                                      },
                                      child: const Icon(
                                        Icons.add,
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
        ],
      ),
    );
  }
}
