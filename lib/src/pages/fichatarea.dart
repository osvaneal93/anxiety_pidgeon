import 'package:flutter/material.dart';

class FichaTarea extends StatelessWidget {
  final String titulo;
  final String estado;

  FichaTarea({Key key, this.titulo, this.estado}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(titulo),
                SizedBox(
                  height: 5,
                ),
                Text(estado),
                SizedBox(
                  height: 5,
                )
              ],
            ),
          ),
        ],
      ),
    );

    print("hola");
  }
}
