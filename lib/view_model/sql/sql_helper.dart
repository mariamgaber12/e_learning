import 'package:sqflite/sqflite.dart';

class SqlHelper {
  static late Database dataBase;
  static String dbName = "notes.db";
  static const String tableName = "notes";

  static Future<void> initDB({
    String tableName = tableName,
  }) async {
    dataBase = await openDatabase(
      dbName,
      version: 1,
      onCreate: (Database database, int x) async {
        await onCreateDataBase(database: database);
      },
    );
  }

  static Future<void> onCreateDataBase({
    required Database database,
    String tableName = tableName,
  }) async {
    await database.execute(
        'CREATE TABLE $tableName(note_id TEXT PRIMARY KEY, name TEXT, image_url TEXT, quantity INTEGER)');
  }

  static Future<void> closeDataBase() async {
    return await dataBase.close();
  }

  /*
  static Future<void> insertNote(
      CartModel cartModel, {
        String tableName = tableName,
      }) async {
    await dataBase.rawInsert(
      'INSERT INTO $tableName(note_id, name, image_url, quantity) VALUES(?, ?, ?, ?)',
      [cartModel.id, cartModel.name, cartModel.imageUrl, cartModel.quantity],
    );
  }
  */

  static Future<void> updateNoteQuantity(String id, int quantity,
      {String tableName = tableName}) async {
    await initDB();
    await dataBase.rawUpdate(
      'UPDATE $tableName SET quantity = ? WHERE note_id = ?',
      [
        quantity,
        id,
      ],
    );
  }

  static Future<List<Map<String, dynamic>>> getAllCartNotes(
      {String tableName = tableName}) async {
    await initDB();
    return await dataBase.rawQuery('SELECT * FROM $tableName');
  }

  static Future<void> deleteRecorde(String id,
      {String tableName = tableName}) async {
    await initDB();
    await dataBase.rawDelete(
      'DELETE FROM $tableName WHERE note_id = ?',
      [
        id,
      ],
    );
  }
}