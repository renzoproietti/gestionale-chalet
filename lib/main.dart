import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertest/internationalization.dart';
import 'home_page.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();

  runApp(Chalet());
}

//Probabilmente si potrebbero gestire le varie istanze
//del locale con un notifier, invece di aggiornarle manualmente? (@filippo)
class Chalet extends StatefulWidget {

  Chalet({Key? key}) : super(key: key);




  @override
  _ChaletState createState() => _ChaletState();

  static _ChaletState? of(BuildContext context) =>
      context.findAncestorStateOfType<_ChaletState>();

  static void setLocale(BuildContext context, Locale newLocale) async {
    _ChaletState? state = of(context);
    state!.changeLanguage(newLocale);
  }

  static Locale getLocale(BuildContext context) {
    return of(context)!._locale;
  }
}

class _ChaletState extends State<Chalet> {
  Locale _locale = getSupportedLocales().first;

  final Future<FirebaseApp> fbApp = Firebase.initializeApp();




  void changeLanguage(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    //Chalet chalet = Chalet();
    return MaterialApp(
        locale: _locale,
        supportedLocales: getSupportedLocales(),
        localizationsDelegates: getDelegates(),
        localeResolutionCallback: localeResolutionCallback,
      home: FutureBuilder(

        future: fbApp,
        builder: (context, snapshot){
          if (snapshot.hasError) {
            print('E presente un errore! ${snapshot.error.toString()}');
            return Text('Something went wrong!');
          }else if (snapshot.hasData){
            return HomePage();

          }
          else {
            return Center(
            child: CircularProgressIndicator(),
            );
          }


      },
      )






    );
  }
}
