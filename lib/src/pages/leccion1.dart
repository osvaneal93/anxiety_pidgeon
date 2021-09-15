import 'package:flutter/material.dart';

void main() => runApp(LeccionUno());

class LeccionUno extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Material App Bar'),
        ),
        body: SafeArea(
          child: Center(
            child: Container(
              child: Column(
                children: [
                  Text('Aquí va la Lección número X'),
                  Text('Aquí va la Lección número X'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
