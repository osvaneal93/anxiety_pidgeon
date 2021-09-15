import 'dart:math';
import 'dart:ui';

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
      debugShowCheckedModeBanner: false,
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
          colors: [Colors.white, Colors.lightBlue.shade100],
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
              Colors.lightBlue,
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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Bienvenido a PidgeOn',
              style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Container(
              width: 100,
              height: 100,
              child: Image.asset("assets/pidgeon.png"),
            ),
            SizedBox(height: 10),
            Text(
              'Escoge entre las distintas lecciones y comienza a superar la ansiedad',
              style: TextStyle(fontSize: 20, color: Colors.black),
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
          _crearBoton(
              context,
              Colors.black,
              Colors.black,
              Icons.accessibility_new_sharp,
              'Conociendo la Ansiedad',
              '/leccionUno'),
          _crearBoton(context, Colors.black, Colors.blue,
              Icons.perm_device_info_rounded, 'Cómo iniciar...', '/'),
        ],
      ),
      TableRow(
        children: [
          _crearBoton(context, Colors.black, Colors.red, Icons.all_inclusive,
              '1.Nuestros Ciclos', 'gladiador'),
          _crearBoton(context, Colors.black, Colors.green, Icons.eco,
              '2.Somos naturaleza ', '/'),
        ],
      ),
      TableRow(
        children: [
          _crearBoton(
              context,
              Colors.black,
              Colors.yellow,
              Icons.star_border_purple500_outlined,
              '3.Decidir quienes somos',
              'gladiador'),
          _crearBoton(context, Colors.black, Colors.black,
              Icons.emoji_nature_outlined, '4. La confianza', '/'),
        ],
      ),
      TableRow(
        children: [
          _crearBoton(context, Colors.black, Colors.black,
              Icons.hourglass_empty, '5.Titulo', 'gladiador'),
          _crearBoton(context, Colors.black, Colors.black,
              Icons.hourglass_empty, '6.Titulo', '/'),
        ],
      ),
      TableRow(
        children: [
          _crearBoton(context, Colors.black, Colors.black,
              Icons.hourglass_empty, '7.Titulo', 'gladiador'),
          _crearBoton(context, Colors.black, Colors.black,
              Icons.hourglass_empty, '8.Titulo', '/'),
        ],
      ),
      TableRow(
        children: [
          _crearBoton(context, Colors.black, Colors.black,
              Icons.hourglass_empty, '9.Titulo', 'gladiador'),
          _crearBoton(context, Colors.black, Colors.black,
              Icons.hourglass_empty, '10.Titulo', '/'),
        ],
      ),
    ],
  );
}

Widget _crearBoton(BuildContext context, Color colores, Color colorIcono,
    IconData iconoso, String titulos, String secciones) {
  double heigth = MediaQuery.of(context).size.height;
  double width = MediaQuery.of(context).size.width;
  double miHeigth = heigth * 0.20;
  double cinco = width * 0.1;
  return GestureDetector(
    onTap: () {
      Navigator.pushNamed(context, secciones);
    },
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
          child: Container(
            height: miHeigth,
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Colors.white.withOpacity(0.2),
                Colors.white.withOpacity(0.5)
              ]),
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
                    color: colorIcono,
                  ),
                  radius: cinco,
                ),
                Text(
                  titulos,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: colores),
                ),
                SizedBox(
                  height: 10,
                )
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
