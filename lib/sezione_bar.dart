import 'package:flutter/material.dart';
import 'package:fluttertest/list_item_handler.dart';
import 'widgets_builder.dart';

class MenuItem extends ListItem {
  MenuItem({isExpanded, this.nome = '\t', this.prezzo = 0, this.id = 42});

  final String nome;
  final double prezzo;
  final double id;
}

final List<MenuItem> _menuSection = <MenuItem>[
  MenuItem(nome: 'Menù'),
  MenuItem(nome: 'Ordina'),
];

final List<MenuItem> _menu = <MenuItem>[
  MenuItem(nome: 'Antipasti'),
  MenuItem(nome: 'Primi'),
  MenuItem(nome: 'Secondi'),
  MenuItem(nome: 'Contorni'),
  MenuItem(nome: 'Dolci'),
  MenuItem(nome: 'Bevande'),
  MenuItem(nome: 'Vini'),
  MenuItem(nome: 'Digestivi/Amari')
];

List<MenuItem> getMenu() {
  return _menu;
}

List<MenuItem> getMenuSection() {
  return _menuSection;
}

Container createSezioneBar(BuildContext context, PageController _pageController,
    Function(int, bool) callback) {
  return createPageContainer(
      context,
      const Color(0xff3eb489),
      createButton(_pageController, const AssetImage("lib/assets/bar_icon.png"),
          48, 18, 0, const Duration(milliseconds: 500)),
      FittedBox(
        fit: BoxFit.contain,
        child: Container(
          width: MediaQuery.of(context).size.width - 65,
          decoration: BoxDecoration(
            color: Colors.black,
            border: Border.all(
              width: 2,
              color: Colors.white,
            ),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Scrollbar(
<<<<<<< Updated upstream
            child: MediaQuery.removePadding(
              removeTop: true,
              context: context,
              child: ListView(
                shrinkWrap: true,
                children: <Widget>[
                  ExpansionPanelList(
                    expandedHeaderPadding:
                        const EdgeInsets.symmetric(vertical: 4, horizontal: 0),
                    expansionCallback: callback,
                    children: _menuSection.map((MenuItem? section) {
                      return ExpansionPanel(
                          canTapOnHeader: true,
                          headerBuilder:
                              (BuildContext context, bool isExpanded) {
                            return Row(
                              children: <Widget>[
                                Padding(
                                    padding: EdgeInsets.only(
                                        left:
                                            MediaQuery.of(context).size.width /
                                                20)),
                                createText(section!.nome,
                                    alignment: TextAlign.left,
                                    weight: FontWeight.normal,
                                    letterSpacing: 1.2,
                                    size: 20,
                                    color: Colors.black),
                              ],
                            );
                          },
                          isExpanded: section!.isExpanded,
                          body: Container(
                              child: ExpansionPanelList(
                            expandedHeaderPadding: const EdgeInsets.symmetric(
                                vertical: 4, horizontal: 0),
                            expansionCallback: callback,
                            children: _menu.map((MenuItem? item) {
                              return ExpansionPanel(
                                  canTapOnHeader: true,
                                  headerBuilder:
                                      (BuildContext context, bool isExpanded) {
                                    return Container(
                                      child: createText(item!.nome),
                                    );
                                  },
                                  body: Text('ciao'));
                            }).toList(),
                          )));
                    }).toList(),
                  ),
                ],
              ),
=======
            child: ListView(
              shrinkWrap: true,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [],
                ),
              ],
>>>>>>> Stashed changes
            ),
          ),
        ),
      ),
      firstPadding: MediaQuery.of(context).size.height / 15,
<<<<<<< Updated upstream
      secondPadding: MediaQuery.of(context).size.height / 15,
=======
      secondPadding: MediaQuery.of(context).size.height / 5,
>>>>>>> Stashed changes
      gradientFrom: Color(0xffffb643),
      gradientTo: Color(0xff33a284));
}
