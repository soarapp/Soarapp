import 'dart:io';

import 'package:flutter/material.dart';
import 'package:soar_initial_screens/logged_out_view.dart';
import 'package:soar_initial_screens/make_profile_screen.dart';
import 'package:soar_initial_screens/register_step_one.dart';
import 'package:soar_initial_screens/log_in_screen.dart';
import 'package:soar_initial_screens/spotify_login.dart';
import 'package:soar_initial_screens/apple_music_login.dart';
import 'package:soar_initial_screens/other_sign_up.dart';
import 'package:soar_initial_screens/connect_hr_device.dart';
import 'package:soar_initial_screens/register_screen.dart';
import 'package:soar_initial_screens/sign_in_screen.dart';
import 'package:soar_initial_screens/splashScreen.dart';
import 'package:soar_initial_screens/forgot_pass_screen.dart';
import 'package:soar_initial_screens/create_acc_screen.dart';
import 'package:soar_initial_screens/link_sp_screen.dart';
import 'package:soar_initial_screens/make_profile_screen.dart';

void main() => runApp(MainScreen());

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
