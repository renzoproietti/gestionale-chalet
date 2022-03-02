import 'package:flutter/material.dart';
import 'list_item_handler.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:flutter_signin_button/flutter_signin_button.dart';

/**File utility per la creazione dell'interfaccia base.
Tutti i metodi riguardanti operazioni che vengono 
effettuate più volte vanno inseriti qui.*/

///Crea bottone di default con un'icona e altri parametri esposti.
///Il bottone è collegato ad un _pageController e può o meno
///effettuare una transition ad una pagina se desiderato.
class CustomHomeButton extends Container {
  PageController? _pageController;
  Function()? _onPressed;
  int? _page;
  Duration? _animationTime;
  double? _size;
  EdgeInsets? _innerPadding;

  CustomHomeButton(
      {required Widget? child,
      Function()? onPressed,
      Key? key,
      PageController? pageController,
      int? page,
      Duration? animationTime,
      required EdgeInsets? innerPadding})
      : super(child: child, key: key) {
    _pageController = pageController;
    _page = page;
    _animationTime = animationTime;
    _innerPadding = innerPadding;
    _onPressed = onPressed;
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: _onPressed ??
          () {
            if (_pageController!.hasClients) {
              _pageController!.animateToPage(_page!,
                  duration: _animationTime!, curve: Curves.linearToEaseOut);
            }
          },
      child: child,
      style: ElevatedButton.styleFrom(
        primary: Colors.white10,
        shape: const CircleBorder(
          side: BorderSide(
              style: BorderStyle.solid, color: Colors.white, width: 2.0),
        ),
        padding: _innerPadding!,
        elevation: 4.0,
      ),
    );
  }
}

///container che occupa tutta la pagina visibile nel contesto.
class PageContainer extends Container {
  List<Color>? _gradients;

  PageContainer(
      {Key? key, required Widget child, required List<Color> gradients})
      : super(key: key, child: child) {
    _gradients = gradients;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: child,
        padding: EdgeInsets.only(top: MediaQuery.of(context).size.height / 11),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: _gradients!,
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter),
        ));
  }
}

///Crea testo semplice con font Raleway e alcuni parametri esposti.
Text createText(String text,
    {TextAlign alignment = TextAlign.center,
    FontWeight weight = FontWeight.normal,
    double letterSpacing = 1.0,
    double size = 24,
    Color color = Colors.white}) {
  return Text(
    text,
    textAlign: alignment,
    style: TextStyle(
        fontFamily: 'Raleway',
        fontWeight: weight,
        fontSize: size,
        letterSpacing: letterSpacing,
        color: color),
  );
}

//Transizione dalla sezione home alla sezione profilo.
Route createRoute(Widget loginPage) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => loginPage,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(-1.0, 0.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}

Container listContainer(ListItem item, int counter, Function? onRemoveTap(),
    Function? onAddTap(), BuildContext context) {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
    decoration: const BoxDecoration(
        color: Colors.white,
        backgroundBlendMode: BlendMode.multiply,
        border: Border.symmetric(
            horizontal: BorderSide(color: Colors.black26, width: 0.3),
            vertical: BorderSide(color: Colors.black26, width: 0.3))),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          child: createText(item.header,
              color: Colors.black, size: 14, alignment: TextAlign.left),
          width: MediaQuery.of(context).size.width / 2.5,
        ),
        SizedBox(
          child: createText(item.prezzo.toString() + '0€',
              color: Colors.black, size: 14, alignment: TextAlign.left),
          width: MediaQuery.of(context).size.width / 5,
        ),
        Row(
          children: [
            InkWell(
              child: const Icon(
                Icons.remove,
                color: Colors.blue,
                size: 18,
              ),
              onTap: onRemoveTap,
            ),
            createText('$counter', color: Colors.black, size: 18),
            InkWell(
                child: const Icon(
                  Icons.add,
                  color: Colors.blue,
                  size: 18,
                ),
                onTap: onAddTap),
          ],
        )
      ],
    ),
  );
}

class LogInScreen extends StatefulWidget {
  Function? onGoogleTap;

  LogInScreen({Key? key, this.onGoogleTap}) : super(key: key);

  _LogInScreenState createState() => _LogInScreenState(onGoogleTap);
}

class _LogInScreenState extends State<StatefulWidget> {
  Function? onGoogleTap;

  _LogInScreenState(this.onGoogleTap);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        Padding(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).size.height / 7)),
        const Divider(
          height: 20,
          thickness: 2,
          indent: 50,
          endIndent: 50,
        ),
        Padding(padding: EdgeInsets.only(top: 15)),
        createText(AppLocalizations.of(context)!.nomeutente.toUpperCase(),
            size: 20),
        const Padding(padding: EdgeInsets.only(top: 10)),
        SizedBox(
          child: const TextField(
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(50.0))),
                filled: true,
                isDense: true,
                fillColor: Colors.white12),
            style: TextStyle(color: Colors.white),
          ),
          width: MediaQuery.of(context).size.width / 1.25,
        ),
        const Padding(padding: EdgeInsets.only(top: 20)),
        createText(AppLocalizations.of(context)!.password.toUpperCase(),
            size: 20),
        const Padding(padding: EdgeInsets.only(top: 10)),
        Container(
          child: const TextField(
            autocorrect: false,
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(50.0))),
                filled: true,
                isDense: true,
                fillColor: Colors.white12),
            style: TextStyle(color: Colors.white),
            obscureText: true,
          ),
          width: MediaQuery.of(context).size.width / 1.25,
        ),
        TextButton(
            onPressed: () {},
            child: createText(AppLocalizations.of(context)!.passdimenticata,
                size: 14, color: Colors.blueAccent)),
        const Divider(
          thickness: 2,
          indent: 50,
          endIndent: 50,
        ),
        const Padding(padding: EdgeInsets.only(top: 10)),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(1)),
                primary: Color(0xff4285F4),
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width / 4.9,
                    vertical: 10)),
            onPressed: () {},
            child: createText(AppLocalizations.of(context)!.accedi,
                size: 20, weight: FontWeight.bold)),
        const Padding(padding: EdgeInsets.only(top: 15)),
        createText('oppure', size: 14),
        const Padding(padding: EdgeInsets.only(top: 15)),
        SignInButton(
          Buttons.GoogleDark,
          onPressed: onGoogleTap!,
          text: AppLocalizations.of(context)!.accedicon + ' Google',
          padding: EdgeInsets.all(5),
        ),
        const Padding(padding: EdgeInsets.only(top: 10)),
        const Divider(
          thickness: 2,
          indent: 50,
          endIndent: 50,
        )
      ],
    );
  }
}

final Map<int, MultipleCounter> globalCounters = {};
