import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertest/authentication/authentication.dart';
import 'package:fluttertest/sign_in.dart';
import 'package:fluttertest/authentication/sign_in.dart';
import 'package:fluttertest/home_page.dart';
import 'package:fluttertest/signup_widget.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User?>(context);
    if (user == null) {
      return const SignIn();
    } else {
      return const HomePage();
    }
  }
}
