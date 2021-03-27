import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class PLaylistScreen extends StatefulWidget {
  static const String id = 'playlist';

  @override
  _PlaylistScreenState createState() => _PlaylistScreenState();
}

class _PlaylistScreenState extends State<PLaylistScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
                alignment: Alignment(0, 0),
                image: AssetImage('assets/images/playlistsBackground.png'),
                fit: BoxFit.cover),
          ),
          alignment: Alignment.bottomCenter,
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: SizedBox(),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(40.0),
                      topLeft: Radius.circular(40.0),
                    ),
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Row(children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 30.0),
                            child: Icon(
                              Icons.arrow_back_ios,
                              size: 30.0,
                              semanticLabel:
                                  'Text to announce in accessibility modes',
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Text(
                              "My Playlists",
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 30.0),
                            child: Icon(
                              Icons.add_circle_outline,
                              size: 30.0,
                              semanticLabel:
                                  'Text to announce in accessibility modes',
                            ),
                          ),
                        ]),
                      ),
                      Expanded(
                        flex: 5,
                        child: ListView(
                          padding: const EdgeInsets.only(left: 40, bottom: 20),
                          children: [
                            Song(
                              assetImage: AssetImage('assets/images/song1.png'),
                              title: "Pull It Together",
                              artist: "The Greeting Committee",
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Song extends StatelessWidget {
  const Song({
    @required this.assetImage,
    @required this.title,
    @required this.artist,
  });

  final AssetImage assetImage;
  final String title;
  final String artist;

  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 15.0, bottom: 10.0),
          child: Image(
            image: assetImage,
          ),
        ),
        Expanded(
          child: Text(
            title,
            style: TextStyle(fontSize: 15),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 40.0),
          child: Icon(Icons.more_horiz),
        ),
      ],
    );
  }
}
