import 'package:flutter/material.dart';
import 'package:pidge_on/sq_lite/sqlite_insert.dart';
import 'package:pidge_on/sq_lite/sqlite_model/note.dart';
import 'package:pidge_on/sq_lite/sqlite_query.dart';
import 'package:pidge_on/src/pages/notas_page.dart';
import 'package:provider/provider.dart';

void main() => runApp(AddNotes());

class AddNotes extends StatefulWidget {
  @override
  _AddNotesState createState() => _AddNotesState();
}

class _AddNotesState extends State<AddNotes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Material App Bar'),
      ),
      body: _Forms(),
    );
  }
}

class _Forms extends StatefulWidget {
  @override
  State<_Forms> createState() => _FormsState();
}

class _FormsState extends State<_Forms> {
  final TextEditingController _tituloController = TextEditingController();

  final TextEditingController _registroController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double cinco = width * 0.05;

    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(cinco),
              child: Align(
                alignment: Alignment.topRight,
                child: ElevatedButton.icon(
                  icon: Icon(Icons.save),
                  label: Text('Guardar'),
                  onPressed: () => _save(context),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(cinco),
              child: TextFormField(
                controller: _tituloController,
                validator: (value) => _validateTitulo(value),
                decoration: InputDecoration(
                  labelText: 'Titulo de la Nota',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(cinco),
              child: TextFormField(
                maxLines: 25,
                controller: _registroController,
                validator: (value) => _validateRegistro(value),
                decoration: InputDecoration(
                  alignLabelWithHint: true,
                  labelText: 'Registro',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _validateTitulo(String value) {
    if (value.trim().isEmpty) return "El registro no tiene título";
    return null;
  }

  String _validateRegistro(String value) {
    if (value.trim().isEmpty) return "El registro está vacío";
    return null;
  }

  void _save(BuildContext context) {
    if (_formKey.currentState.validate()) {
      SQLiteInsert().note(
        Note(
          titulo: _tituloController.text.trim(),
          registro: _registroController.text.trim(),
        ),
      );
      Provider.of<SQLiteQuery>(context, listen: false).updateNotes();
      Navigator.pop(context);
    }
  }
}
