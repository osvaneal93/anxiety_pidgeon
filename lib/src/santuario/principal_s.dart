import 'dart:math';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:pidge_on/src/pages/me_siento_mejor.dart';
import 'package:pidge_on/widgets/appbar_nueva.dart';
import 'package:wakelock/wakelock.dart';

class SantuarioPrincipal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Wakelock.enable();
    double height = MediaQuery.of(context).size.height;
    Random aleatorio = Random();
    var hola = [
      "Aunque no lo creas, ahora estás a salvo y no va a sucederte nada.",
      "Muchas personas alrededor del mundo padecen estas sensaciones ",
      "Lo que sientes justo ahora, es más normal de lo que te imaginas.",
      "Los pensamientos están ahí, pero son solamente eso.",
      "Concéntrate en respirar, este momento es pasajero",
      "entendemos perfectamente lo que se siente y estamos aquí para acompañarte.",
      "Si hay pensamientos intrusivos deja que estén",
      "solo son pensamientos, no definen lo que realmente eres tú.",
      "Has superado muchas pruebas, este momento es una de ellas",
      "muy pronto podrás recordarlo como una gran victoria.",
      "Nunca nadie ha muerto durante un ataque de ansiedad o pánico.",
      "Nunca nadie ha hecho daño a alguien más durante un ataque de ansiedad o pánico.",
      "A veces no entendemos nuestras emociones, pero debemos apreciarlas",
      "Si ya te ha sucedido esto antes, recuerda que solamente es algo pasajero",
      "Eres una gran persona, verás que esto es una etapa",
      "La ansiedad es algo natural en nosotros",
      "muchas personas sufrieron altos niveles de ansiedad y lo superaron",
      "volver a sentir, es parte del proceso de sanar",
      "siente tu respiración, el aire entrando y saliendo",
      "siente cada parte de tu cuerpo",
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text('Santuario'),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          gradiente,
          Column(
            children: <Widget>[
              Center(
                child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: instruccionesRespiracion()),
              ),
              RotateCircle(),
              SizedBox(
                height: height * .08,
              ),
              Center(
                child: textoAnimado(hola, aleatorio),
              ),
              SizedBox(
                height: height * .05,
              ),
            ],
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MeSientoMejor(),
                      ),
                    );
                  },
                  child: Text('Me siento Mejor'),
                ),
                SizedBox(
                  height: height * .02,
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Me siento Mejorcito'),
                ),
                SizedBox(
                  height: height * .1,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container textoAnimado(List<String> hola, Random aleatorio) {
    return Container(
      child: AnimatedTextKit(
        animatedTexts: [
          fadeAnimated(hola, aleatorio),
          fadeAnimated(hola, aleatorio),
          fadeAnimated(hola, aleatorio),
          fadeAnimated(hola, aleatorio),
          fadeAnimated(hola, aleatorio),
          fadeAnimated(hola, aleatorio),
          fadeAnimated(hola, aleatorio),
          fadeAnimated(hola, aleatorio),
          fadeAnimated(hola, aleatorio),
          fadeAnimated(hola, aleatorio),
          fadeAnimated(hola, aleatorio),
          fadeAnimated(hola, aleatorio),
          fadeAnimated(hola, aleatorio),
          fadeAnimated(hola, aleatorio),
          fadeAnimated(hola, aleatorio),
          fadeAnimated(hola, aleatorio),
          fadeAnimated(hola, aleatorio),
          fadeAnimated(hola, aleatorio),
          fadeAnimated(hola, aleatorio),
          fadeAnimated(hola, aleatorio),
          fadeAnimated(hola, aleatorio),
          fadeAnimated(hola, aleatorio),
          fadeAnimated(hola, aleatorio),
          fadeAnimated(hola, aleatorio),
          fadeAnimated(hola, aleatorio),
          fadeAnimated(hola, aleatorio),
          fadeAnimated(hola, aleatorio),
          fadeAnimated(hola, aleatorio),
          fadeAnimated(hola, aleatorio),
          fadeAnimated(hola, aleatorio),
        ],
        repeatForever: true,
      ),
    );
  }

  Text instruccionesRespiracion() {
    return Text(
      "Pactica tu respiración diafragmática"
      " respira por la nariz, cuando inhales (tomes aire) llévalo a"
      " la boca del estómago lentamente, al exhalar hazlo por la boca"
      " sacando lentamente todo el aire",
      style: TextStyle(fontSize: 20),
    );
  }

  FadeAnimatedText fadeAnimated(List<String> hola, Random aleatorio) {
    return FadeAnimatedText(
      hola[aleatorio.nextInt(11)],
      textAlign: TextAlign.center,
      duration: Duration(seconds: 15),
      textStyle: TextStyle(
          fontSize: 35, fontWeight: FontWeight.bold, color: Colors.blue),
    );
  }
}

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

class RotateCircle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Center(
      child: Container(
        height: width * .6,
        width: width * .6,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(200),
          child: Stack(
            children: [
              Center(
                child: Container(
                  child: AnimatedTextKit(
                    animatedTexts: [
                      ScaleAnimatedText(
                        'INHALA',
                        duration: Duration(milliseconds: 5700),
                        textStyle: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue),
                      ),
                      ScaleAnimatedText(
                        'EXHALA',
                        duration: Duration(milliseconds: 5700),
                        textStyle: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue),
                      ),
                    ],
                    repeatForever: true,
                  ),
                ),
              ),
              SpinPerfect(
                duration: Duration(milliseconds: 13400),
                infinite: true,
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Center(
                      child: Container(
                        height: 270,
                        width: 270,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(200),
                          border: Border.all(color: Colors.blue),
                        ),
                      ),
                    ),
                    Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(200),
                        color: Colors.green,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
