import 'dart:async';
import 'package:flutter/material.dart';
import 'package:soar_initial_screens/register_screen.dart';

class SplashScreen extends StatefulWidget {
  static const String id = 'splash';

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 2),
        () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => RegisterScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              alignment: Alignment(-.2, 0),
              image: AssetImage('assets/images/splash.png'),
              fit: BoxFit.cover),
        ),
        alignment: Alignment.bottomCenter,
        padding: EdgeInsets.only(bottom: 20),
      ),
    );
  }
}
