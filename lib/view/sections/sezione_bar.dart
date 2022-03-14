import 'package:flutter/material.dart';
import 'package:Chalet/controller/list_item_handler.dart';
import '../external/custom_expansion_panel.dart';
import '../core/widgets_builder.dart';
import '../external/custom_expansion_panel.dart' as custom_panel;

class SezioneBar extends StatefulWidget {
  @override
  _SezioneBarState createState() => _SezioneBarState();

  late final PageController pageController;
  final MultipleCounter counter = MultipleCounter(category: "Ristorante");
  final void Function(int, bool)? callback;

  SezioneBar({required this.pageController, this.callback});
}

class _SezioneBarState extends State<SezioneBar> {
  @override
  void initState() {
    super.initState();
    globalCounters.putIfAbsent(2, () => widget.counter);
  }

  @override
  Widget build(BuildContext context) {
    return PageContainer(
      gradients: const <Color>[Color(0xffffb643), Color(0xff33a284)],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height / 15)),
          CustomHomeButton(
            pageController: widget.pageController,
            child: const Image(
              image: AssetImage("lib/assets/images/bar_icon.png"),
              width: 48,
              height: 48,
            ),
            innerPadding: const EdgeInsets.all(18),
            page: 0,
            animationTime: const Duration(milliseconds: 500),
          ),
          Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height / 15)),
          Container(
            width: MediaQuery.of(context).size.width / 1.2,
            height: MediaQuery.of(context).size.height / 2,
            decoration: BoxDecoration(
              color: Colors.black,
              border: Border.all(
                width: 2,
                color: Colors.white,
              ),
              borderRadius: BorderRadius.circular(5),
            ),
            child: MediaQuery.removePadding(
              removeTop: true,
              removeBottom: true,
              context: context,
              child: Scrollbar(
                child: Center(
                  child: ListView(
                    shrinkWrap: false,
                    children: <Widget>[
                      custom_panel.ExpansionPanelList(
                        inBetweenPadding: 0.2,
                        expandedHeaderPadding: const EdgeInsets.symmetric(
                            vertical: 4, horizontal: 0),
                        expansionCallback: widget.callback,
                        children: getMenu().map((MenuItem? section) {
                          return CustomExpansionPanel(
                              canTapOnHeader: true,
                              headerBuilder:
                                  (BuildContext context, bool isExpanded) {
                                return Row(
                                  children: <Widget>[
                                    Padding(
                                        padding: EdgeInsets.only(
                                            left: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                20)),
                                    createText(section!.header,
                                        alignment: TextAlign.left,
                                        weight: FontWeight.bold,
                                        letterSpacing: 1.2,
                                        size: 20,
                                        color: Colors.black),
                                  ],
                                );
                              },
                              isExpanded: section!.isExpanded,
                              body: ListView(
                                  shrinkWrap: true,
                                  physics: const BouncingScrollPhysics(),
                                  children: _pickItem(section.header)
                                      .map((MenuItem pietanza) {
                                    widget.counter.addEntry(
                                        MapEntry(pietanza, pietanza.number));

                                    return ListContainer(
                                      item: pietanza,
                                      onRemoveTap: () => setState(() {
                                        removeItem(pietanza, widget.counter);
                                      }),
                                      onAddTap: () => setState(() {
                                        addItem(pietanza, widget.counter);
                                      }),
                                    );
                                  }).toList()));
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

List<MenuItem> _pickItem(String item) {
  switch (item) {
    case 'Antipasti':
      return getAntipasti();
    case 'Primi':
      return getPrimi();
    case 'Secondi':
      return getSecondi();
    case 'Contorni':
      return getContorni();
    case 'Dolci':
      return getDolci();
    case 'Bevande':
      return getBevande();
    case 'Vini':
      return getVini();
    case 'Amari/Digestivi':
      return getAmari();
    default:
      return getPrimi();
  }
}
