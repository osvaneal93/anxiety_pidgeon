import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pidge_on/src/pages/onboard_steps.dart';
import 'package:pidge_on/src/pages/onboarding_provider.dart';
import 'package:provider/provider.dart';

class OnBoarding extends StatelessWidget {
  static final String routeName = 'onboarding';

  @override
  Widget build(BuildContext context) {
    var screenH = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          PageMix(),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.only(bottom: screenH * .1),
              child: _Dots(),
            ),
          )
        ],
      ),
    );
  }
}

class PageMix extends StatelessWidget {
  const PageMix({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var onBoardingProvider = Provider.of<OnBoardingProvider>(context);
    return Stack(
      children: [
        _fondoApp(context),
        PageView(
          onPageChanged: (int index) {
            onBoardingProvider.currentPage = index;
          },
          children: [
            OnBoardSteps(
              image: 'assets/pidgeon.png',
              image2: 'assets/flecha.png',
              title: 'Bienvenido a PidgeOn',
              subtitle:
                  'En esta aplicacion encontrarás lecciones y tips que te acompañarán en tu proceso para superar la ansiedad, además de diversas actividades para que vuelvas a sentirte mejor, tendrás distintas secciones.',
            ),
            OnBoardSteps(
              image: 'assets/pidgeon.png',
              image2: 'assets/lecciones.png',
              title: 'Lecciones',
              subtitle:
                  'En la sección de lecciones podrás encontrar métodos, tips y actividades. \nPuedes leer unas cuantas lecciones a diario y poner en práctica lo que aprendes, te recomendamos seguir el orden que llevan.',
            ),
            OnBoardSteps(
              image: 'assets/pidgeon.png',
              image2: 'assets/registro.png',
              title: 'Registro',
              subtitle:
                  '¿Sabías lo importante que es registrar cómo te sientes, lo que piensas, tus avances y todo lo que quieras expresar?, es una fomra terapéutica de poder desahogarnos, o bien, de tener en cuenta los avances que llevamos. \nEn esta sección podrás llevar un registro de todo lo que quieras y necesites escribir.',
            ),
            OnBoardSteps(
              image: 'assets/pidgeon.png',
              image2: 'assets/santuario.png',
              title: 'Santuario',
              subtitle:
                  'Vamos a tomarnos un minuto, en esta sección encontrarás una técnica de relajación basada en la respiración, acompañada de textos útiles, puedes probarla escuchando la música que te relaja',
            ),
          ],
        ),
      ],
    );
  }

  Widget _fondoApp(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    
    double width = MediaQuery.of(context).size.width;
    final cuadrito = Container(
      height: height * .1,
      width: height * .1,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(250),
          color: Colors.blue.shade100),
    );

    return Stack(
      children: <Widget>[
        Positioned(
          child: cuadrito,
          top: height * .45,
        ),
        Positioned(
          child: cuadrito,
          top: height * .15,
        ),
        Positioned(
          child: cuadrito,
          top: height * .3,
          right: height * .15,
        ),
        Positioned(
          child: cuadrito,
          top: height * .4,
          right: height * .05,
        ),
        Positioned(
          child: cuadrito,
          top: height * .1,
          right: height * .1,
        ),
        Positioned(
          child: Container(
            height: height * .1,
            width: height * .1,
            child: Image.asset('assets/pidgeon_trans.png'),
          ),
          top: height * .9,
          left: width * .8,
        )
      ],
    );
  }
}

class _Dots extends StatelessWidget {
  const _Dots({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var onBoardingProvider = Provider.of<OnBoardingProvider>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Dot(
          active: onBoardingProvider.currentPage == 0,
        ),
        SizedBox(
          width: 20,
        ),
        Dot(
          active: onBoardingProvider.currentPage == 1,
        ),
        SizedBox(
          width: 20,
        ),
        Dot(
          active: onBoardingProvider.currentPage == 2,
        ),
        SizedBox(
          width: 20,
        ),
        Dot(
          active: onBoardingProvider.currentPage == 3,
        ),
        SizedBox(
          width: 20,
        ),
      ],
    );
  }
}

class Dot extends StatelessWidget {
  final bool active;
  const Dot({
    Key key,
    this.active,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 10,
      width: 10,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: active ? Colors.red : Colors.blueGrey,
      ),
    );
  }
}
