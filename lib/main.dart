import 'package:flutter/material.dart';
import 'package:pidge_on/sq_lite/sqlite_query.dart';
import 'package:pidge_on/src/pages/menu_page.dart';
import 'package:pidge_on/src/pages/notas_page.dart';
import 'package:flutter/services.dart';
import 'package:pidge_on/src/santuario_page.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => SQLiteQuery(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        home: Scaffold(
          body: _secciones[_paginaActual],
          bottomNavigationBar: _botomNavigationBar(context),
        ),
      ),
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
