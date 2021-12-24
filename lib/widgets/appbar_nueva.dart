import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pidge_on/sq_lite/sqlite_query.dart';
import 'package:pidge_on/src/pages/menu_page.dart';
import 'package:pidge_on/src/pages/notas_page.dart';
import 'package:pidge_on/src/santuario/principal_s.dart';
import 'package:provider/provider.dart';


class AppBarNueva extends StatefulWidget {
  static final String routeName = 'appbar';

  @override

  _AppBarNuevaState createState() => _AppBarNuevaState();
}

class _AppBarNuevaState extends State<AppBarNueva> {
  
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

    int _paginaActual = 0;
  List _secciones = [
    MenuPage(),
    NotasPage(),
    SantuarioPrincipal(),
  ];
  String nombreLeccion;

  @override
 
  Widget build(BuildContext context) {
    
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => SQLiteQuery()),
        ],
        child: FutureBuilder(
          future: _initialization,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Container();
            }
            if (snapshot.connectionState == ConnectionState.done) {
              return estructuraUno(context);
            }
    
            return Container();
          },
        ),
      ),
    );
  }


  estructuraUno(BuildContext context) {
  

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body:  _secciones[_paginaActual],
        bottomNavigationBar: _botomNavigationBar(context),
      ),
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
            label: 'Lecciones',
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


