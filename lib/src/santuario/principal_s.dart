import 'dart:math';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:pidge_on/src/pages/me_siento_mejor.dart';
import 'package:wakelock/wakelock.dart';

class SantuarioPrincipal extends StatefulWidget {
  @override
  State<SantuarioPrincipal> createState() => _SantuarioPrincipalState();
}

class _SantuarioPrincipalState extends State<SantuarioPrincipal> {
  @override
  Widget build(BuildContext context) {
    Wakelock.enable();
    double height = MediaQuery.of(context).size.height;

    double width = MediaQuery.of(context).size.width;
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
          Column(
            children: <Widget>[
              Container(
                padding:
                    EdgeInsets.only(top: height * .04, bottom: height * .02),
                child: Text(
                  "¿Cómo relajarme?",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: height * .04),
                ),
              ),
              Container(
                child: instruccionesRespiracion(context),
                margin: EdgeInsets.only(
                    left: width * .029,
                    right: width * .025,
                    bottom: height * .040),
              ),
              RotateCircle(),
              SizedBox(
                height: height * .05,
              ),
              Center(
                child: textoAnimado(context, hola, aleatorio),
              ),
              SizedBox(
                height: height * .05,
              ),
            ],
          ),
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MeSientoMejor(),
                      ),
                    );
                  },
                  child: Container(
                    height: height * .06,
                    width: width * .6,
                    decoration: BoxDecoration(
                      color: Colors.green.shade300,
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: Center(
                      child: Text(
                        '¡ME SIENTO MEJOR!',
                        style: TextStyle(
                            fontSize:width * .04,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Caviar',
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: height * .08,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container textoAnimado(context, List<String> hola, Random aleatorio) {
    
    double width = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.only(left: width * .05, right: width * .05),
      child: AnimatedTextKit(
        animatedTexts: [
          fadeAnimated(context, hola, aleatorio),
          fadeAnimated(context, hola, aleatorio),
          fadeAnimated(context, hola, aleatorio),
          fadeAnimated(context, hola, aleatorio),
          fadeAnimated(context, hola, aleatorio),
          fadeAnimated(context, hola, aleatorio),
          fadeAnimated(context, hola, aleatorio),
          fadeAnimated(context, hola, aleatorio),
          fadeAnimated(context, hola, aleatorio),
          fadeAnimated(context, hola, aleatorio),
          fadeAnimated(context, hola, aleatorio),
          fadeAnimated(context, hola, aleatorio),
          fadeAnimated(context, hola, aleatorio),
          fadeAnimated(context, hola, aleatorio),
          fadeAnimated(context, hola, aleatorio),
          fadeAnimated(context, hola, aleatorio),
          fadeAnimated(context, hola, aleatorio),
          fadeAnimated(context, hola, aleatorio),
          fadeAnimated(context, hola, aleatorio),
          fadeAnimated(context, hola, aleatorio),
          fadeAnimated(context, hola, aleatorio),
          fadeAnimated(context, hola, aleatorio),
          fadeAnimated(context, hola, aleatorio),
          fadeAnimated(context, hola, aleatorio),
          fadeAnimated(context, hola, aleatorio),
          fadeAnimated(context, hola, aleatorio),

          
        ],
        repeatForever: true,
      ),
    );
  }

  Text instruccionesRespiracion(context) {
    
    double height = MediaQuery.of(context).size.height;
    return Text(
      "Practica tu respiración diafragmática,"
      " respira por la nariz, cuando inhales (tomes aire) llévalo a"
      " la boca del estómago lentamente, al exhalar hazlo por la boca"
      " sacando lentamente todo el aire. \n Puedes hacerlo mientras escuchas sonidos relajantes.",
      style: TextStyle(
          fontSize: height * .02, fontFamily: "caviar", fontWeight: FontWeight.bold),
    );
  }

  FadeAnimatedText fadeAnimated(context, List<String> hola, Random aleatorio) {
    
    double width = MediaQuery.of(context).size.width;
    return FadeAnimatedText(
      hola[aleatorio.nextInt(11)],
      textAlign: TextAlign.center,
      duration: Duration(seconds: 15),
      textStyle: TextStyle(
          fontSize: width * .05, fontWeight: FontWeight.bold, color: Colors.blue),
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
      colors: [Colors.white, Colors.lightBlue.shade50],
    ),
  ),
);

class RotateCircle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    double height = MediaQuery.of(context).size.height;
    return Center(
      child: Container(
        height: width * .4,
        width: width * .4,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(200),
          child: Stack(
            children: [
              Center(
                child: Container(
                  height: height * .2,
                  width: height * .2,
                  child: Image.asset('assets/pidgeon_trans.png'),
                ),
              ),
              Center(
                child: Container(
                  child: AnimatedTextKit(
                    animatedTexts: [
                      ScaleAnimatedText(
                        'INHALA',
                        duration: Duration(milliseconds: 5700),
                        textStyle: TextStyle(
                            fontSize: width * .05,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue),
                      ),
                      ScaleAnimatedText(
                        'EXHALA',
                        duration: Duration(milliseconds: 5700),
                        textStyle: TextStyle(
                            fontSize: width * .05,
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
                        height: width * .35,
                        width: width * .35,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(200),
                          border: Border.all(color: Colors.blue),
                        ),
                      ),
                    ),
                    Container(
                      height: width * .05,
                      width: width * .05,
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
