import 'package:flutter/material.dart';

void main() => runApp(SantuarioApp());

class SantuarioApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Material App Bar'),
        ),
        body: Center(
          child: Container(
            child: Text('Aquí va la página Santuario'),
          ),
        ),
      ),
    );
  }
}
