import 'package:flutter/material.dart';
import 'package:pidge_on/utils/preferences.dart';
import 'package:pidge_on/widgets/appbar_nueva.dart';
import 'package:provider/provider.dart';

import 'onboarding_provider.dart';

class OnBoardSteps extends StatelessWidget {
  @required
  final String title;
  @required
  final String subtitle;
  @required
  final String image;

  @required
  final String image2;

  const OnBoardSteps({this.title, this.subtitle, this.image, this.image2});

  @override
  Widget build(BuildContext context) {
    var screenH = MediaQuery.of(context).size.height;

    var screenW = MediaQuery.of(context).size.width;
    final preferences = Preferences();
    var onBoardingProvider = Provider.of<OnBoardingProvider>(context);
    return Container(
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenW * .1),
          child: Column(
            children: [
              SizedBox(
                height: screenH * .02,
              ),
              Container(
                child: Image.asset(image),
                height: screenH * .2,
                width: screenH * .2,
              ),
              SizedBox(
                height: screenH * .02,
              ),
              Text(
                title,
                style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Caviar'),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                subtitle,
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Caviar'),
              ),
              SizedBox(
                height: screenH * .02,
              ),
              Container(
                height: screenH * .2,
                width: screenW * .8,
                child: Image.asset(image2),
              ),
              SizedBox(
                height: screenH * .02,
              ),
              if (onBoardingProvider.currentPage == 3)
                GestureDetector(
                  onTap: () {
                    preferences.initialPage = AppBarNueva.routeName;
                    Navigator.pushReplacementNamed(
                        context, AppBarNueva.routeName);
                  },
                  child: Container(
                    height: screenH * .05,
                    width: screenW * .5,
                    decoration: BoxDecoration(
                      color: Colors.blue.shade400,
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: Center(
                      child: Text(
                        'COMENCEMOS',
                        style: TextStyle(
                            fontSize: 20,
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
      ),
    );
  }
}
