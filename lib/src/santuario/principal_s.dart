import 'dart:math';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:pidge_on/models/audioplayer_model.dart';
import 'package:pidge_on/widgets/custom_appbar.dart';
import 'package:provider/provider.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class SantuarioPrincipal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    Random aleatorio = Random();
    var hola = [
      "Camino lento, pero nunca camino hacia atrás.",
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
      body: Stack(
        children: [
          gradiente,
          Column(
            children: <Widget>[
              CustomAppBar(),
              Center(
                child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Pactica tu respiración diafragmática"
                      " respira por la nariz, cuando inhales (tomes aire) llévalo a"
                      " la boca del estómago lentamente, al exhalar hazlo por la boca"
                      " sacando lentamente todo el aire",
                      style: TextStyle(fontSize: 20),
                    )),
              ),
              RotateCircle(),
              SizedBox(
                height: height * .05,
              ),
              _TituloPlay(height: height),
              SizedBox(
                height: height * .05,
              ),
              Center(
                child: Container(
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
                ),
              ),
            ],
          ),
        ],
      ),
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

class _TituloPlay extends StatefulWidget {
  const _TituloPlay({
    Key key,
    @required this.height,
  }) : super(key: key);

  final double height;

  @override
  __TituloPlayState createState() => __TituloPlayState();
}

class __TituloPlayState extends State<_TituloPlay>
    with SingleTickerProviderStateMixin {
  bool isPlaying = false;
  AnimationController playAnimation;
  @override
  void initState() {
    playAnimation = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
    super.initState();
  }

  @override
  void dispose() {
    this.playAnimation.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Toca el boton para",
          style: TextStyle(
              fontSize: 35, fontWeight: FontWeight.bold, color: Colors.blue),
        ),
        Text(
          "iniciar música",
          style: TextStyle(
              fontSize: 35, fontWeight: FontWeight.bold, color: Colors.blue),
        ),
        SizedBox(
          height: widget.height * .02,
        ),
        FloatingActionButton(
          onPressed: () {
            final audioPlayerModel =
                Provider.of<AudioPlayerModel>(context, listen: false);
            if (this.isPlaying) {
              audioPlayerModel.controller.stop();
              playAnimation.reverse();
              this.isPlaying = false;
            } else {
              playAnimation.forward();
              audioPlayerModel.controller.repeat();
              this.isPlaying = true;
            }
          },
          focusColor: Colors.black,
          child: AnimatedIcon(
              icon: AnimatedIcons.play_pause, progress: playAnimation),
        )
      ],
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
    final audioPlayerModel = Provider.of<AudioPlayerModel>(context);
    double height = MediaQuery.of(context).size.height;
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
