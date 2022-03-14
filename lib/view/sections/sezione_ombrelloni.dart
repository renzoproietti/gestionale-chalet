import 'package:flutter/material.dart';
import '../external/custom_expansion_panel.dart';
import '../core/widgets_builder.dart';
import 'package:Chalet/controller/list_item_handler.dart';
import 'package:Chalet/view/external/custom_expansion_panel.dart'
    as custom_panel;

List<OmbrelloniItem> _file = <OmbrelloniItem>[
  OmbrelloniItem(
      header: "Prima fila",
      isExpanded: false,
      busyIcon: greenLight,
      prezzo: 15.00),
  OmbrelloniItem(
      header: "Seconda fila",
      isExpanded: false,
      busyIcon: redLight,
      prezzo: 13.00),
  OmbrelloniItem(
      header: "Terza fila",
      isExpanded: false,
      busyIcon: greenLight,
      prezzo: 11.00),
  OmbrelloniItem(
      header: "Quarta fila",
      isExpanded: false,
      busyIcon: greenLight,
      prezzo: 9.00),
  OmbrelloniItem(
      header: "Quinta fila",
      isExpanded: false,
      busyIcon: redLight,
      prezzo: 7.00),
  OmbrelloniItem(
      header: "Sesta fila",
      isExpanded: false,
      busyIcon: greenLight,
      prezzo: 5.00),
  OmbrelloniItem(
      header: "Settima fila",
      isExpanded: false,
      busyIcon: greenLight,
      prezzo: 4.00),
];
const int ombrelloniPerFila = 10;

List<OmbrelloniItem> initFila(OmbrelloniItem fila) {
  List<OmbrelloniItem> _ombrelloni = <OmbrelloniItem>[];
  for (int i = 1; i < ombrelloniPerFila; i++) {
    _ombrelloni.add(OmbrelloniItem(
        header: '$i',
        prezzo: fila.prezzo,
        body: "Prenota",
        isExpanded: false,
        number: 0));
  }

  return _ombrelloni;
}

List<OmbrelloniItem> getFile() {
  return _file;
}

class SezioneOmbrelloni extends StatefulWidget {
  @override
  _SezioneOmbrelloniState createState() => _SezioneOmbrelloniState();

  late final PageController pageController;
  final MultipleCounter counter = MultipleCounter(category: "Ombrelloni");
  final void Function(int, bool)? callback;

  SezioneOmbrelloni({required this.pageController, this.callback});
}

class _SezioneOmbrelloniState extends State<SezioneOmbrelloni> {
  @override
  void initState() {
    super.initState();
    globalCounters.putIfAbsent(0, () => widget.counter);
  }

  @override
  Widget build(BuildContext context) {
    return PageContainer(
      gradients: const <Color>[
        Color(0xff461055),
        Color(0xff701c18),
      ],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).size.height / 15),
          ),
          CustomHomeButton(
            child: const Image(
                image: AssetImage("lib/assets/images/umbrella_icon.png"),
                width: 48,
                height: 48),
            pageController: widget.pageController,
            page: 0,
            animationTime: const Duration(milliseconds: 300),
            innerPadding: const EdgeInsets.all(18),
          ),
          Padding(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).size.height / 11),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 80 / 100,
            height: MediaQuery.of(context).size.height * 45 / 100,

            decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border.all(
                width: 2,
                color: Colors.white,
              ),
              borderRadius: BorderRadius.circular(5),
            ),
            //necessario rimuovere il padding quando
            //l'appBar è transparente o rimossa.
            child: MediaQuery.removePadding(
              removeTop: true,
              removeBottom: true,
              context: context,
              child: Center(
                //child: Expanded(
                child: ListView(
                  shrinkWrap: false,
                  children: <Widget>[
                    custom_panel.ExpansionPanelList(
                      inBetweenPadding: 0.2,
                      expandedHeaderPadding: const EdgeInsets.symmetric(
                          vertical: 4, horizontal: 0),
                      expansionCallback: widget.callback,
                      children: getFile().map((OmbrelloniItem fila) {
                        return CustomExpansionPanel(
                            canTapOnHeader: true,
                            headerBuilder:
                                (BuildContext context, bool isExpanded) {
                              return Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  const Padding(
                                    padding: EdgeInsets.only(left: 20),
                                  ),
                                  fila.busyIcon!,
                                  const Padding(
                                    padding: EdgeInsets.only(left: 20),
                                  ),
                                  createText(fila.header,
                                      alignment: TextAlign.left,
                                      weight: FontWeight.bold,
                                      letterSpacing: 1.2,
                                      size: 20,
                                      color: Colors.black),
                                ],
                              );
                            },
                            isExpanded: fila.isExpanded,
                            body: ListView(
                                shrinkWrap: true,
                                physics: const BouncingScrollPhysics(),
                                children:
                                    initFila(fila).map((ListItem ombrellone) {
                                  widget.counter.addEntry(
                                      MapEntry(ombrellone, ombrellone.number));

                                  return ListContainerOmbrelloni(
                                    item: ombrellone,
                                    counter: widget.counter,
                                    onPrenotaPressed: () => setState(() {
                                      addItem(ombrellone, widget.counter);
                                    }),
                                  );
                                }).toList()));
                      }).toList(),
                    ),
                  ],
                ),
              ),
            ),
          ), //),
        ],
      ),
    );
  }
}
