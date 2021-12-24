import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pidge_on/src/pages/onboard_screen.dart';
import 'package:pidge_on/src/pages/onboarding_provider.dart';
import 'package:pidge_on/utils/preferences.dart';
import 'package:pidge_on/widgets/appbar_nueva.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final preferences = Preferences();
  await preferences.initialize();
  await Firebase.initializeApp();
  Firebase.initializeApp().then((value) {
    runApp(MyApp());
  });
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final preferences = Preferences();
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => OnBoardingProvider())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          OnBoarding.routeName: (_) => OnBoarding(),
          AppBarNueva.routeName: (_) => AppBarNueva(),
        },
        initialRoute: preferences.initialPage,
      ),
    );
  }
}
