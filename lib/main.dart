//import 'dart:html';

import 'dart:math';

import 'package:flutter/material.dart';

class OmbrelloneItem {
  OmbrelloneItem(
      {this.isExpanded = false,
      this.header = 'h',
      this.body = 'b',
      this.fila = 'f'});

  bool isExpanded;
  final String header;
  final String fila;
  final String body;
}

void main() => runApp(MaterialApp(
      home: CasottoHome(),
    ));

class CasottoHome extends StatefulWidget {
  _CasottoState createState() => _CasottoState();
}

class _CasottoState extends State<CasottoHome> {
  final _pageController = PageController(initialPage: 0);

  List<OmbrelloneItem> _ombrelloni = <OmbrelloneItem>[
    OmbrelloneItem(header: "1", body: "Body", fila: "prima fila"),
    OmbrelloneItem(header: "2", body: "Body2", fila: "prima fila"),
    OmbrelloneItem(header: "3", body: "Body3", fila: "prima fila"),
    OmbrelloneItem(header: "4", body: "Body", fila: "prima fila"),
    OmbrelloneItem(header: "5", body: "Body2", fila: "prima fila"),
    OmbrelloneItem(header: "6", body: "Body3", fila: "seconda fila"),
    OmbrelloneItem(header: "7", body: "Body", fila: "seconda fila"),
    OmbrelloneItem(header: "8", body: "Body2", fila: "terza fila"),
    OmbrelloneItem(header: "9", body: "Body3", fila: "quarta fila"),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        leading: ElevatedButton(
          onPressed: () {},
          child: const Icon(Icons.category_rounded),
        ),
        elevation: 1,
        titleSpacing: 2.0,
        actions: const <Widget>[
          Icon(Icons.notifications_rounded),
          Icon(Icons.person_off_outlined)
        ],
        centerTitle: true,
        title: Text('CASOTTO'),
      ),
      body: PageView(
        physics: const AlwaysScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        controller: _pageController,
        children: <Widget>[
          Container(
            constraints: BoxConstraints.expand(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border.all(
                color: const Color(0xff161055),
                style: BorderStyle.solid,
              ),
              gradient: const LinearGradient(
                colors: <Color>[Color(0xff161055), Color(0xff161055)],
                tileMode: TileMode.clamp,
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    createButton(
                      const AssetImage("lib/assets/umbrella.png"),
                      64, //size
                      24, //padding
                      _pageController, //controller pagina
                      1, //scrolla fino a questa pagina
                      const Duration(
                          milliseconds: 300), //durata della transizione
                    ), //Bottone Sezione Ombrelloni
                    Padding(
                        padding:
                            EdgeInsets.all(MediaQuery.of(context).size.width) /
                                30),
                    createButton(
                      const AssetImage("lib/assets/sunbed.png"),
                      64,
                      24,
                      _pageController,
                      2,
                      const Duration(milliseconds: 400),
                    ), //Bottone Sezione lettini
                  ],
                ),
                Padding(
                    padding:
                        EdgeInsets.all(MediaQuery.of(context).size.height) /
                            50),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    createButton(
                      const AssetImage("lib/assets/fast-food.png"),
                      64,
                      24,
                      _pageController,
                      3,
                      const Duration(milliseconds: 500),
                    ), //Bottone Sezione Cibo/Bevande
                    Padding(
                        padding:
                            EdgeInsets.all(MediaQuery.of(context).size.width) /
                                30),
                    createButton(
                      const AssetImage("lib/assets/party.png"),
                      64,
                      24,
                      _pageController,
                      4,
                      const Duration(milliseconds: 600),
                    ), //Bottone Sezione Eventi
                  ],
                ),
              ],
            ),
          ),

          createPageContainer(
            Color(0xffffb643),
            Color(0xffe6ab10),
            MediaQuery.of(context).size.height / 15,
            MediaQuery.of(context).size.height / 15,
            createButton(
              AssetImage("lib/assets/umbrella.png"),
              48,
              18,
              _pageController,
              0,
              Duration(milliseconds: 300),
            ),
            SizedBox(
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xffe6ab10),
                  border: Border.all(
                    width: 2,
                    color: Colors.white,
                  ),
                  borderRadius: BorderRadius.circular(5),
                ),
                width: MediaQuery.of(context).size.width - 65,
                height: MediaQuery.of(context).size.height / 1.85,
                child: Scrollbar(
                  child: ListView(
                    shrinkWrap: true,
                    children: <Widget>[
                      ExpansionPanelList(
                        expansionCallback: (int index, bool isExpanded) {
                          setState(() {
                            _ombrelloni[index].isExpanded =
                                !_ombrelloni[index].isExpanded;
                          });
                        },
                        children: _ombrelloni.map((OmbrelloneItem item) {
                          return ExpansionPanel(
                              canTapOnHeader: true,
                              headerBuilder:
                                  (BuildContext context, bool isExpanded) {
                                return (Container(
                                    padding: EdgeInsets.only(
                                        left:
                                            MediaQuery.of(context).size.width /
                                                25),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        const Image(
                                          image: AssetImage(
                                              "lib/assets/green_circle.png"),
                                          width: 24,
                                          height: 24,
                                        ),
                                        Padding(
                                            padding: EdgeInsets.only(
                                                left: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    9)),
                                        const Icon(Icons.beach_access),
                                        Text(
                                          item.header,
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                            fontFamily: 'Raleway',
                                            fontWeight: FontWeight.bold,
                                            letterSpacing: 1,
                                            fontSize: 18,
                                          ),
                                        ),
                                        Padding(
                                            padding: EdgeInsets.only(
                                                left: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    11)),
                                        Text(
                                          item.fila,
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                            fontFamily: 'Raleway',
                                            fontWeight: FontWeight.normal,
                                            letterSpacing: 1,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ],
                                    )));
                              },
                              isExpanded: item.isExpanded,
                              body: FittedBox(
                                  child: Center(
                                      child: TextButton(
                                          onPressed: () {},
                                          child: const Text(
                                            "Prenota",
                                            style: TextStyle(
                                              fontFamily: 'Raleway',
                                              fontWeight: FontWeight.w700,
                                              letterSpacing: 1,
                                              fontSize: 16,
                                            ),
                                          )))));
                        }).toList(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          createPageContainer(
            Color(0xff161055),
            Color(0xff161055),
            MediaQuery.of(context).size.height / 15,
            MediaQuery.of(context).size.height / 5,
            createButton(
              AssetImage("lib/assets/sunbed.png"),
              48,
              18,
              _pageController,
              0,
              Duration(milliseconds: 400),
            ),
            SizedBox(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black,
                  border: Border.all(
                    width: 2,
                    color: Colors.white,
                  ),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      createCustomSelectContainer(
                        Icon(Icons.bed_rounded),
                        'Lettini',
                        MediaQuery.of(context).size.width / 5,
                      ),
                      createCustomSelectContainer(
                        Icon(Icons.single_bed_rounded),
                        'Sdraio',
                        MediaQuery.of(context).size.width / 5,
                      ),
                      createCustomSelectContainer(
                        Icon(Icons.chair_rounded),
                        'Sedie',
                        MediaQuery.of(context).size.width / 5,
                      ),
                    ]),
                width: MediaQuery.of(context).size.width - 65,
              ),
            ),
          ),

          createPageContainer(
              Color(0xffffb643), //gradient from
              Color(0xffe6ab10),
              MediaQuery.of(context).size.height / 15,
              MediaQuery.of(context).size.height / 5, //gradient to
              createButton(
                  AssetImage("lib/assets/fast-food.png"),
                  48,
                  18,
                  _pageController,
                  0,
                  Duration(milliseconds: 500)), //fast-food button
              SizedBox()),
          //child
        ],
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 2.0,
        onPressed: () {},
        child: const Icon(Icons.quick_contacts_mail_rounded),
        mini: true,
      ),
    ));
  }

  //Creo i bottoni principali con un po' di customizzazione disponibile.
  ElevatedButton createButton(
      AssetImage buttonIcon,
      double size,
      double innerPadding,
      PageController pageController,
      int page,
      Duration animationTime) {
    return ElevatedButton(
      onPressed: () {
        if (_pageController.hasClients) {
          _pageController.animateToPage(page,
              duration: animationTime, curve: Curves.easeInOutCirc);
        }
      },
      child: Image(
        image: buttonIcon,
        width: size,
        height: size,
      ),
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(
          side: BorderSide(
              style: BorderStyle.solid, color: Colors.white, width: 2.0),
        ),
        padding: EdgeInsets.all(innerPadding),
        elevation: 4.0,
      ),
    );
  }

  //metodo per la creazione dei container a pagina 2 (Sezione lettini).
  AnimatedContainer createCustomSelectContainer(
      Icon icon, String text, double arrowPadding) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 0),
      curve: Curves.easeInOut,
      color: Colors.white,
      padding: EdgeInsets.symmetric(
          vertical: 20, horizontal: MediaQuery.of(context).size.width / 25),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        const Image(
          image: AssetImage("lib/assets/green_circle.png"),
          width: 24,
          height: 24,
        ),
        Padding(
            padding:
                EdgeInsets.only(left: MediaQuery.of(context).size.width / 6)),
        icon,
        Padding(
            padding:
                EdgeInsets.only(left: MediaQuery.of(context).size.width / 25)),
        Text(
          text,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontFamily: 'Raleway',
            fontWeight: FontWeight.normal,
            letterSpacing: 1,
            fontSize: 14,
          ),
        ),
        Padding(padding: EdgeInsets.only(left: arrowPadding)),
        Icon(Icons.arrow_forward_ios_rounded),
      ]),
    );
  }

  Container createPageContainer(
    Color gradientFrom,
    Color gradientTo,
    double firstPadding,
    double secondPadding,
    ElevatedButton button,
    Widget child,
  ) {
    return Container(
      constraints: BoxConstraints.expand(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(
          style: BorderStyle.solid,
        ),
        gradient: LinearGradient(
          colors: <Color>[gradientFrom, gradientTo],
          tileMode: TileMode.clamp,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        children: [
          Padding(padding: EdgeInsets.only(top: firstPadding)),
          button,
          Padding(padding: EdgeInsets.only(top: secondPadding)),
          child,
        ],
      ),
    );
  }
}
