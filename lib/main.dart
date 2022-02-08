import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:fluttertest/home.dart';
import 'package:fluttertest/sezione_bar.dart';
import 'package:fluttertest/sezione_lettini.dart';
import 'package:fluttertest/sezione_ombrelloni.dart';
import 'package:fluttertest/sezione_eventi.dart';
import 'package:fluttertest/sign_in.dart';
import 'package:fluttertest/list_item_handler.dart';
import 'package:fluttertest/widgets_builder.dart';
import 'package:fluttertest/cart_handler.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

///Il main lancia CasottoHome, che altro non è che un
void main() => runApp(const Casotto());

class Casotto extends StatefulWidget {
  const Casotto({Key? key}) : super(key: key);

  @override
  _CasottoState createState() => _CasottoState();

  static _CasottoState? of(BuildContext context) =>
      context.findAncestorStateOfType<_CasottoState>();

  static void setLocale(BuildContext context, Locale newLocale) async {
    _CasottoState? state = context.findAncestorStateOfType<_CasottoState>();
    state!.changeLanguage(newLocale);
  }
}

class _CasottoState extends State<Casotto> {
  Locale _locale = Locale('it', 'IT');

  void changeLanguage(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      supportedLocales: const [
        Locale('it', 'IT'),
        Locale('en', 'UK'),
      ],
      locale: _locale,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      localeResolutionCallback: (locale, supportedLocales) {
        for (var supportedLocale in supportedLocales) {
          if (supportedLocale.languageCode == locale?.languageCode &&
              supportedLocale.countryCode == locale?.countryCode) {
            return supportedLocale;
          }
        }
        return supportedLocales.first;
      },
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _pageController = PageController(initialPage: 0);
  final _cartKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
          toolbarHeight: 70,
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          leading: IconButton(
            icon: const Icon(Icons.portrait_outlined),
            onPressed: () {
              Navigator.of(context).push(createRoute(SignInDemo()));
            },
          ),
          actions: const <Widget>[Icon(Icons.more_vert_outlined)],
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
              List<OmbrelloniItem> _ombrelloni = getOmbrelloni();
              _ombrelloni[index].isExpanded = !_ombrelloni[index].isExpanded;
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
          elevation: 1,
          onPressed: () {
            showDialog(
                context: context, builder: (context) => CartPopup(_cartKey));
          },
          child: const Icon(Icons.shopping_cart_outlined),
          backgroundColor: Colors.transparent,
          mini: false,
          shape: const CircleBorder(side: BorderSide(color: Colors.white))),
    );
  }
}
