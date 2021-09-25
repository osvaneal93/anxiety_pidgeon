import 'package:flutter/material.dart';

void main() => runApp(LeccionUno());

class LeccionUno extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('1.¿Qué es la Ansiedad?'),
        ),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Center(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.network(
                      "https://images.pexels.com/photos/3771135/pexels-photo-3771135.jpeg?cs=srgb&dl=pexels-andrea-piacquadio-3771135.jpg&fm=jpg",
                      loadingBuilder: (context, child, progress) =>
                          progress == null
                              ? child
                              : Center(
                                  child: CircularProgressIndicator(),
                                ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Me he sentido diferente estos días...',
                        style: TextStyle(
                            fontSize: 40, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "¿Qué es la ansiedad?a ansiedad es un sentimiento de miedo, temor e inquietud. Puede hacer que sude, se sienta inquieto y tenso, y tener palpitaciones. Puede ser una reacción normal al estrés. Por ejemplo, puede sentirse ansioso cuando se enfrenta a un problema difícil en el trabajo, antes de tomar un examen o antes de tomar una decisión importante. Si bien la ansiedad puede ayudar a enfrentar una situación, además de darle un impulso de energía o ayudarle a concentrarse, para las personas con trastornos de ansiedad el miedo no es temporal y puede ser abrumadora.Qué son los trastornos de ansiedados trastornos de ansiedad son afecciones en las que la ansiedad no desaparece y puede empeorar con el tiempo. Los síntomas pueden interferir con las actividades diarias, como el desempeño en el trabajo, la escuela y las relaciones entre personas.Cuáles son los tipos de trastornos de ansiedad?xisten varios tipos de trastornos de ansiedad, incluyendo:",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "¿Qué es la ansiedad?a ansiedad es un sentimiento de miedo, temor e inquietud. Puede hacer que sude, se sienta inquieto y tenso, y tener palpitaciones. Puede ser una reacción normal al estrés. Por ejemplo, puede sentirse ansioso cuando se enfrenta a un problema difícil en el trabajo, antes de tomar un examen o antes de tomar una decisión importante. Si bien la ansiedad puede ayudar a enfrentar una situación, además de darle un impulso de energía o ayudarle a concentrarse, para las personas con trastornos de ansiedad el miedo no es temporal y puede ser abrumadora.Qué son los trastornos de ansiedados trastornos de ansiedad son afecciones en las que la ansiedad no desaparece y puede empeorar con el tiempo. Los síntomas pueden interferir con las actividades diarias, como el desempeño en el trabajo, la escuela y las relaciones entre personas.Cuáles son los tipos de trastornos de ansiedad?xisten varios tipos de trastornos de ansiedad, incluyendo:",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "¿Qué es la ansiedad?a ansiedad es un sentimiento de miedo, temor e inquietud. Puede hacer que sude, se sienta inquieto y tenso, y tener palpitaciones. Puede ser una reacción normal al estrés. Por ejemplo, puede sentirse ansioso cuando se enfrenta a un problema difícil en el trabajo, antes de tomar un examen o antes de tomar una decisión importante. Si bien la ansiedad puede ayudar a enfrentar una situación, además de darle un impulso de energía o ayudarle a concentrarse, para las personas con trastornos de ansiedad el miedo no es temporal y puede ser abrumadora.Qué son los trastornos de ansiedados trastornos de ansiedad son afecciones en las que la ansiedad no desaparece y puede empeorar con el tiempo. Los síntomas pueden interferir con las actividades diarias, como el desempeño en el trabajo, la escuela y las relaciones entre personas.Cuáles son los tipos de trastornos de ansiedad?xisten varios tipos de trastornos de ansiedad, incluyendo:",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
