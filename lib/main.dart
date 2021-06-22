import 'package:flutter/material.dart';
import 'package:pidge_on/src/pages/fichatarea.dart';
import 'package:pidge_on/src/pages/menu_page.dart';
import 'package:pidge_on/src/pages/newnotes_page.dart';
import 'package:pidge_on/src/pages/notas_page.dart';
import 'package:flutter/services.dart';
import 'package:pidge_on/src/santuario_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _paginaActual = 0;
  List _secciones = [
    MenuPage(),
    NotasPage(),
    SantuarioApp(),
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: ListaTareas(),
      //Scaffold(
      //body: _secciones[_paginaActual],
      //bottomNavigationBar: _botomNavigationBar(context),
      //),
    );
  }

  Widget _botomNavigationBar(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        canvasColor: Color(0xffB7D7DE),
        primaryColor: Color(0xff627188),
        textTheme: Theme.of(context).textTheme.copyWith(
              caption: TextStyle(color: Colors.white),
            ),
      ),
      child: BottomNavigationBar(
        currentIndex: _paginaActual,
        onTap: (index) {
          setState(() {
            _paginaActual = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.all_inclusive_sharp),
            label: 'Conociendo',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.widgets_outlined),
            label: 'Mi Registro',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_sharp),
            label: 'Santuario',
          ),
        ],
      ),
    );
  }
}

class ListaTareas extends StatefulWidget {
  @override
  _ListaTareasState createState() => _ListaTareasState();
}

class _ListaTareasState extends State<ListaTareas> {
  List<Tarea> listaTareas;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Registro diario"),
      ),
      body: ListView.builder(
        itemCount: listaTareas.length,
        itemBuilder: (BuildContext context, int posicion) {
          final item = listaTareas[posicion];
          return new GestureDetector(
            onTap: () {
              _editarTarea(listaTareas[posicion], this, posicion);
            },
            child: Dismissible(
              key: Key(item.nombre),
              onDismissed: (direction) {
                eliminar(posicion);
              },
              child: Card(
                margin: EdgeInsets.all(1),
                elevation: 2.0,
                child: FichaTarea(),
              ),
            ),
          );
        },
      ),
    );
  }

  void eliminar(int posicion) {
    this.listaTareas.remove(posicion);
    // Actualizamos Lista
    actualizarLista();
  }

  void actualizarLista() {
    setState(
      () {
        this.listaTareas = listaTareas;
      },
    );
  }

  void _editarTarea(Tarea tarea, _ListaTareasState obj, int posicion) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => nuevaTarea(tarea, 'Editar Tarea', obj, posicion),
      ),
    );
    actualizarLista();
  }
}
