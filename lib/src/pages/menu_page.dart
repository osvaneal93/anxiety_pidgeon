import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:pidge_on/src/pages/lecciones.dart';
import 'package:wakelock/wakelock.dart';

class MenuPage extends StatefulWidget {
  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    var screenH = MediaQuery.of(context).size.height;
    Wakelock.disable();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scaffold(
        body: Center(
          child: Stack(
            children: <Widget>[
              _fondoApp(context),
              Align(
                alignment: Alignment.topRight,
                child: Container(
                  margin: EdgeInsetsDirectional.only(start: 15, top: 5),
                  height: screenH * .3,
                  width: screenH * .3,
                  child: Image.asset("assets/pidgeon_trans.png"),
                ),
              ),
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
              Colors.lightBlue.shade200,
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
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Quick'),
            ),
            SizedBox(height: 10),
            Image.asset("assets/pidgeon_splash.png"),
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
              '1.Introduccion',
              '/leccion1',
              'assets/L1.png'),
          _crearBoton(
              context,
              Colors.black,
              Colors.blue,
              Icons.perm_device_info_rounded,
              '2.Comenzamos',
              '/leccion2',
              'assets/L2.png'),
        ],
      ),
      TableRow(
        children: [
          _crearBoton(
            context,
            Colors.black,
            Colors.red,
            Icons.all_inclusive,
            '3.Compromiso',
            '/leccion3',
            'assets/L3.png',
          ),
          _crearBoton(
            context,
            Colors.black,
            Colors.green,
            Icons.eco,
            '4.Afrontarlo',
            '/leccion4',
            'assets/L4.png',
          ),
        ],
      ),
      TableRow(
        children: [
          _crearBoton(
              context,
              Colors.black,
              Colors.yellow,
              Icons.star_border_purple500_outlined,
              '5.Decidir quienes somos',
              '/leccion5',
              'assets/L5.png'),
          _crearBoton(
              context,
              Colors.black,
              Colors.black,
              Icons.emoji_nature_outlined,
              '6. La confianza',
              '/leccion6',
              'assets/L2.png'),
        ],
      ),
      TableRow(
        children: [
          _crearBoton(
              context,
              Colors.black,
              Colors.black,
              Icons.hourglass_empty,
              '6. La confianza',
              '/leccion6',
              'assets/L2.png'),
          _crearBoton(
              context,
              Colors.black,
              Colors.black,
              Icons.hourglass_empty,
              '6. La confianza',
              '/leccion6',
              'assets/L2.png'),
        ],
      ),
      TableRow(
        children: [
          _crearBoton(
              context,
              Colors.black,
              Colors.black,
              Icons.hourglass_empty,
              '6. La confianza',
              '/leccion6',
              'assets/L2.png'),
          _crearBoton(
              context,
              Colors.black,
              Colors.black,
              Icons.hourglass_empty,
              '6. La confianza',
              '/leccion6',
              'assets/L2.png'),
        ],
      ),
      TableRow(
        children: [
          _crearBoton(
              context,
              Colors.black,
              Colors.black,
              Icons.hourglass_empty,
              '6. La confianza',
              '/leccion6',
              'assets/L2.png'),
          _crearBoton(
              context,
              Colors.black,
              Colors.black,
              Icons.hourglass_empty,
              '6. La confianza',
              '/leccion6',
              'assets/L2.png'),
        ],
      ),
    ],
  );
}

Widget _crearBoton(BuildContext context, Color colores, Color colorIcono,
    IconData iconoso, String titulos, String nombreLeccion, String urlImagen) {
  double heigth = MediaQuery.of(context).size.height;
  double width = MediaQuery.of(context).size.width;
  double miHeigth = heigth * 0.20;
  double cinco = width * 0.1;
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Leccion(nombreLeccion, urlImagen),
        ),
      );
    },
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
          child: Container(
            height: miHeigth,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.lightBlue.shade100, width: 5),
              gradient: LinearGradient(colors: [
                Colors.white.withOpacity(0.2),
                Colors.white.withOpacity(0.5)
              ]),
              borderRadius: BorderRadius.circular(30),
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
