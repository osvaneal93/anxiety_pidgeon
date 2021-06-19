import 'package:flutter/material.dart';
import 'package:pidge_on/src/notas/add_note.dart';
import 'package:pidge_on/src/notas/note_list.dart';
import 'package:pidge_on/src/notas/routes.dart';

void main() => runApp(NotasPage());

class NotasPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      initialRoute: Routes.home,
      routes: {
        Routes.home: (context) => NoteList(),
        Routes.addNote: (context) => AddNotes(),
      },
    );
  }
}
