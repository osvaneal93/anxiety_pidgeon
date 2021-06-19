import 'package:pidge_on/sq_lite/sqlite_helper.dart';
import 'package:pidge_on/sq_lite/sqlite_model/note.dart';
import 'package:sqflite/sqflite.dart';

class SQLiteDelete {
  Future<void> note(Note note) async {
    final Database db = await SQLiteHelper.getDB();
    await db.delete(
      "notes",
      where: "id=?",
      whereArgs: [note.id],
    );
  }
}
