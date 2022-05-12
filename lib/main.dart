import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OfflineBlog',
      theme: ThemeData(

        primarySwatch: Colors.red,
      ),
      home: AnimatedSplashScreen(
        splash: 'Offline Blog by Abraham Odianjo',
        duration: 2000,
        nextScreen: MyHomePage(title: 'My Feed'),
        splashTransition: SplashTransition.fadeTransition,
        pageTransitionType: PageTransitionType.fade,
        backgroundColor: Colors.red,

      ),
    );
  }
}

