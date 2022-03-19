import 'package:Chalet/authentication/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //auth change user stream
  Stream<User?> get user {
    return _auth.authStateChanges();
  }

  //SIGNIN ANON METHOD
  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //SIGN UP METHOD
  Future signUp({required String email, required String password}) async {
    try {
      dynamic result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = result.user;

      await DatabaseService(uid: user!.uid).updateUserData('nome', 'cognome', 'email');
      return user;
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  //LOG IN METHOD
  Future signIn({required String email, required String password}) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return null;
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  //SIGN OUT METHOD
  Future signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
