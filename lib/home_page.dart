import 'package:flutter/material.dart';
import 'package:fluttertest/landing_section.dart';
import 'package:fluttertest/sezione_bar.dart';
import 'package:fluttertest/sezione_lettini.dart';
import 'package:fluttertest/sezione_ombrelloni.dart';
import 'package:fluttertest/sezione_eventi.dart';
import 'package:fluttertest/widgets_builder.dart';
import 'package:fluttertest/cart_handler.dart';
import 'list_item_handler.dart';
import 'sezione_profilo.dart';
import 'package:url_launcher/url_launcher.dart';

///Classe responsabile per la home page in generale,
///definisce ciò che si vede scrollando.
///E' composta da: sezione landing, sezione
///ombrelloni, sezione lettini, sezione bar e sezione eventi.
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _pageController = PageController(initialPage: 0);
  final _cartKey = GlobalKey();

  @override
  void initState() {
    super.initState();
  }

  List<PopupMenuEntry> menu = [
    PopupMenuItem(
        child: createText('Impostazioni', color: Colors.black, size: 18)),
    PopupMenuItem(
        child: createText('Offrici un caffè', color: Colors.black, size: 18),
        onTap: () => _launchURL(
            "https://github.com/filippofracascia/gestionale-chalet")),
    PopupMenuItem(
        child: createText('Informazioni legali', color: Colors.black, size: 18))
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
          toolbarHeight: 70,
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          leading: IconButton(
            icon: const Icon(
              Icons.table_rows_rounded,
              size: 32,
            ),
            onPressed: () {
              Navigator.of(context).push(createRoute(Profile()));
            },
          ),
          actions: <Widget>[
            InkWell(
              onTap: () => showMenu(
                  context: context,
                  position: RelativeRect.fromLTRB(
                      MediaQuery.of(context).size.width, 0, 0, 0),
                  items: menu),
              child: const Icon(
                Icons.more_vert_outlined,
                size: 32,
              ),
            )
          ],
          centerTitle: true,
          title: const Text(
            'Chalet',
            style: TextStyle(
                fontFamily: 'DancingScript',
                fontSize: 40,
                fontWeight: FontWeight.w500),
          )),
      body: PageView(
        physics: const AlwaysScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        controller: _pageController,
        padEnds: false,
        children: <Widget>[
          createHomeScreen(context, _pageController), //1st page
          createSezioneOmbrelloni(context, _pageController, //2nd page
              (int index, bool isExpanded) {
            setState(() {
              getFile()[index].isExpanded = !getFile()[index].isExpanded;
            });
          }),
          createSezioneLettini(context, _pageController,
              (int index, bool isExpanded) {
            setState(() {
              getLettini()[index].isExpanded = !getLettini()[index].isExpanded;
            });
          }), //3rd page
          createSezioneBar(context, _pageController,
              (int index, bool isExpanded) {
            setState(() {
              getMenu()[index].isExpanded = !getMenu()[index].isExpanded;
            });
          }), //4th page
          createSezioneEventi(context, _pageController) //5th page
        ],
      ),
      floatingActionButton: FloatingActionButton(
          elevation: 0,
          onPressed: () {
            initCart(context);
            showDialog(
                context: context, builder: (context) => CartPopup(_cartKey));
          },
          child: const Icon(Icons.shopping_cart_outlined),
          backgroundColor: Colors.black26,
          foregroundColor: Colors.white,
          mini: false,
          shape: const CircleBorder(side: BorderSide(color: Colors.white))),
    );
  }
}

void _launchURL(String url) async {
  if (!await launch(url)) throw 'Could not launch $url';
}
