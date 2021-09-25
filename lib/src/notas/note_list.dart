import 'package:flutter/material.dart';
import 'package:pidge_on/sq_lite/sqlite_delete.dart';
import 'package:pidge_on/sq_lite/sqlite_helper.dart';
import 'package:pidge_on/sq_lite/sqlite_model/note.dart';
import 'package:pidge_on/sq_lite/sqlite_query.dart';
import 'package:pidge_on/src/notas/routes.dart';
import 'package:provider/provider.dart';

class NoteList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: SQLiteHelper.getDB(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done)
            return _showList(context);
          else
            return Center(child: CircularProgressIndicator());
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        child: Icon(Icons.add),
        onPressed: () => _openAddNotes(context),
      ),
    );
  }

  void _openAddNotes(BuildContext context) {
    Navigator.pushNamed(context, Routes.addNote).then((value) {
      Provider.of<SQLiteQuery>(context, listen: false).updateNotes();
    });
  }

  void _openEditNotes(BuildContext context, Note note) {
    Navigator.pushNamed(context, Routes.editNote, arguments: note)
        .then((value) {
      Provider.of<SQLiteQuery>(context, listen: false).updateNotes();
    });
  }

  _showList(BuildContext context) {
    final SQLiteQuery sqLiteQuery = Provider.of<SQLiteQuery>(context);
    return ListView.builder(
        itemCount: sqLiteQuery.notes.length,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.all(3),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: Colors.blue.shade200),
                color: Colors.blueGrey.shade50),
            child: Dismissible(
              key: Key(
                sqLiteQuery.notes[index].id.toString(),
              ),
              direction: DismissDirection.startToEnd,
              background: Container(
                color: Colors.red,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Icon(Icons.delete),
                ),
              ),
              onDismissed: (direction) {
                SQLiteDelete().note(
                  sqLiteQuery.notes[index],
                );
                sqLiteQuery.updateNotes();
              },
              child: ListTile(
                title: Text(
                  sqLiteQuery.notes[index].titulo,
                  style: TextStyle(color: Colors.grey, fontSize: 20),
                ),
                trailing: IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () =>
                      _openEditNotes(context, sqLiteQuery.notes[index]),
                ),
              ),
            ),
          );
        });
  }
}
