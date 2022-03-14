import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:Chalet/authentication/services/auth.dart';
import 'package:Chalet/view/core/widgets_builder.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> with TickerProviderStateMixin {
  //LOGIN
  String nomeutente = "";
  String pswlogin = "";
  final AuthService _authlogin = AuthService();

  //REGISTER
  String nome = "";
  String cognome = "";
  String email = "";
  String password = "";
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  late TabController _tabController;

  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: <String>[
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );

  Future<void> _handleSignIn() async {
    try {
      await _googleSignIn.signIn();
    } catch (error) {
      print('$error');
    }
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBody: true,
      extendBodyBehindAppBar: true,
      backgroundColor: const Color(0xff161055),
      appBar: AppBar(
        title: createText(AppLocalizations.of(context)!.registrati +
            '/' +
            AppLocalizations.of(context)!.accedi),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        centerTitle: true,
        bottom: TabBar(
          labelPadding: EdgeInsets.only(bottom: 10),
          tabs: [
            createText(AppLocalizations.of(context)!.accedi),
            createText(AppLocalizations.of(context)!.registrati)
          ],
          controller: _tabController,
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height / 7)),
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
                child: TextFormField(
                  onChanged: (value) {
                    setState(() => nomeutente = value);
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(50.0))),
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
                child: TextFormField(
                  onChanged: (value) {
                    setState(() => pswlogin = value);
                  },
                  autocorrect: false,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(50.0))),
                      filled: true,
                      isDense: true,
                      fillColor: Colors.white12),
                  style: TextStyle(color: Colors.white),
                  obscureText: true,
                ),
                width: MediaQuery.of(context).size.width / 1.25,
              ),
              TextButton(
                  onPressed: () {
                    //EMAIL PASSWORD DIMENTICATA//
                  },
                  child: createText(
                      AppLocalizations.of(context)!.passdimenticata,
                      size: 14,
                      color: Colors.blue)),
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
                  onPressed: () async {
                    print(nomeutente);
                    print(pswlogin);
                  },
                  child: createText(AppLocalizations.of(context)!.accedi,
                      size: 20, weight: FontWeight.bold)),
              const Padding(padding: EdgeInsets.only(top: 15)),
              createText(AppLocalizations.of(context)!.oppure, size: 14),
              const Padding(padding: EdgeInsets.only(top: 15)),
              SignInButton(
                Buttons.GoogleDark,
                onPressed: () async {
                  _handleSignIn();
                },
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
          ),
          Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height / 7)),
                const Divider(
                  height: 20,
                  thickness: 2,
                  indent: 50,
                  endIndent: 50,
                ),
                Padding(padding: EdgeInsets.only(top: 15)),
                createText(AppLocalizations.of(context)!.nome.toUpperCase(),
                    size: 20),
                const Padding(padding: EdgeInsets.only(top: 10)),
                SizedBox(
                  child: TextFormField(
                    validator: (value) =>
                        value!.length < 1 ? 'Inserisci il tuo nome' : null,
                    onChanged: (value) {
                      setState(() => nome = value);
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(50.0))),
                        filled: true,
                        isDense: true,
                        fillColor: Colors.white12),
                    style: TextStyle(color: Colors.white),
                  ),
                  width: MediaQuery.of(context).size.width / 1.25,
                ),
                Padding(padding: EdgeInsets.only(top: 15)),
                createText(AppLocalizations.of(context)!.cognome.toUpperCase(),
                    size: 20),
                const Padding(padding: EdgeInsets.only(top: 10)),
                SizedBox(
                  child: TextFormField(
                    validator: (value) =>
                        value!.length < 1 ? 'Inserisci il tuo cognome' : null,
                    onChanged: (value) {
                      setState(() => cognome = value);
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(50.0))),
                        filled: true,
                        isDense: true,
                        fillColor: Colors.white12),
                    style: TextStyle(color: Colors.white),
                  ),
                  width: MediaQuery.of(context).size.width / 1.25,
                ),
                Padding(padding: EdgeInsets.only(top: 15)),
                createText(AppLocalizations.of(context)!.email.toUpperCase(),
                    size: 20),
                const Padding(padding: EdgeInsets.only(top: 10)),
                SizedBox(
                  child: TextFormField(
                    validator: (value) => value!.length < 1
                        ? 'Inserisci la tua pasword di 6 o piu caratteri'
                        : null,
                    onChanged: (value) {
                      setState(() => email = value);
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(50.0))),
                        filled: true,
                        isDense: true,
                        fillColor: Colors.white12),
                    style: TextStyle(color: Colors.white),
                  ),
                  width: MediaQuery.of(context).size.width / 1.25,
                ),
                Padding(padding: EdgeInsets.only(top: 15)),
                createText(AppLocalizations.of(context)!.password.toUpperCase(),
                    size: 20),
                const Padding(padding: EdgeInsets.only(top: 10)),
                SizedBox(
                  child: TextFormField(
                    validator: (value) => value!.length < 6
                        ? 'Inserisci la tua pasword di 6 o piu caratteri'
                        : null,
                    onChanged: (value) {
                      setState(() => password = value);
                    },
                    obscureText: true,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(50.0))),
                        filled: true,
                        isDense: true,
                        fillColor: Colors.white12),
                    style: TextStyle(color: Colors.white),
                  ),
                  width: MediaQuery.of(context).size.width / 1.25,
                ),
                Container(
                  padding:
                      EdgeInsets.only(bottom: 0, right: 0, top: 30, left: 0),
                  child: ElevatedButton(
                    child: Text(
                      'Registrati',
                    ),
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        print(nome);
                        print(cognome);
                        print(email);
                        print(password);
                      }
                      // _auth.signInAnon();
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}




























/*onPressed: () async{
dynamic result = _auth.signInAnon();
if(result == null){
print('errore nel signin');
}else {
print('Signed In');
print (result);
}*/




