import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(MenuPage());

class MenuPage extends StatefulWidget {
  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        body: Center(
          child: Stack(
            children: <Widget>[
              _fondoApp(context),
              SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    _titulo(),
                    botonesRedondeados(context),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
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
          colors: [Colors.white, Color(0xffE4EFDE)],
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
              Color(0xffB7D7DE),
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
      ],
    );
  }

  Widget _titulo() {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Bienvenido al Lobby',
              style: TextStyle(
                  fontSize: 30,
                  color: Color(0xff627188),
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Escoge entre las distintas lecciones y comienza a superar la ansiedad',
              style: TextStyle(
                fontSize: 20,
                color: Color(0xff627188),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget botonesRedondeados(BuildContext context) {
  return Table(
    children: [
      TableRow(
        children: [
          _crearBoton(context, Color(0xff627188), Icons.accessibility_new_sharp,
              'Conociendo la Ansiedad', 'leccion1'),
          _crearBoton(context, Color(0xff627188), Icons.access_alarms_rounded,
              'DORMIR', '/'),
        ],
      ),
      TableRow(
        children: [
          _crearBoton(context, Color(0xff627188), Icons.accessibility_new_sharp,
              'Conociendonos', 'gladiador'),
          _crearBoton(context, Color(0xff627188), Icons.access_alarms_rounded,
              'DORMIR', '/'),
        ],
      ),
      TableRow(
        children: [
          _crearBoton(context, Color(0xff627188), Icons.accessibility_new_sharp,
              'Conociendonos', 'gladiador'),
          _crearBoton(context, Color(0xff627188), Icons.access_alarms_rounded,
              'DORMIR', '/'),
        ],
      ),
      TableRow(
        children: [
          _crearBoton(context, Color(0xff627188), Icons.accessibility_new_sharp,
              'Conociendonos', 'gladiador'),
          _crearBoton(context, Color(0xff627188), Icons.access_alarms_rounded,
              'DORMIR', '/'),
        ],
      ),
      TableRow(
        children: [
          _crearBoton(context, Color(0xff627188), Icons.accessibility_new_sharp,
              'Conociendonos', 'gladiador'),
          _crearBoton(context, Color(0xff627188), Icons.access_alarms_rounded,
              'DORMIR', '/'),
        ],
      ),
      TableRow(
        children: [
          _crearBoton(context, Color(0xff627188), Icons.accessibility_new_sharp,
              'Conociendonos', 'gladiador'),
          _crearBoton(context, Color(0xff627188), Icons.access_alarms_rounded,
              'DORMIR', '/'),
        ],
      ),
    ],
  );
}

Widget _crearBoton(BuildContext context, Color colores, IconData iconoso,
    String titulos, String secciones) {
  double heigth = MediaQuery.of(context).size.height;

  double width = MediaQuery.of(context).size.width;
  double miHeigth = heigth * 0.20;
  double cinco = width * 0.1;
  return GestureDetector(
    onTap: () {
      Navigator.pushNamed(context, secciones);
    },
    child: Container(
      height: miHeigth,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Color(0xffBED1E1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
          CircleAvatar(
            backgroundColor: Colors.white,
            child: Icon(
              iconoso,
              color: colores,
            ),
            radius: cinco,
          ),
          Text(
            titulos,
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: colores),
          ),
          SizedBox(
            height: 10,
          )
        ],
      ),
    ),
  );
}
