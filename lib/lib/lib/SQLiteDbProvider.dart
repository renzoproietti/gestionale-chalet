class SQLiteDbProvider {
   SQLiteDbProvider._();
   static final SQLiteDbProvider db = SQLiteDbProvider._();
   static Database _database;




Future<List<Clienti>> getAllclienti() async {
   final db = await database;
   List<Map>
   results = await db.query("Clienti", columns: Clienti.columns, orderBy: "id ASC");

   List<Clienti> clienti = new List();
   results.forEach((result) {
      Clienti cliente = Clienti.fromMap(result);
      clienti.add(product);
   });
   return clienti;
}}