import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SQLiteHelper {
  static Future<Database> _db;
  static Future<Database> getDB() {
    _db ??= _initDB();
    return _db;
  }

  static Future<Database> _initDB() async {
    final db = await openDatabase(
      join(await getDatabasesPath(), "authentic_notes.db"),
      version: 1,
      onCreate: _onCreate,
    );
    
      return db;
  }

  static _onCreate(Database db, int version) async {
    await db.execute(
        "CREATE TABLE notes(id INTEGER PRIMARY KEY, titulo TEXT NOT NULL, registro LONGTEXT NOT NULL )");
  }
}
