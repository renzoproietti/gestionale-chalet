import 'package:flutter/material.dart';
import 'internationalization.dart';
import 'main.dart';
import 'sign_in.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'widgets_builder.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _StateProfile createState() => _StateProfile();
}

class _StateProfile extends State<Profile> {
  Locale _locale = getSupportedLocales().first;

  void updateLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    _locale = Chalet.getLocale(context);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: createText(AppLocalizations.of(context)!.profilo)),
      backgroundColor: const Color(0xff161055),
      body: ListView(
        shrinkWrap: false,
        addAutomaticKeepAlives: false,
        cacheExtent: 100.0,
        children: [
          InkWell(
            onTap: () => showDialog(
              context: context,
              builder: (context) => Container(
                child: AlertDialog(
                  contentPadding: EdgeInsets.fromLTRB(20, 20, 20, 80),
                  elevation: 24.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  content: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      createText(
                        "Seleziona lingua \n",
                        color: Colors.black,
                        size: 22,
                      ),
                      createText(
                        "Select language \n \n \n",
                        color: Colors.black,
                        size: 19,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ElevatedButton(
                              onPressed: () {
                                updateLocale(Locale('en', 'UK'));
                                Chalet.setLocale(context, _locale);
                                Navigator.of(context).pop();
                              },
                              child: const Image(
                                image:
                                    AssetImage("lib/assets/united-kingdom.png"),
                                width: 80,
                                height: 80,
                              ),
                              style: ElevatedButton.styleFrom(
                                  shape: const CircleBorder(
                                      side: BorderSide(color: Colors.white)))),
                          ElevatedButton(
                              onPressed: () {
                                updateLocale(Locale('it', 'IT'));
                                Chalet.setLocale(context, _locale);
                                Navigator.of(context).pop();
                              },
                              child: const Image(
                                image: AssetImage("lib/assets/italy.png"),
                                width: 80,
                                height: 80,
                              ),
                              style: ElevatedButton.styleFrom(
                                  shape: const CircleBorder(
                                      side: BorderSide(color: Colors.white))))
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            child: Container(
              alignment: Alignment.centerLeft,
              height: 60,
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              child: Row(
                children: [
                  Padding(padding: EdgeInsets.only(left: 20.0)),
                  Image(
                    image: pickFromLocale(_locale.languageCode),
                    width: 30,
                    height: 30,
                  ),
                  Padding(padding: EdgeInsets.only(left: 20.0)),
                  createText(AppLocalizations.of(context)!.language,
                      color: Colors.black, size: 20),
                ],
              ),
            ),
          ),
          Padding(padding: EdgeInsets.only(top: 25)),
          Container(
            alignment: Alignment.centerLeft,
            height: 60,
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            child: Row(children: [
              Padding(padding: EdgeInsets.only(left: 20.0)),
              const Icon(
                Icons.location_on,
                size: 30,
              ),
              Padding(padding: EdgeInsets.only(left: 20.0)),
              createText(AppLocalizations.of(context)!.chaletDesc,
                  color: Colors.black, size: 20),
            ]),
          ),
          Padding(padding: EdgeInsets.only(top: 5)),
          InkWell(
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (buildContext) => SignInDemo())),
            child: Container(
              alignment: Alignment.centerLeft,
              height: 60,
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              child: Row(children: [
                Padding(padding: EdgeInsets.only(left: 20.0)),
                const Icon(
                  Icons.account_circle_outlined,
                  size: 30,
                ),
                Padding(padding: EdgeInsets.only(left: 20.0)),
                createText(AppLocalizations.of(context)!.signin,
                    color: Colors.black, size: 20),
              ]),
            ),
          ),
          Padding(padding: EdgeInsets.only(top: 5)),
          InkWell(
            onTap: () => showDialog(
              context: context,
              builder: (context) => AlertDialog(
                contentPadding: EdgeInsets.fromLTRB(20, 20, 20, 100),
                elevation: 24.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
              ),
            ),
            child: Container(
              alignment: Alignment.centerLeft,
              height: 60,
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              child: Row(children: [
                Padding(padding: EdgeInsets.only(left: 20.0)),
                Image(
                  image: AssetImage("lib/assets/megaphone.png"),
                  width: 30,
                  height: 30,
                ),
                Padding(padding: EdgeInsets.only(left: 20.0)),
                createText(AppLocalizations.of(context)!.avvisi,
                    color: Colors.black, size: 20),
              ]),
            ),
          ),
          Padding(padding: EdgeInsets.only(top: 5)),
        ],
      ),
    );
  }
}

AssetImage pickFromLocale(String language) {
  switch (language) {
    case 'it':
      return AssetImage("lib/assets/italy.png");
    case 'en':
      return AssetImage("lib/assets/united-kingdom.png");
  }
  throw Exception("Locale not found");
}
