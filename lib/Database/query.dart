import 'sqlite.dart';



/// Simple query with WHERE raw query
Future getAdults() async {
  var dbClient = await SqliteDB().db;
  final res = await dbClient?.query("SELECT id, name FROM Clienti WHERE age > 18");
  return res;
}

/// Get all using sqflite helper
Future getAllUsingHelper() async{
  var dbClient = await SqliteDB().db;
  final res = await dbClient?.query('Clienti');
  return res;
}


/// Update using sqflite helper
/// newData example :-
/// var newData = {"id": "johndoe92", "name": "John Doe", "email":"abc@example.com", "age": 28}
Future updateidUsingHelper(newData) async {
  var dbClient = await SqliteDB().db;
  var res = await dbClient?.update('Clienti',newData,
      where: 'id = ?', whereArgs: [newData['id']]);
  return res;
}
Future updatenomeUsingHelper(newData) async {
  var dbClient = await SqliteDB().db;
  var res = await dbClient?.update('Nome',newData,
      where: 'nome = ?', whereArgs: [newData['nome']]);
  return res;
}


/// Delete data using sqflite helper
Future deleteUsingHelper(id) async {
  var dbClient = await SqliteDB().db;
  var res = await dbClient?.delete('User', where: 'id = ?', whereArgs: [id]);
  return res;
}

// Batch insert data
/// example:-
/// var users = [{"id": "johndoe92", "name": "", "email": "", "age": 25}, {"id": "paul", "name": "", "email": "", "age": 22}]
Future putUsers(users) async {
  final dbClient = await SqliteDB().db;

  /// Initialize batch
  final batch = dbClient?.batch();

  /// Batch insert
  for (var i = 0; i < users.length; i++) {
    batch?.insert("User", users[i]);
  }

  /// Commit
  await batch?.commit(noResult: true);

  return "success";
}


/// An example use of transactions
/// in sqflite
Future test() async {
  var dbClient = await SqliteDB().db;
  await dbClient?.transaction((txn) async {
    await txn.execute("DELETE FROM User");
  });
}