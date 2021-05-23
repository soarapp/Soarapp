import 'dart:io';

import 'package:flutter/material.dart';
import 'package:soar_initial_screens/OldFiles/LoggedOutView.dart';
import 'package:soar_initial_screens/MakeProfileScreen.dart';
import 'package:soar_initial_screens/OldFiles/RegisterStepOne.dart';
import 'package:soar_initial_screens/OldFiles/LogIn.dart';
import 'package:soar_initial_screens/OldFiles/SpotifyLogin.dart';
import 'package:soar_initial_screens/OldFiles/AppleMusicLogin.dart';
import 'package:soar_initial_screens/OldFiles/OtherSignUp.dart';
import 'package:soar_initial_screens/OldFiles/ConnectHRDevice.dart';
import 'package:soar_initial_screens/RegisterScreen.dart';
import 'package:soar_initial_screens/SignInScreen.dart';
import 'package:soar_initial_screens/SplashScreen.dart';
import 'package:soar_initial_screens/ForgotPassScreen.dart';
import 'package:soar_initial_screens/CreateAccScreen.dart';
import 'package:soar_initial_screens/LinkSpScreen.dart';
import 'package:soar_initial_screens/MakeProfileScreen.dart';
import 'package:animations/animations.dart';
import 'package:soar_initial_screens/SignInErrorScreen.dart';
import 'package:soar_initial_screens/CheckEmailScreen.dart';
import 'package:soar_initial_screens/AllSetPage.dart';
import 'package:soar_initial_screens/ResetPassScreen.dart';
import 'package:device_preview/device_preview.dart';


void main() => runApp(DevicePreview(builder: (context) => MainScreen()));

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return MaterialApp(
      theme: ThemeData(
      ),
      debugShowCheckedModeBanner: false,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      // the route that the app directs to when the app first launches
      initialRoute: SplashScreen.id,
      // the other routes for the application
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
        SignInErrorScreen.id: (context) => SignInErrorScreen(),
        CheckEmailScreen.id: (context) => CheckEmailScreen(),
        AllSetScreen.id: (context) => AllSetScreen(),
        ResetPassScreen.id: (context) => ResetPassScreen(),
      },
    );
  }
}
