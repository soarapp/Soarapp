import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class PlaylistScreen extends StatefulWidget {
  static const String id = "playlist";

  final String name;

  PlaylistScreen({@required this.name});

  @override
  _PlaylistScreenState createState() => _PlaylistScreenState();
}

class _PlaylistScreenState extends State<PlaylistScreen> {
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
                            child: InkWell(
                                child: Icon(
                                  Icons.arrow_back_ios,
                                  size: 30.0,
                                  semanticLabel: 'Back',
                                ),
                                onTap: () {
                                  Navigator.of(context).pop();
                                }),
                          ),
                          Expanded(
                            flex: 1,
                            child: Text(
                              widget.name ?? "Playlist",
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 30.0),
                            child: Icon(
                              Icons.edit_outlined,
                              size: 30.0,
                              semanticLabel: 'Edit Playlist',
                            ),
                          ),
                        ]),
                      ),
                      Expanded(
                        flex: 5,
                        child: ListView(
                          children: [
                            Song(
                              assetImage: AssetImage(
                                  'assets/images/songs/pull_it_together.png'),
                              title: "Pull It Together",
                              artist: "The Greeting Committee",
                            ),
                            Song(
                              assetImage: AssetImage(
                                  'assets/images/songs/mcleans_baby_boy.png'),
                              title: "McLean's Baby Boy",
                              artist: "Neighbor Susan",
                            ),
                            Song(
                              assetImage: AssetImage(
                                  'assets/images/songs/pull_it_together.png'),
                              title: "Pull It Together",
                              artist: "The Greeting Committee",
                            ),
                            Song(
                              assetImage: AssetImage(
                                  'assets/images/songs/mcleans_baby_boy.png'),
                              title: "McLean's Baby Boy",
                              artist: "Neighbor Susan",
                            ),
                            Song(
                              assetImage: AssetImage(
                                  'assets/images/songs/pull_it_together.png'),
                              title: "Pull It Together",
                              artist: "The Greeting Committee",
                            ),
                            Song(
                              assetImage: AssetImage(
                                  'assets/images/songs/mcleans_baby_boy.png'),
                              title: "McLean's Baby Boy",
                              artist: "Neighbor Susan",
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
    return Column(
      children: [
        Divider(),
        Padding(
          padding: const EdgeInsets.only(left: 40.0),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 15.0, bottom: 10.0),
                child: Image(
                  image: assetImage,
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(fontSize: 15),
                    ),
                    Text(
                      artist,
                      style: TextStyle(fontSize: 8),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
