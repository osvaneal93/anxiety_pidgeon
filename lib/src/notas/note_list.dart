import 'package:flutter/material.dart';
import 'package:pidge_on/sq_lite/sqlite_delete.dart';
import 'package:pidge_on/sq_lite/sqlite_helper.dart';
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
        backgroundColor: Color(0xff627188),
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

  _showList(BuildContext context) {
    final SQLiteQuery sqLiteQuery = Provider.of<SQLiteQuery>(context);
    return ListView.builder(
        itemCount: sqLiteQuery.notes.length,
        itemBuilder: (context, index) {
          return Dismissible(
            key: Key(
              sqLiteQuery.notes[index].id.toString(),
            ),
            direction: DismissDirection.startToEnd,
            background: Container(
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
              title: Text(sqLiteQuery.notes[index].titulo),
            ),
          );
        });
  }
}
