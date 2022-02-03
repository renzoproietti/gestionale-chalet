import 'dart:async';
import 'dart:convert' show json;
import 'widgets_builder.dart';
import "package:http/http.dart" as http;
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

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
}

class SignInDemoState extends State<SignInDemo> {
  GoogleSignInAccount? _currentUser;
  String _contactText = '';

  @override
  void initState() {
    super.initState();
    _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount? account) {
      setState(() {
        _currentUser = account;
      });
      if (_currentUser != null) {
        _handleGetContact(_currentUser!);
      }
    });
    _googleSignIn.signInSilently();
  }

  Future<void> _handleGetContact(GoogleSignInAccount user) async {
    setState(() {
      _contactText = "Loading contact info...";
    });
    final http.Response response = await http.get(
      Uri.parse('https://people.googleapis.com/v1/people/me/connections'
          '?requestMask.includeField=person.names'),
      headers: await user.authHeaders,
    );
    if (response.statusCode != 200) {
      setState(() {
        _contactText = "People API gave a ${response.statusCode} "
            "response. Check logs for details.";
      });
      print('People API ${response.statusCode} response: ${response.body}');
      return;
    }
    final Map<String, dynamic> data = json.decode(response.body);
    final String? namedContact = _pickFirstNamedContact(data);
    setState(() {
      if (namedContact != null) {
        _contactText = "I see you know $namedContact!";
      } else {
        _contactText = "No contacts to display.";
      }
    });
  }

  String? _pickFirstNamedContact(Map<String, dynamic> data) {
    final List<dynamic>? connections = data['connections'];
    final Map<String, dynamic>? contact = connections?.firstWhere(
      (dynamic contact) => contact['names'] != null,
      orElse: () => null,
    );
    if (contact != null) {
      final Map<String, dynamic>? name = contact['names'].firstWhere(
        (dynamic name) => name['displayName'] != null,
        orElse: () => null,
      );
      if (name != null) {
        return name['displayName'];
      }
    }
    return null;
  }

  Future<void> _handleSignIn() async {
    try {
      await _googleSignIn.signIn();
    } catch (error) {
      print(error);
    }
  }

  Future<void> _handleSignOut() => _googleSignIn.disconnect();

  Widget _buildBody() {
    GoogleSignInAccount? user = _currentUser;
    if (user != null) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          ListTile(
            leading: GoogleUserCircleAvatar(
              identity: user,
            ),
            title: Text(user.displayName ?? ''),
            subtitle: Text(user.email),
          ),
          const Text("Signed in successfully."),
          Text(_contactText),
          ElevatedButton(
            child: const Text('SIGN OUT'),
            onPressed: _handleSignOut,
          ),
          ElevatedButton(
            child: const Text('REFRESH'),
            onPressed: () => _handleGetContact(user),
          ),
        ],
      );
    } else {
      return ListView(
        shrinkWrap: false,
        addAutomaticKeepAlives: false,
        cacheExtent: 100.0,
        children: [
          InkWell(
            onTap: () => showDialog(
              context: context,
              builder: (context) => Container(
                child: AlertDialog(
                  contentPadding: EdgeInsets.fromLTRB(20, 20, 20, 100),
                  elevation: 24.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Seleziona lingua \n",
                        style: TextStyle(
                          fontSize: 22,
                        ),
                      ),
                      Text(
                        "Select language \n \n \n \n",
                        style: TextStyle(
                          fontSize: 19,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Image(
                            image: AssetImage("lib/assets/united-kingdom.png"),
                            width: 80,
                            height: 80,
                          ),
                          Image(
                            image: AssetImage("lib/assets/italy.png"),
                            width: 80,
                            height: 80,
                          ),
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
                    image: AssetImage("lib/assets/italy.png"),
                    width: 30,
                    height: 30,
                  ),
                  Padding(padding: EdgeInsets.only(left: 20.0)),
                  Text(
                    'Italiano',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
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
              Text(
                'Hai uno stabilimento?',
                style: TextStyle(
                  fontSize: 20,
                ),
              )
            ]),
          ),
          Padding(padding: EdgeInsets.only(top: 5)),
          InkWell(
            onTap: () => _handleSignIn(),
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
                Text(
                  'Registrati/Accedi',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                )
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
                Text(
                  'Avvisi',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                )
              ]),
            ),
          ),
          Padding(padding: EdgeInsets.only(top: 5)),
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Profilo",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22,
              )),
        ),
        body: ConstrainedBox(
          child: Container(
            child: _buildBody(),
            color: Color(0xff161055),
          ),
          constraints: const BoxConstraints.expand(),
        ));
  }
}
