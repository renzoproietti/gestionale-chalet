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
                    ElevatedButton(
                      onPressed: () {
                        if (_pageController.hasClients) {
                          _pageController.animateToPage(
                            1,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOutQuart,
                          );
                        }
                      },
                      child: const Image(
                        image: AssetImage('lib/assets/umbrella.png'),
                        width: 64,
                        height: 64,
                      ),
                      style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(
                          side: BorderSide(
                              style: BorderStyle.solid,
                              color: Colors.white,
                              width: 2.0),
                        ),
                        padding: const EdgeInsets.all(28),
                        elevation: 4.0,
                      ),
                    ),
                    Padding(
                        padding:
                            EdgeInsets.all(MediaQuery.of(context).size.width) /
                                30),
                    ElevatedButton(
                      onPressed: () {
                        if (_pageController.hasClients) {
                          _pageController.animateToPage(
                            2,
                            duration: const Duration(milliseconds: 400),
                            curve: Curves.easeInOutQuart,
                          );
                        }
                      },
                      child: const Image(
                        image: AssetImage('lib/assets/sunbed.png'),
                        width: 64,
                        height: 64,
                      ),
                      style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(
                          side: BorderSide(
                              style: BorderStyle.solid,
                              color: Colors.white,
                              width: 2.0),
                        ),
                        padding: const EdgeInsets.all(28),
                        elevation: 4.0,
                      ),
                    ),
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
                    ElevatedButton(
                      onPressed: () {
                        if (_pageController.hasClients) {
                          _pageController.animateToPage(
                            3,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeInOutQuart,
                          );
                        }
                      },
                      child: const Image(
                        image: AssetImage('lib/assets/fast-food.png'),
                        width: 64,
                        height: 64,
                      ),
                      style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(
                          side: BorderSide(
                              style: BorderStyle.solid,
                              color: Colors.white,
                              width: 2.0),
                        ),
                        padding: const EdgeInsets.all(28),
                        elevation: 4.0,
                      ),
                    ),
                    Padding(
                        padding:
                            EdgeInsets.all(MediaQuery.of(context).size.width) /
                                30),
                    ElevatedButton(
                      onPressed: () {
                        if (_pageController.hasClients) {
                          _pageController.animateToPage(
                            4,
                            duration: const Duration(milliseconds: 600),
                            curve: Curves.easeInOutQuart,
                          );
                        }
                      },
                      child: const Image(
                        image: AssetImage('lib/assets/party.png'),
                        width: 64,
                        height: 64,
                      ),
                      style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(
                          side: BorderSide(
                              style: BorderStyle.solid,
                              color: Colors.white,
                              width: 2.0),
                        ),
                        padding: const EdgeInsets.all(28),
                        elevation: 4.0,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            constraints: BoxConstraints.expand(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border.all(
                style: BorderStyle.solid,
              ),
              gradient: const LinearGradient(
                colors: <Color>[Color(0xffffb643), Color(0xffe6ab10)],
                tileMode: TileMode.clamp,
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height / 20)),
                ElevatedButton(
                  child: const Image(
                    image: AssetImage("lib/assets/umbrella.png"),
                    width: 64,
                    height: 64,
                  ),
                  onPressed: () {
                    if (_pageController.hasClients) {
                      _pageController.animateTo(
                        0,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOutQuart,
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(12),
                    elevation: 1,
                    shape: const CircleBorder(
                      side: BorderSide(
                          style: BorderStyle.solid,
                          color: Colors.white,
                          width: 2.0),
                    ),
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height / 20)),
                SizedBox(
                  child: Container(
                    decoration: const BoxDecoration(
                        color: Color(0xffe6ab10),
                        boxShadow: [
                          BoxShadow(
                              color: Color(0xff161055),
                              spreadRadius: 1.0,
                              blurRadius: 3.0)
                        ]),
                    width: MediaQuery.of(context).size.width - 20,
                    height: MediaQuery.of(context).size.height / 1.7,
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
                                            left: MediaQuery.of(context)
                                                    .size
                                                    .width /
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
                                                        9)),
                                            Text(
                                              item.fila,
                                              textAlign: TextAlign.center,
                                              style: const TextStyle(
                                                fontFamily: 'Raleway',
                                                fontWeight: FontWeight.normal,
                                                letterSpacing: 1,
                                                fontSize: 18,
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
              ],
            ),
          ),
          Container(
            constraints: BoxConstraints.expand(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height),
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: <Color>[Color(0xff161055), Color(0xff161055)],
                tileMode: TileMode.clamp,
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Column(
              children: [
                Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height / 40)),
                ElevatedButton(
                  child: const Icon(
                    Icons.arrow_circle_up_rounded,
                    size: 46,
                  ),
                  onPressed: () {
                    if (_pageController.hasClients) {
                      _pageController.animateTo(
                        0,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOutQuart,
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      elevation: 0,
                      primary: Colors.transparent,
                      shape: const CircleBorder(side: BorderSide.none)),
                ),
                Padding(
                    padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height) /
                        40),
                SizedBox(
                  width: MediaQuery.of(context).size.width * (3 / 4),
                  height: MediaQuery.of(context).size.height * (2 / 3),
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.lightBlue,
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 2),
                          ),
                          child: const Image(
                            alignment: Alignment.topCenter,
                            image: AssetImage('lib/assets/sunbed.png'),
                            width: 64,
                            height: 64,
                          ),
                        ),
                      ],
                    ),
                    decoration: BoxDecoration(
                        color: Color(0xffe69b10),
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xff160535),
                            offset: Offset.fromDirection(1, 5.0),
                            blurRadius: 5.0,
                          ),
                        ]),
                  ),
                ),
              ],
            ),
          ),
          Container(
            constraints: BoxConstraints.expand(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height),
            alignment: Alignment.center,
            decoration: const BoxDecoration(),
          ),
          Container(
            constraints: BoxConstraints.expand(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height),
            alignment: Alignment.center,
            decoration: const BoxDecoration(),
          ),
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
}
