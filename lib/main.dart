//import 'dart:html';

import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: CasottoHome(),
    ));

class CasottoHome extends StatefulWidget {
  _CasottoState createState() => _CasottoState();
}

class _CasottoState extends State<CasottoHome> {
  final _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: ElevatedButton(
          onPressed: () {},
          child: const Icon(Icons.category_rounded),
        ),
        elevation: 1,
        titleSpacing: 2.0,
        actions: <Widget>[
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

              /*image: DecorationImage(
                  opacity: 0.3,
                  image: AssetImage('lib/assets/oceano2_1.jpg'),
                  fit: BoxFit.cover,
                  //colorFilter:
                  //ColorFilter.mode(Colors.blueAccent, BlendMode.overlay),
                ),*/
              gradient: LinearGradient(
                colors: <Color>[Color(0xff161055), Color(0xff161055)],
                tileMode: TileMode.clamp,
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.end,
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
                            duration: const Duration(milliseconds: 400),
                            curve: Curves.easeInOutCirc,
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
                    Padding(padding: EdgeInsets.all(10)),
                    ElevatedButton(
                      onPressed: () {
                        if (_pageController.hasClients) {
                          _pageController.animateToPage(
                            2,
                            duration: const Duration(milliseconds: 400),
                            curve: Curves.easeInOut,
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
                  padding: EdgeInsets.all(15),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        if (_pageController.hasClients) {
                          _pageController.animateToPage(
                            3,
                            duration: const Duration(milliseconds: 400),
                            curve: Curves.easeInOut,
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
                    Padding(padding: EdgeInsets.all(10)),
                    ElevatedButton(
                      onPressed: () {
                        if (_pageController.hasClients) {
                          _pageController.animateToPage(
                            4,
                            duration: const Duration(milliseconds: 400),
                            curve: Curves.easeInOut,
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
              gradient: LinearGradient(
                colors: <Color>[Color(0xffffb643), Color(0xffe6ab10)],
                tileMode: TileMode.clamp,
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: SizedBox(
              width: MediaQuery.of(context).size.width * (3 / 4),
              height: MediaQuery.of(context).size.height * (2 / 3),
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      padding: MediaQuery.of(context).orientation ==
                              Orientation.portrait
                          ? EdgeInsets.all(8.0)
                          : EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.blue, //Color(0xffe69b10),
                              offset: Offset.zero,
                              spreadRadius: 1.0,
                              blurRadius: 5.0,
                            ),
                          ],
                          color: Colors.transparent,
                          shape: BoxShape.circle,
                          border: Border.all(
                              color: Colors.white,
                              width: MediaQuery.of(context).orientation ==
                                      Orientation.portrait
                                  ? 3.0
                                  : 6.0)),
                      child: Image(
                        alignment: Alignment.topCenter,
                        image: AssetImage('lib/assets/umbrella.png'),
                        width: MediaQuery.of(context).orientation ==
                                Orientation.portrait
                            ? 64
                            : 128,
                        height: MediaQuery.of(context).orientation ==
                                Orientation.portrait
                            ? 64
                            : 128,
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.only(
                            top: MediaQuery.of(context).orientation ==
                                    Orientation.portrait
                                ? 30
                                : 60)),
                    Text(
                      'Prenota ora il tuo ombrellone',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: MediaQuery.of(context).orientation ==
                                Orientation.portrait
                            ? 24
                            : 48,
                        fontFamily: "Raleway",
                        letterSpacing: 1.2,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        'PRENOTA',
                        style: TextStyle(
                          letterSpacing: 1.2,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Raleway",
                          fontSize: MediaQuery.of(context).orientation ==
                                  Orientation.portrait
                              ? 20
                              : 30,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                          padding: MediaQuery.of(context).orientation ==
                                  Orientation.portrait
                              ? EdgeInsets.all(20)
                              : EdgeInsets.all(30),
                          elevation: 3.0),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                    color: Color(0xffe69b10),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.blue,
                        offset: Offset.fromDirection(1, 5.0),
                        blurRadius: 10.0,
                      ),
                    ]),
              ),
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
            decoration: const BoxDecoration(
                /*image: DecorationImage(
                opacity: 0.3,
                image: AssetImage('lib/assets/oceano2_5.jpg'),
                fit: BoxFit.cover,
              ),*/
                ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 2.0,
        onPressed: () {},
        child: Icon(Icons.chat),
      ),
    );
  }
}
