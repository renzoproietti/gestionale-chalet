import "dart:io" as io;
import "package:path/path.dart";
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class SqliteDB {
  static final SqliteDB _instance = SqliteDB.internal();

  factory SqliteDB() => _instance;
  static Database? _db;

  Future<Database?> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDb();
    return _db;
  }

  SqliteDB.internal();

  /// Initialize DB
  initDb() async {
    io.Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, "myDatabase.db");
    var taskDb = await openDatabase(path, version: 1);
    return taskDb;
  }

  /// Count number of tables in DB
  Future countTable() async {
    var dbClient = await db;
    var res =
        await dbClient?.query("""SELECT COUNT(*) AS count FROM sqlite_master
         WHERE type = 'table' 
         AND name != 'android_metadata' 
         AND name != 'sqlite_sequence';""");
    return res?[0]['count'];
  }

  /// Creates user Table
  Future createClientTable() async {
    var dbClient = await SqliteDB().db;
    var res = await dbClient?.execute("""
      CREATE TABLE Clienti(
        id TEXT PRIMARY KEY,
        name TEXT,
        email TEXT,
        age INTEGER
      )""");
    return res;
  }

  /// Add user to the table
  Future addClient() async {
    /// User data
    dynamic user = {
      "id": "johndoe94",
      "name": "John Doe",
      "email": "abcd@example.com",
      "age": 26
    };

    /// Adds user to table
    final dbClient = await SqliteDB().db;
    int? res = await dbClient?.insert("Nome", user);
    return res;
  }
}
