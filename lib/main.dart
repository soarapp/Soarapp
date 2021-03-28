import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import "playlists.dart";
import "playlist.dart";

// void main() {
//   runApp(PlaylistsScreen());
// }
void main() => runApp(MainScreen());

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: PlaylistsScreen.id,
      routes: {
        PlaylistsScreen.id: (context) => PlaylistsScreen(),
        PlaylistScreen.id: (context) => PlaylistScreen(),
      },
    );
  }
}
