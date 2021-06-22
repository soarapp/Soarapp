import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:soar_initial_screens/OldFiles/LoggedOutView.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:soar_initial_screens/screens/Registration/MakeProfileScreen.dart';
import 'package:soar_initial_screens/OldFiles/RegisterStepOne.dart';
import 'package:soar_initial_screens/OldFiles/LogIn.dart';
import 'package:soar_initial_screens/OldFiles/SpotifyLogin.dart';
import 'package:soar_initial_screens/OldFiles/AppleMusicLogin.dart';
import 'package:soar_initial_screens/OldFiles/OtherSignUp.dart';
import 'package:soar_initial_screens/OldFiles/ConnectHRDevice.dart';
import 'package:soar_initial_screens/screens/Registration/RegisterScreen.dart';
import 'package:soar_initial_screens/screens/Registration/SignInScreen.dart';
import 'package:soar_initial_screens/SplashScreen.dart';
import 'package:soar_initial_screens/screens/Registration/ForgotPassScreen.dart';
import 'package:soar_initial_screens/screens/Registration/CreateAccScreen.dart';
import 'package:soar_initial_screens/screens/Registration/LinkSpScreen.dart';
import 'package:soar_initial_screens/screens/Registration/SignInErrorScreen.dart';
import 'package:soar_initial_screens/screens/Registration/CheckEmailScreen.dart';
import 'package:soar_initial_screens/screens/Registration/AllSetPage.dart';
import 'package:soar_initial_screens/screens/Registration/ResetPassScreen.dart';
import 'package:soar_initial_screens/HomePgLanding.dart';
import 'package:soar_initial_screens/screens/MyMusic/PlayingNow.dart';
import 'package:soar_initial_screens/screens/MyMusic/Playlists.dart';
import 'package:soar_initial_screens/screens/MyMusic/Playlist.dart';
import 'package:device_preview/device_preview.dart';
import 'package:soar_initial_screens/models/Util/StringUtils.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MainScreen());
}

double screenHeight = 0;
double screenWidth = 0;

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(),
      debugShowCheckedModeBanner: false,
      //locale: DevicePreview.locale(context),
      //builder: DevicePreview.appBuilder,
      // the route that the app directs to when the app first launches
      initialRoute: PlayingNowScreen.id,
      // the other routes for the application
      routes: {
        loggedOutScreenRoute: (context) => LoggedOutScreen(),
        registerOneScreenRoute: (context) => RegisterOneScreen(),
        logInScreenRoute: (context) => LogInScreen(),
        spotifyLogInScreenRoute: (context) => SpotifyLogInScreen(),
        appMusicLogInScreenRoute: (context) => AppMusicLogInScreen(),
        otherSignUpScreenRoute: (context) => OtherSignUpScreen(),
        registerScreenRoute: (context) => RegisterScreen(),
        signInScreenRoute: (context) => SignInScreen(),
        splashScreenRoute: (context) => SplashScreen(),
        forgotPassScreenRoute: (context) => ForgotPassScreen(),
        createAccScreenRoute: (context) => CreateAccScreen(),
        linkSpotifyScreenRoute: (context) => LinkSpotifyScreen(),
        makeProfileScreenRoute: (context) => MakeProfileScreen(),
        signInErrorScreenRoute: (context) => SignInErrorScreen(),
        checkEmailScreenRoute: (context) => CheckEmailScreen(),
        allSetScreenRoute: (context) => AllSetScreen(),
        resetPassScreenRoute: (context) => ResetPassScreen(),
        homePageScreenRoute: (context) => HomePageScreen(),
        playingNowScreenRoute: (context) => PlayingNowScreen(),
        playlistsScreenRoute: (context) => PlaylistsScreen(),
        playlistScreenRoute: (context) => PlaylistScreen(),
      },
    );
  }
}
