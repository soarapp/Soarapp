import 'dart:async';
import 'package:flutter/material.dart';
import 'package:soar_initial_screens/RegisterScreen.dart';

// this is the splash screen for the application

class SplashScreen extends StatefulWidget {
  static const String id =
      'splash'; // assigning an ID that will be used in page routes

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // initState() is the state of the application when it launches
    super.initState();
    Timer(
      Duration(seconds: 2), // display splash screen for two seconds
      // using the navigator to replace the screen with the login screen
      () => Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (BuildContext context) => RegisterScreen(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // widget tree which renders the image as the splash screen
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              alignment: Alignment(-.2, 0),
              image: AssetImage('assets/images/backgrounds/splash.png'),
              // BoxFit.cover allows it to expand and fill the screen
              fit: BoxFit.cover),
        ),
        alignment: Alignment.bottomCenter,
        padding: EdgeInsets.only(bottom: 20),
      ),
    );
  }
}
