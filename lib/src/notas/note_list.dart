import 'dart:math';
import 'dart:ui';

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
      appBar: AppBar(
        title: Text('Mis Registros'),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: SQLiteHelper.getDB(),
        builder: (context, snapshot) {
          Provider.of<SQLiteQuery>(context, listen: false).updateNotes();
          if (snapshot.connectionState == ConnectionState.done)
            return Stack(children: [
              
  
              _fondoApp(context),

              _showList(context),
            ],);
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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
          itemCount: sqLiteQuery.notes.length,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.all(3),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: Colors.blue.shade200),
                  color: Colors.blueGrey.shade50.withOpacity(.3)),
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
          }),
    );
  }
  Widget _fondoApp(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double myHeight = height * 0.4;
    double miWidth = width * 0.9;

    final gradiente = Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: FractionalOffset(0.0, 0.3),
          end: FractionalOffset(0.0, 1.0),
          colors: [Colors.white, Colors.lightBlue.shade50],
        ),
      ),
    );
    final cuadrito = Transform.rotate(
      angle: -pi / 5,
      child: Container(
        height: myHeight,
        width: miWidth,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(80),
          gradient: LinearGradient(
            colors: [
              Colors.lightBlue.shade100,
              Colors.white,
            ],
          ),
        ),
      ),
    );

    return Stack(
      children: <Widget>[
        gradiente,
        Positioned(
          child: cuadrito,
          top: -70,
        ),
        Positioned(
          child: Container(
            height: height * .4,
            width: height * .4,
            child: Image.asset('assets/pidgeon_trans.png'),
          ),
          top: height * .58,
          left: width * .15,
        )
      ],
    );
  }
}
