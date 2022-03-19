import 'package:cloud_firestore/cloud_firestore.dart';


class DatabaseService{




  final String uid;
  DatabaseService({required this.uid});

  //collection reference

  final CollectionReference CasottoCollection = FirebaseFirestore.instance.collection('Casotto');

  Future updateUserData(String email, String password) async{
    return await CasottoCollection.doc(uid).set({
      'email' : email,
      'password' : password,
    });

  }

  //stream che ascolta i cambiamenti nel db

  Stream<QuerySnapshot> get CasottoStream {
    return CasottoCollection.snapshots();
  }











}