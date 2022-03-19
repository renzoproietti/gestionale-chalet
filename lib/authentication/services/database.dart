import 'package:cloud_firestore/cloud_firestore.dart';


class DatabaseService{




  final String uid;
  DatabaseService({required this.uid});

  //collection reference

  final CollectionReference CasottoCollection = FirebaseFirestore.instance.collection('Casotto');

  Future updateUserData(String nome, String cognome, String email) async{
    return await CasottoCollection.doc(uid).set({
      'nome' : nome,
      'cognome' : cognome,
      'email' : email,
    });

  }

  //stream che ascolta i cambiamenti nel db

  Stream<QuerySnapshot> get CasottoStream {
    return CasottoCollection.snapshots();
  }











}