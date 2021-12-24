import 'package:flutter/material.dart';
import 'package:pidge_on/sq_lite/sqlite_edit.dart';
import 'package:pidge_on/src/notas/add_note.dart';
import 'package:pidge_on/src/notas/note_list.dart';
import 'package:pidge_on/src/notas/routes.dart';
import 'package:wakelock/wakelock.dart';

void main() => runApp(NotasPage());

class NotasPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    Wakelock.disable();
    return MaterialApp(
      title: 'Material App',
      
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.home,
      routes: {
        Routes.home: (context) => NoteList(),
        Routes.addNote: (context) => AddNotes(),
        Routes.editNote: (context) => EditNote()
      },
    );
  }
}
