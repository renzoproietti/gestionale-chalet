import 'package:flutter/material.dart';
import 'package:fluttertest/listitemhandler.dart';

/**File utility per la creazione dell'interfaccia base.
Tutti i metodi riguardanti operazioni che vengono 
effettuate più volte vanno inseriti qui.*/

///Crea bottone di default con un'icona e altri parametri esposti.
///Il bottone è collegato ad un _pageController e può o meno
///effettuare una transizione ad una pagina se desiderato.
ElevatedButton createButton(
    PageController _pageController,
    AssetImage buttonIcon,
    double size,
    double innerPadding,
    int page,
    Duration animationTime) {
  return ElevatedButton(
    onPressed: () {
      if (_pageController.hasClients) {
        _pageController.animateToPage(page,
            duration: animationTime, curve: Curves.linearToEaseOut);
      }
    },
    child: Image(
      image: buttonIcon,
      width: size,
      height: size,
    ),
    style: ElevatedButton.styleFrom(
      primary: Colors.white10,
      shape: const CircleBorder(
        side: BorderSide(
            style: BorderStyle.solid, color: Colors.white, width: 2.0),
      ),
      padding: EdgeInsets.all(innerPadding),
      elevation: 4.0,
    ),
  );
}

///metodo per la creazione dei container a pagina 2 (Sezione lettini).
AnimatedContainer createCustomSelectContainer(
    BuildContext context, Icon icon, String text, double arrowPadding,
    [double firstPadding = 0,
    double secondPadding = 0,
    Image image = empty_image]) {
  return AnimatedContainer(
    duration: const Duration(milliseconds: 0),
    curve: Curves.easeInOut,
    color: Colors.white,
    padding: EdgeInsets.symmetric(
        vertical: 20, horizontal: MediaQuery.of(context).size.width / 25),
    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      image,
      Padding(padding: EdgeInsets.only(left: firstPadding)),
      icon,
      Padding(padding: EdgeInsets.only(left: secondPadding)),
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
      const Icon(Icons.arrow_forward_ios_rounded),
    ]),
  );
}

///crea container che occupa tutta la pagina visibile nel contesto.
Container createPageContainer(
  BuildContext context,
  Color background,
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
      color: background,
      border: Border.all(
        style: BorderStyle.solid,
      ),
      shape: BoxShape.rectangle,
    ),
    child: Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Padding(padding: EdgeInsets.only(top: firstPadding)),
        button,
        Padding(padding: EdgeInsets.only(top: secondPadding)),
        child,
      ],
    ),
  );
}

///Crea testo semplice con font Raleway e alcuni parametri esposti.
Text createText(String text, TextAlign alignment, FontWeight weight,
    double spacing, double size) {
  return Text(
    text,
    textAlign: alignment,
    style: TextStyle(
      fontFamily: 'Raleway',
      fontWeight: weight,
      fontSize: size,
    ),
  );
}

///Mostra il carrello come dialog.
///Hero permette la transizione da floating button a un altro widget.(guarda main per tag).
Hero showCart(BuildContext context, Color currentColor) {
  return Hero(
      tag: 'cartpopup',
      child: Dialog(
        insetAnimationCurve: Curves.easeOut,
        insetAnimationDuration: Duration(milliseconds: 300),
        backgroundColor: Colors.white70,
        child: Container(
            decoration: BoxDecoration(
              color: currentColor,
              shape: BoxShape.rectangle,
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(15),
            ),
            alignment: Alignment.center,
            //color: Colors.white10,
            width: MediaQuery.of(context).size.width / 3,
            height: MediaQuery.of(context).size.height / 3,
            child: Column(
              children: [
                createText(
                    'Carrello', TextAlign.center, FontWeight.w400, 1.2, 18),
              ],
            )),
      ));
}

///Crea lista espandibile, con items personalizzati.
///Gli items devono estendere la classe ListItem.
///E' possibile definire dei valori personalizzati se non si dispone
///di un ListItem, anche se il metodo è ottimizzato per ListItems.
Container customScrollableListView(
    BuildContext context,
    PageController _pageController,
    Function(int, bool)? callback,
    AssetImage assetImage,
    Duration duration,
    List<ListItem> _items,
    {double width = 0,
    double height = 0,
    double firstPaddingColumn = 0,
    double secondPaddingColumn = 0,
    double firstPaddingRow = 0,
    double secondPaddingRow = 0,
    double firstPaddingBodyRow = 0,
    double secondPaddingBodyRow = 0,
    double thirdPaddingBodyRow = 0,
    double plusMinusIconsSizes = 0,
    Image circle = empty_image,
    Icon itemIcon = empty_icon,
    Icon cartIcon = empty_icon,
    Icon plusIcon = empty_icon,
    Icon minusIcon = empty_icon,
    Color background = Colors.white,
    String header = '\t',
    String body = '\t',
    String info = '\t',
    bool isExpanded = false}) {
  return createPageContainer(
    context,
    background,
    firstPaddingColumn != 0
        ? firstPaddingColumn
        : MediaQuery.of(context).size.height / 15,
    secondPaddingColumn != 0
        ? secondPaddingColumn
        : MediaQuery.of(context).size.height / 15,
    createButton(
      _pageController,
      assetImage,
      48,
      18,
      0,
      duration,
    ),
    Container(
      decoration: BoxDecoration(
        color: const Color(0xffe6ab10),
        border: Border.all(
          width: 2,
          color: Colors.white,
        ),
        borderRadius: BorderRadius.circular(5),
      ),
      width: width,
      height: height,
      child: Scrollbar(
        child: Center(
          child: ListView(
            shrinkWrap: false,
            children: <Widget>[
              ExpansionPanelList(
                expandedHeaderPadding:
                    EdgeInsets.symmetric(vertical: 18, horizontal: 0),
                expansionCallback: callback,
                children: _items.map((ListItem? item) {
                  return ExpansionPanel(
                    canTapOnHeader: true,
                    headerBuilder: (BuildContext context, bool isExpanded) {
                      return (Container(
                        padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width / 25),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            circle,
                            Padding(
                                padding: EdgeInsets.only(
                                    left: firstPaddingRow != 0
                                        ? firstPaddingRow
                                        : MediaQuery.of(context).size.width /
                                            9)),
                            item != null ? item.icon : itemIcon,
                            Text(
                              item != null ? item.header : header,
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
                                    left: secondPaddingRow != 0
                                        ? secondPaddingRow
                                        : MediaQuery.of(context).size.width /
                                            21)),
                            createText(
                              item != null ? item.infos : info,
                              TextAlign.center,
                              FontWeight.normal,
                              1,
                              14,
                            ),
                            Padding(
                                padding: EdgeInsets.only(
                                    left: secondPaddingRow != 0
                                        ? secondPaddingRow
                                        : MediaQuery.of(context).size.width /
                                            11)),
                          ],
                        ),
                      ));
                    },
                    isExpanded: item != null ? item.isExpanded : isExpanded,
                    body: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          IconButton(
                            iconSize: plusMinusIconsSizes,
                            icon: minusIcon,
                            onPressed: () {},
                          ),
                          Padding(
                            padding:
                                EdgeInsets.only(right: firstPaddingBodyRow),
                          ),
                          Flexible(
                            child: TextButton(
                              onPressed: () {},
                              child: createText(
                                item != null ? item.body : body,
                                TextAlign.center,
                                FontWeight.w700,
                                1,
                                22,
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsets.only(right: firstPaddingBodyRow),
                          ),
                          IconButton(
                            iconSize: plusMinusIconsSizes,
                            icon: plusIcon,
                            onPressed: () {},
                          ),
                          Padding(
                            padding:
                                EdgeInsets.only(right: secondPaddingBodyRow),
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            child: const Icon(Icons.add_shopping_cart_rounded),
                            style: ElevatedButton.styleFrom(
                                shape: const CircleBorder()),
                          ),
                        ]),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
