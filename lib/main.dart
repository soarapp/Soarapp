import 'package:flutter/material.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart' as DotEnv;

import "package:soar/spotify_utils.dart";
import "package:soar/screens/MyHome/NewHomePage.dart";

void main() async {
  await DotEnv.load();
  runApp(MainScreen());
}

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: SpotifyLoginScreen.id,
      routes: {
        SpotifyLoginScreen.id: (context) => SpotifyLoginScreen(
              redirectScreen: HomePageScreen(),
            ),
        HomePageScreen.id: (context) => HomePageScreen(),
      },
    );
  }
}
