import 'package:flutter/material.dart';
import 'package:pidge_on/sq_lite/sqlite_model/note.dart';
import 'package:pidge_on/sq_lite/sqlite_query.dart';
import 'package:pidge_on/sq_lite/sqlite_update.dart';
import 'package:pidge_on/src/pages/notas_page.dart';
import 'package:provider/provider.dart';

class EditNote extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Note _note = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text('Ver y editar'),
      ),
      body: _Forms(_note),
    );
  }
}

class _Forms extends StatelessWidget {
  final TextEditingController _tituloController = TextEditingController();
  final TextEditingController _registroController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  final Note _note;

  _Forms(this._note) {
    _tituloController.text = _note.titulo;
    _registroController.text = _note.registro;
  }
  @override
  Widget build(BuildContext context) {
    double heigth = MediaQuery.of(context).size.height;

    double width = MediaQuery.of(context).size.width;
    double miHeigth = heigth * 0.05;
    double cinco = width * 0.05;

    return Center(
      child: Expanded(
        child: Container(
          padding: EdgeInsets.only(left: cinco, right: cinco),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: miHeigth,
                  ),
                  TextFormField(
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
                  SizedBox(
                    height: miHeigth,
                  ),
                  TextFormField(
                    controller: _registroController,
                    validator: (value) => _validateRegistro(value),
                    maxLines: 15,
                    decoration: InputDecoration(
                      labelText: 'Registro',
                      alignLabelWithHint: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: miHeigth / 2,
                  ),
                  ElevatedButton.icon(
                    icon: Icon(Icons.save),
                    label: Text('Guardar'),
                    onPressed: () => _save(context),
                  ),
                ],
              ),
            ),
          ),
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
      SQLiteUpdate().note(
        Note(
          id: _note.id,
          titulo: _tituloController.text.trim(),
          registro: _registroController.text.trim(),
        ),
      );
      Provider.of<SQLiteQuery>(context, listen: false).updateNotes();
      ;
    }
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => NotasPage()),
    ).then((value) {
      Provider.of<SQLiteQuery>(context, listen: false).updateNotes();
    });
  }
}
