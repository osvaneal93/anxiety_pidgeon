import 'package:flutter/cupertino.dart';
import 'package:pidge_on/sq_lite/sqlite_helper.dart';
import 'package:pidge_on/sq_lite/sqlite_model/note.dart';
import 'package:sqflite/sqflite.dart';

class SQLiteQuery with ChangeNotifier {
  List<Note> _notes;
  List<Note> get notes => [...?_notes];
  Future<void> updateNotes() async {
    final Database db = await SQLiteHelper.getDB();
    final List<Map<String, dynamic>> mapas = await db.query("notes");
    _notes = List.generate(
      mapas.length,
      (i) {
        return Note(
          id: mapas[i]["id"],
          titulo: mapas[i]["titulo"],
          registro: mapas[i]["registro"],
        );
      },
    );
    notifyListeners();
  }
}
