import 'dart:async';
import 'package:fluttertest/services/auth.dart';
import 'dart:convert' show json;
import 'package:flutter/material.dart';
import "package:http/http.dart" as http;
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'widgets_builder.dart';

GoogleSignIn _googleSignIn = GoogleSignIn(
  // Optional clientId
  // clientId: '479882132969-9i9aqik3jfjd7qhci1nqf0bm2g71rm1u.apps.googleusercontent.com',
  scopes: <String>[
    'email',
    'https://www.googleapis.com/auth/contacts.readonly',
  ],
);

class SignInDemo extends StatefulWidget {
  @override
  State createState() => SignInDemoState();

  static SignInDemoState? of(BuildContext context) =>
      context.findAncestorStateOfType<SignInDemoState>();
}

class SignInDemoState extends State<SignInDemo> with TickerProviderStateMixin {
  GoogleSignInAccount? _currentUser;

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);

    _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount? account) {
      setState(() {
        _currentUser = account;
      });
    });
    _googleSignIn.signInSilently().whenComplete(() {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.green[400],
        content: createText(AppLocalizations.of(context)!.accessoeffettuato,
            size: 15),
        /*action: SnackBarAction(
          label: 'Undo',
          onPressed: () {},
        ),*/
      ));
    });
  }

  Future<void> _handleSignIn() async {
    try {
      await _googleSignIn.signIn();
    } catch (error) {
      print('$error');
    }
  }

  Future<void> handleSignOut() async {
    await _googleSignIn.disconnect();
  }

  Widget _buildBody() {
    GoogleSignInAccount? user = _currentUser;
    return LogInScreen(onGoogleTap: _handleSignIn);
  }

  Function getSignInHandler() {
    return _handleSignIn;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      extendBody: true,
      extendBodyBehindAppBar: true,
      backgroundColor: const Color(0xff161055),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: createText(AppLocalizations.of(context)!.signin),
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
          Container(
            child: _buildBody(),
            color: const Color(0xff161055),
          ),
          Container(
            child: _buildBody(),
            color: const Color(0xff161055),
          ),
        ],
      ),
      //constraints: const BoxConstraints.expand(),
    );
  }
}
