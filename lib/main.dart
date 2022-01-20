import 'package:flutter/material.dart';
import 'package:fluttertest/home.dart';
import 'package:fluttertest/sezionebar.dart';
import 'package:fluttertest/sezionelettini.dart';
import 'package:fluttertest/sezioneombrelloni.dart';
import 'package:fluttertest/sezioneeventi.dart';
import 'package:fluttertest/widgetsbuilder.dart';

void main() => runApp(MaterialApp(
      home: CasottoHome(),
    ));

class CasottoHome extends StatefulWidget {
  @override
  _CasottoState createState() => _CasottoState();
}

class _CasottoState extends State<CasottoHome> {
  final _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
          elevation: 1,
          leading: const Icon(Icons.portrait_outlined),
          actions: const <Widget>[Icon(Icons.more_vert_outlined)],
          centerTitle: true,
          title: const Text('CASOTTO',
              style: TextStyle(
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2))),
      body: PageView(
        physics: const AlwaysScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        controller: _pageController,
        children: <Widget>[
          createHomeScreen(context, _pageController), //1st page
          createSezioneOmbrelloni(context, _pageController, //2nd page
              (int index, bool isExpanded) {
            setState(() {
              List<OmbrelloneItem> _ombrelloni = getOmbrelloni();
              _ombrelloni[index].isExpanded = !_ombrelloni[index].isExpanded;
            });
          }),
          createSezioneLettini(context, _pageController,
              (int index, bool isExpanded) {
            setState(() {
              List<LettinoItem> _lettini = getLettini();
              _lettini[index].isExpanded = !_lettini[index].isExpanded;
            });
          }), //3rd page
          createSezioneBar(context, _pageController), //4th page
          createSezioneEventi(context, _pageController) //5th page
        ],
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: 'cartpopup',
        elevation: 2.0,
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) => showCart(context, Colors.white70));
        },
        child: const Icon(Icons.shopping_cart_outlined),
        mini: true,
      ),
    ));
  }
}
