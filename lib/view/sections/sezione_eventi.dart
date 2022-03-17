import 'package:Chalet/model/items.dart';
import 'package:flutter/material.dart';
import '../core/widgets_builder.dart';

class SezioneEventi extends StatefulWidget {
  @override
  _SezioneEventiState createState() => _SezioneEventiState();

  late final PageController pageController;

  SezioneEventi({required this.pageController});
}

class _SezioneEventiState extends State<SezioneEventi> {
  @override
  Widget build(BuildContext context) {
    return PageContainer(
        gradients: const <Color>[Color(0xff33a284), Color(0xff1a5643)],
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height / 15)),
          CustomHomeButton(
            pageController: widget.pageController,
            child: const Image(
                image: AssetImage("lib/assets/images/event_icon.png"),
                width: 48,
                height: 48),
            innerPadding: EdgeInsets.all(18),
            page: 0,
            animationTime: Duration(milliseconds: 600),
          ),
          Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height / 15)),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                width: 2,
                color: Colors.white,
              ),
              borderRadius: BorderRadius.circular(5),
            ),
            width: MediaQuery.of(context).size.width - 65,
            height: MediaQuery.of(context).size.height / 2,
            child: MediaQuery.removePadding(
              removeTop: true,
              removeBottom: true,
              context: context,
              child: Scrollbar(
                child: ListView(
                  shrinkWrap: false,
                  children: getEventi()
                      .map((evento) => Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 3, horizontal: 6),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                children: [
                                  createText(evento.header,
                                      color: Colors.black,
                                      size: 16,
                                      weight: FontWeight.bold),
                                ],
                              ),
                              const Padding(
                                padding: EdgeInsets.only(top: 5),
                              ),
                              const Divider(
                                height: 4,
                                thickness: 2,
                                indent: 3,
                                endIndent: 3,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 3.5,
                                    child: createText(
                                        'Dal ' +
                                            evento.eventSpawnRange.start.day
                                                .toString() +
                                            ' ' +
                                            _monthPicker(evento
                                                .eventSpawnRange.start.month) +
                                            ' al ' +
                                            evento.eventSpawnRange.end.day
                                                .toString() +
                                            ' ' +
                                            _monthPicker(evento
                                                .eventSpawnRange.end.month),
                                        color: Colors.black,
                                        size: 14),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(left: 10),
                                  ),
                                  const Icon(
                                    Icons.people_rounded,
                                    color: Colors.greenAccent,
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(left: 5),
                                  ),
                                  createText(
                                      '0/' + evento.maxPartecipanti.toString(),
                                      color: Colors.black,
                                      size: 18),
                                  const Padding(
                                    padding: EdgeInsets.only(left: 10),
                                  ),
                                  TextButton(
                                      onPressed: () {},
                                      child: createText(
                                        'Partecipa',
                                        size: 16,
                                        color: Colors.blue,
                                      )),
                                ],
                              ),
                              const Divider(
                                height: 4,
                                thickness: 2,
                                indent: 3,
                                endIndent: 3,
                              ),
                            ],
                          )))
                      .toList(),
                ),
              ),
            ),
          ),
        ]));
  }
}

String _monthPicker(int month) {
  switch (month) {
    case 1:
      return "Gennaio";
    case 2:
      return "Febbraio";
    case 3:
      return "Marzo";
    case 4:
      return "Aprile";
    case 5:
      return "Maggio";
    case 6:
      return "Giugno";
    case 7:
      return "Luglio";
    case 8:
      return "Agosto";
    case 9:
      return "Settembre";
    case 10:
      return "Ottobre";
    case 11:
      return "Novembre";
    case 12:
      return "Dicembre";
    default:
      return "Gennaio";
  }
}
