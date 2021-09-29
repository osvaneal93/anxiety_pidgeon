import 'package:flutter/material.dart';
import 'package:pidge_on/sq_lite/sqlite_query.dart';
import 'package:pidge_on/src/pages/fichatarea.dart';
import 'package:pidge_on/src/pages/leccion1.dart';
import 'package:pidge_on/src/pages/menu_page.dart';
import 'package:pidge_on/src/pages/newnotes_page.dart';
import 'package:pidge_on/src/pages/notas_page.dart';
import 'package:flutter/services.dart';
import 'package:pidge_on/src/santuario/principal_s.dart';
import 'package:provider/provider.dart';

import 'models/audioplayer_model.dart';

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
    SantuarioPrincipal(),
  ];
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => SQLiteQuery()),
        ChangeNotifierProvider(create: (context) => new AudioPlayerModel())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        routes: {
          "/": (context) => estructuraUno(context),
          "/leccionUno": (context) => LeccionUno(),
          "/notes": (context) => NotasPage(),
        },
        initialRoute: "/",
      ),
    );
  }

  Scaffold estructuraUno(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: _secciones[_paginaActual]),
      bottomNavigationBar: _botomNavigationBar(context),
    );
  }

  Widget _botomNavigationBar(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        canvasColor: Colors.white,
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
        itemCount: 1,
        itemBuilder: (BuildContext context, int posicion) {
          final item = listaTareas[1];
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
    actualizarLista();
  }
}
