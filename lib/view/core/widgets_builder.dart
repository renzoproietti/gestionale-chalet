import 'package:Chalet/model/items.dart';
import 'package:flutter/material.dart';
import '../../controller/list_item_handler.dart';

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
  EdgeInsets? _innerPadding;

  CustomHomeButton({
    required Widget child,
    required EdgeInsets innerPadding,
    Function()? onPressed,
    Key? key,
    PageController? pageController,
    int? page,
    Duration? animationTime,
  }) : super(child: child, key: key) {
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

class ListContainer extends StatefulWidget with ChangeNotifier {
  @override
  _ListContainerState createState() => _ListContainerState();

  late final ListItem item;
  void Function()? onRemoveTap;
  void Function()? onAddTap;

  ListContainer({required this.item, this.onRemoveTap, this.onAddTap});
}

class _ListContainerState extends State<ListContainer> {
  @override
  Widget build(BuildContext context) {
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
            child: createText(widget.item.header,
                color: Colors.black, size: 14, alignment: TextAlign.left),
            width: MediaQuery.of(context).size.width / 2.75,
          ),
          SizedBox(
            child: createText(widget.item.prezzo.toString() + '0€',
                color: Colors.black, size: 16, alignment: TextAlign.left),
            width: MediaQuery.of(context).size.width / 5,
          ),
          Row(
            children: [
              InkWell(
                child: const Icon(
                  Icons.remove,
                  color: Colors.blue,
                  size: 22,
                ),
                onTap: widget.onRemoveTap,
              ),
              createText(widget.item.number.toString(),
                  color: Colors.black, size: 18),
              InkWell(
                  child: const Icon(
                    Icons.add,
                    color: Colors.blue,
                    size: 22,
                  ),
                  onTap: widget.onAddTap),
            ],
          )
        ],
      ),
    );
  }
}

class ListContainerOmbrelloni extends StatefulWidget with ChangeNotifier {
  @override
  _ListContainerOmbrelloniState createState() =>
      _ListContainerOmbrelloniState();

  late final ListItem item;
  late final MultipleCounter counter;
  final void Function() onPrenotaPressed;

  ListContainerOmbrelloni(
      {required this.item,
      required this.counter,
      required this.onPrenotaPressed});
}

class _ListContainerOmbrelloniState extends State<ListContainerOmbrelloni> {
  @override
  Widget build(BuildContext context) {
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
            child: createText(widget.item.header,
                color: Colors.black, size: 16, alignment: TextAlign.left),
            width: MediaQuery.of(context).size.width / 4,
          ),
          SizedBox(
            child: createText(widget.item.prezzo.toString() + '0€',
                color: Colors.black, size: 16, alignment: TextAlign.left),
            width: MediaQuery.of(context).size.width / 5,
          ),
          Row(
            children: [
              TextButton(
                onPressed: widget.onPrenotaPressed,
                child:
                    createText(widget.item.body!, color: Colors.blue, size: 18),
              ),
            ],
          )
        ],
      ),
    );
  }
}

const Image greenLight = Image(
  image: AssetImage("lib/assets/images/green_circle.png"),
  width: 24,
  height: 24,
);
const Image redLight = Image(
  image: AssetImage("lib/assets/images/red_circle.png"),
  width: 24,
  height: 24,
);
