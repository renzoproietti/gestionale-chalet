import 'package:Chalet/model/items.dart';
import 'package:flutter/material.dart';
import 'package:Chalet/view/sections/landing_section.dart';
import 'package:Chalet/authentication/services/auth.dart';
import 'package:Chalet/view/sections/sezione_bar.dart';
import 'package:Chalet/view/sections/sezione_lettini.dart';
import 'package:Chalet/view/sections/sezione_ombrelloni.dart';
import 'package:Chalet/view/sections/sezione_eventi.dart';
import 'package:Chalet/view/core/widgets_builder.dart';
import 'package:Chalet/controller/cart_handler.dart';
import 'sections/sezione_profilo.dart';
import '../authentication/services/auth.dart';
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
  final AuthService _auth = AuthService();

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
              Navigator.of(context).push(createRoute(const Profile()));
            },
          ),
          actions: <Widget>[
            IconButton(
              onPressed: () async {
                await _auth.signOut();
              },
              icon: const Icon(Icons.person),
              tooltip: 'Logout',
            ),
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
          SezioneOmbrelloni(
              pageController: _pageController,
              callback: (int index, bool isExpanded) => setState(() {
                    getFile()[index].isExpanded = !getFile()[index].isExpanded!;
                  })),
          SezioneLettini(
              pageController: _pageController,
              callback: (int index, bool isExpanded) => setState(() {
                    getLettini()[index].isExpanded =
                        !getLettini()[index].isExpanded!;
                  })),
          SezioneBar(
              pageController: _pageController,
              callback: (int index, bool isExpanded) => setState(() {
                    getMenu()[index].isExpanded = !getMenu()[index].isExpanded!;
                  })), //3rd page
          //4th page
          createSezioneEventi(context, _pageController) //5th page
        ],
      ),
      floatingActionButton: FloatingActionButton(
          elevation: 0,
          onPressed: () {
            initCart(context);
            showDialog(context: context, builder: (context) => Cart(_cartKey));
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
