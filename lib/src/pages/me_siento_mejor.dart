import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pidge_on/src/notas/note_list.dart';
import 'package:rive/rive.dart';

class MeSientoMejor extends StatefulWidget {
  
  static final String routeName = 'MeSientoMejor';
  @override
  
  State<MeSientoMejor> createState() => _MeSientoMejorState();
}

class _MeSientoMejorState extends State<MeSientoMejor> {
  @override
  Widget build(BuildContext context) {
    var screenH = MediaQuery.of(context).size.height;

    var screenW = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
           Positioned(
             top: screenH * .8,
             left: screenW * .45,
              child: Transform.rotate(angle: -pi / 5,
                child: Container(
                  height: screenH * .2,
                  width: screenW * .8,
                  child: Image.asset('assets/olivos.png')
              
                ),
              ),
            ),
            Positioned(
             top: screenH * .8,
             left: screenW * -.3,
              child: Transform.rotate(angle: pi / 5,
                child: Container(
                  height: screenH * .2,
                  width: screenW * .8,
                  child: Image.asset('assets/olivos.png')
              
                ),
              ),
            ),
            Center(
              child: Column(
                children: [
                  SizedBox(
                    height: screenH * .05,
                  ),
                  Image.asset('assets/pidgeon_splash.png'),
                  SizedBox(
                    height: screenH * .05,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: screenH * .05,
                    ),
                    child: Text(
                      '¡Lo lograste!',
                      style: TextStyle(
                          fontSize: screenW * .05,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Caviar'),
                    ),
                  ),
                  SizedBox(
                    height: screenH * .02,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: screenW * .05,

                    ),
                    child: Text(
                      'Sabemos que no es fácil, los ataques de pánico y picos de ansiedad pueden llegar '
                      'a ser muy molestos, afortunadamente, las veces que miras esta pantalla significa '
                      'que has logrado sentirte mejor, y así poco a poco, podremos superar esta prueba.'
                      ,
                      style: TextStyle(
                          fontSize: screenW * .035,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Caviar'),
                    ),
                  ),
                  Container(
                    height: screenH * .15,
                    width: screenH * .15,
                    child: RiveAnimation.asset(
                      'assets/emojis.riv',
                      artboard: 'Tada',
                      animations: [
                        'Hover',
                        'Reveal',
                        'No_hover',
                        'idle',
                        'Dart_board_play',
                        'controller'
                      ],
                      antialiasing: true,
                    ),
                  ),
                  SizedBox(
                    height: screenH * .05,
                  ),
                  GestureDetector(
                  onTap: () {
                    Navigator.pop(
                      context
                      
                    );
                  },
                  child: Container(
                    height: screenH * .06,
                    width: screenW * .6,
                    decoration: BoxDecoration(
                      color: Colors.green.shade300,
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: Center(
                      child: Text(
                        'Volver al Santuario',
                        style: TextStyle(
                            fontSize: screenW * .05,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Caviar',
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
