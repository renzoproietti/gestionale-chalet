import 'package:Chalet/authentication/services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../view/core/widgets_builder.dart';

GoogleSignIn _googleSignIn = GoogleSignIn(
  // Optional clientId
  // clientId: '479882132969-9i9aqik3jfjd7qhci1nqf0bm2g71rm1u.apps.googleusercontent.com',
  scopes: <String>[
    'email',
    'https://www.googleapis.com/auth/contacts.readonly',
  ],
);

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> with TickerProviderStateMixin {
  //LOGIN
  String errorlogin = "";
  String emaillogin = "";
  String pswlogin = "";
  final AuthService _authlogin = AuthService();
  final _formKeylogin = GlobalKey<FormState>();


  String error = "";
  String nome = "";
  String cognome = "";
  String email = "";
  String password = "";
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  GoogleSignInAccount? _currentUser;

  late TabController _tabController;

  Future<UserCredential> _signInWithGoogle() async {
    // Trigger the authentication flow
    _currentUser = await GoogleSignIn()
        .signIn()
        .onError((error, stackTrace) => createMessenger(context, false))
        .whenComplete(() => createMessenger(context, true));

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
    await _currentUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);

    _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount? account) {
      setState(() {
        _currentUser = account;
        print('Signed in as $_currentUser');
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBody: true,
      extendBodyBehindAppBar: true,
      backgroundColor: const Color(0xff161055),
      appBar: AppBar(
        title: const Text(
          'Chalet',
          style: TextStyle(
              fontFamily: 'DancingScript',
              fontSize: 40,
              fontWeight: FontWeight.w500),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        centerTitle: true,
        bottom: TabBar(
          labelPadding: const EdgeInsets.only(bottom: 10),
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
          Form(
            key : _formKeylogin,
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
                const Padding(padding: EdgeInsets.only(top: 15)),
                createText(AppLocalizations.of(context)!.email.toUpperCase(),
                    size: 20),
                const Padding(padding: EdgeInsets.only(top: 10)),
                SizedBox(
                  child: TextFormField(
                    validator: (value) => value!.length < 1
                        ? 'Inserisci la tua mail di 6 o piu caratteri'
                        : null,
                    onChanged: (value) {
                      setState(() => email = value);
                    },
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(50.0))),
                        filled: true,
                        isDense: true,
                        fillColor: Colors.white12),
                    style: const TextStyle(color: Colors.white),
                  ),
                  width: MediaQuery.of(context).size.width / 1.25,
                ),
                const Padding(padding: EdgeInsets.only(top: 20)),
                createText(AppLocalizations.of(context)!.password.toUpperCase(),
                    size: 20),
                const Padding(padding: EdgeInsets.only(top: 10)),
                Container(
                  child: TextFormField(
                    validator: (value) => value!.length < 1
                        ? 'Inserisci la tua password di 6 o piu caratteri'
                        : null,
                    onChanged: (value) {
                      setState(() => pswlogin = value);
                    },
                    autocorrect: false,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(50.0))),
                        filled: true,
                        isDense: true,
                        fillColor: Colors.white12),
                    style: const TextStyle(color: Colors.white),
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
                        color: Colors.white)),
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
                        primary: const Color(0xff4285F4),
                        padding: EdgeInsets.symmetric(
                            horizontal: MediaQuery.of(context).size.width / 4.9,
                            vertical: 10)),
                    onPressed: () async {
                      if (_formKeylogin.currentState!.validate()) {
                        dynamic result = await _authlogin.signIn(email: emaillogin, password: pswlogin);
                        if(result == null){
                          setState(() {
                            error = 'non è stato possibile accedere con queste credenziali';
                          });
                        }
                      }},
                    child: createText(AppLocalizations.of(context)!.accedi,
                        size: 20, weight: FontWeight.bold)),
                SizedBox(height: 12.0),
                Text(error,
                  style: const TextStyle(color: Colors.red, fontSize: 14.0),
                ),
                const Padding(padding: EdgeInsets.only(top: 15)),
                createText('oppure', size: 14),
                const Padding(padding: EdgeInsets.only(top: 15)),
                SignInButton(
                  Buttons.GoogleDark,
                  onPressed: _signInWithGoogle,
                  text: AppLocalizations.of(context)!.accedicon + ' Google',
                  padding: const EdgeInsets.all(5),
                ),
                const Padding(padding: EdgeInsets.only(top: 10)),
                const Divider(
                  thickness: 2,
                  indent: 50,
                  endIndent: 50,
                )
              ],
            ),
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

                const Padding(padding: EdgeInsets.only(top: 15)),
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
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(50.0))),
                        filled: true,
                        isDense: true,
                        fillColor: Colors.white12),
                    style: const TextStyle(color: Colors.white),
                  ),
                  width: MediaQuery.of(context).size.width / 1.25,
                ),
                const Padding(padding: EdgeInsets.only(top: 15)),
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
                    style: const TextStyle(color: Colors.white),
                  ),
                  width: MediaQuery.of(context).size.width / 1.25,
                ),
                Container(
                  padding: const EdgeInsets.only(
                      bottom: 0, right: 0, top: 30, left: 0),
                  child: ElevatedButton(
                    child: const Text(
                      'Registrati',
                    ),
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                      dynamic result = await _auth.signUp(email: email, password: password);
                      if(result == null){
                        setState(() {
                          error = 'non è stato possibile registrarsi con queste credenziali';
                        });
                      }
                    }},
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

dynamic createMessenger(BuildContext context, bool success) {
  return ScaffoldMessenger.of(context).showSnackBar(success
      ? SnackBar(
    content: createText(AppLocalizations.of(context)!.accessoeffettuato,
        size: 18),
    duration: const Duration(milliseconds: 2000),
    backgroundColor: Colors.green,
  )
      : SnackBar(
    content: createText("Accesso fallito", size: 18),
    duration: const Duration(milliseconds: 2000),
    backgroundColor: Colors.red,
  ));
}
