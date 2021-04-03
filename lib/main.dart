import 'dart:io';

import 'package:flutter/material.dart';
import 'package:soar_initial_screens/LoggedOutView.dart';
import 'package:soar_initial_screens/MakeProfileScreen.dart';
import 'package:soar_initial_screens/RegisterStepOne.dart';
import 'package:soar_initial_screens/LogIn.dart';
import 'package:soar_initial_screens/SpotifyLogin.dart';
import 'package:soar_initial_screens/AppleMusicLogin.dart';
import 'package:soar_initial_screens/OtherSignUp.dart';
import 'package:soar_initial_screens/ConnectHRDevice.dart';
import 'package:soar_initial_screens/RegisterScreen.dart';
import 'package:soar_initial_screens/SignInScreen.dart';
import 'package:soar_initial_screens/SplashScreen.dart';
import 'package:soar_initial_screens/ForgotPassScreen.dart';
import 'package:soar_initial_screens/CreateAccScreen.dart';
import 'package:soar_initial_screens/LinkSpScreen.dart';
import 'package:soar_initial_screens/MakeProfileScreen.dart';
import 'package:animations/animations.dart';


void main() => runApp(MainScreen());

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
      ),
      debugShowCheckedModeBanner: false,
      //initialRoute: WelcomeScreen.id,
      initialRoute: SplashScreen.id,
      routes: {
        LoggedOutScreen.id: (context) => LoggedOutScreen(),
        RegisterOneScreen.id: (context) => RegisterOneScreen(),
        LogInScreen.id: (context) => LogInScreen(),
        SpotifyLogInScreen.id: (context) => SpotifyLogInScreen(),
        AppMusicLogInScreen.id: (context) => AppMusicLogInScreen(),
        OtherSignUpScreen.id: (context) => OtherSignUpScreen(),
        ConnectHRScreen.id: (context) => ConnectHRScreen(),
        RegisterScreen.id: (context) => RegisterScreen(),
        SignInScreen.id: (context) => SignInScreen(),
        SplashScreen.id: (context) => SplashScreen(),
        ForgotPassScreen.id: (context) => ForgotPassScreen(),
        CreateAccScreen.id: (context) => CreateAccScreen(),
        LinkSpotifyScreen.id: (context) => LinkSpotifyScreen(),
        MakeProfileScreen.id: (context) => MakeProfileScreen(),
      },
    );
  }
}
