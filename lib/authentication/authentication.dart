import 'package:flutter/material.dart';
import 'package:Chalet/authentication/services/auth.dart';




class Authentication extends StatefulWidget {
  const Authentication({Key? key}) : super(key: key);

  @override
  State<Authentication> createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
  @override
  Widget build(BuildContext context) {
    return Container(
    child: Text('Ciao'),
    );
  }
}
