import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:soarapp/playlist.dart';

class PlaylistsScreen extends StatefulWidget {
  static const String id = 'playlists';

  @override
  _PlaylistsScreenState createState() => _PlaylistsScreenState();
}

class _PlaylistsScreenState extends State<PlaylistsScreen> {
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
                              semanticLabel: 'Back',
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
                              semanticLabel: 'Add Playlist',
                            ),
                          ),
                        ]),
                      ),
                      Expanded(
                        flex: 5,
                        child: ListView(
                          padding: const EdgeInsets.only(bottom: 20),
                          children: [
                            Playlist(
                              assetImage: AssetImage(
                                  'assets/images/playlists/stress_to_relaxation.png'),
                              title: "Stress to Relaxation",
                            ),
                            Playlist(
                              assetImage: AssetImage(
                                  'assets/images/playlists/down_to_lighthearted.png'),
                              title: "Down to Lighthearted",
                            ),
                            Playlist(
                              assetImage: AssetImage(
                                  'assets/images/playlists/tired_to_upbeat.png'),
                              title: "Tired to Upbeat",
                            ),
                            Playlist(
                              assetImage: AssetImage(
                                  'assets/images/playlists/restless_to_sleepy.png'),
                              title: "Restless to Sleepy",
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

class Playlist extends StatelessWidget {
  const Playlist({
    @required this.assetImage,
    @required this.title,
  });

  final AssetImage assetImage;
  final String title;

  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(),
        InkWell(
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: 30.0, right: 15.0, bottom: 10.0),
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
            ),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return PlaylistScreen(name: title);
                  },
                ),
              );
            }),
      ],
    );
  }
}
