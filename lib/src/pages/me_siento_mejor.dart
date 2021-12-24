import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class MeSientoMejor extends StatefulWidget {
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
        child: Center(
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
                  'Hola felicidades lo lograste',
                  style: TextStyle(
                      fontSize: 25,
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
                  'Sabemos que no es fácil, pero una vez más, has superado una gran prueba',
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Caviar'),
                ),
              ),
              Container(
                height: screenH * .3,
                width: screenH * .3,
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
            ],
          ),
        ),
      ),
    );
  }
}
