import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:Chalet/authentication/sign_in.dart';
import 'package:Chalet/view/home_page.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  Wrapper({Key? key, GoogleSignInAccount? account}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    User? user = Provider.of<User?>(context);
    if (user == null) {
      return const SignIn();
    } else {
      return const HomePage();
    }
  }
}
