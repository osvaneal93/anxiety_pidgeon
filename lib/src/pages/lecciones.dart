import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class Leccion extends StatelessWidget {
  final String leccionNombre;
  final String leccionImagen;

  const Leccion(this.leccionNombre, this.leccionImagen);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double myHeight = height * 0.2;
    double myWidth = width * 0.6;
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection(leccionNombre)
                .snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              List<DocumentSnapshot> docu = snapshot.data.docs;
              Map<String, dynamic> data = docu[0].data();
              return Text(data['nombre']);
            },
          ),
        ),
        body: Stack(
          children: [
            _fondoApp(context),
            SingleChildScrollView(
              child: SafeArea(
                child: Center(
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: myHeight,
                          width: myWidth,
                          margin: EdgeInsets.all(18),
                          child: Image.asset(leccionImagen),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: StreamBuilder(
                            stream: FirebaseFirestore.instance
                                .collection(leccionNombre)
                                .snapshots(),
                            builder: (context,
                                AsyncSnapshot<QuerySnapshot> snapshot) {
                              if (!snapshot.hasData) {
                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                              List<DocumentSnapshot> docu = snapshot.data.docs;
                              Map<String, dynamic> data = docu[0].data();

                              String data2 = data['texto'].toString();
                              String data3 = data2.replaceAll('yy', '\n');
                              return Text(
                                data3,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 26,
                                    color: Colors.grey.shade800,
                                    fontFamily: 'Caviar'),
                              );
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 15, bottom: 30),
                          child: Center(
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text('    Volver    '),
                            ),
                          ),
                        )
                      ],
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

  Widget _fondoApp(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    final cuadrito = Transform.rotate(
      angle: -pi / 10,
      child: Container(
        height: height * .2,
        width: height * .2,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(250),
            color: Colors.blue.shade100),
      ),
    );

    return Stack(
      children: <Widget>[
        Positioned(
          child: cuadrito,
          top: height * .6,
        ),
        Positioned(
          child: cuadrito,
          top: height * .7,
          right: height * .15,
        ),
        Positioned(
          child: cuadrito,
          top: height * .4,
          right: height * .05,
        ),
        Positioned(
          child: cuadrito,
          top: height * -.1,
          right: height * .1,
        ),
        Positioned(
          child: Container(
            height: height * .4,
            width: height * .4,
            child: Image.asset('assets/pidgeon_trans.png'),
          ),
          top: height * .15,
          right: height * .25,
        ),
      ],
    );
  }
}
