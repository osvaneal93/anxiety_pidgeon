import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pidge_on/widgets/custom_appbar.dart';

class SantuarioPrincipal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          gradiente,
          Column(
            children: <Widget>[
              CustomAppBar(),
              SizedBox(
                height: height * .05,
              ),
              RotateCircle(),
              SizedBox(
                height: height * .05,
              ),
              _TituloPlay(height: height),
            ],
          ),
        ],
      ),
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
          "Toca el boton para iniciar",
          style: TextStyle(
              fontSize: 35, fontWeight: FontWeight.bold, color: Colors.blue),
        ),
        SizedBox(
          height: widget.height * .02,
        ),
        FloatingActionButton(
          onPressed: () {
            if (this.isPlaying) {
              playAnimation.reverse();
              this.isPlaying = false;
            } else {
              playAnimation.forward();
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
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Center(
      child: Container(
        height: width * .6,
        width: width * .6,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.blue),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(200),
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
      ),
    );
  }
}
