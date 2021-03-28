import 'package:flutter/material.dart';

//import 'package:spotify_sdk/spotify_sdk.dart';
import 'package:line_icons/line_icons.dart';
import 'package:flutter/services.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';

//this is the homepage for the app: it contains the playlists which
// the user can play as well as profile settings
//TODO: Make the widget for the playlists a method which can be called to add a new playlist
//TODO: Connect my real spotify playlists to the page as a proof of concept
//TODO: Finish the UI design of app including play button bar in the bottom

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  HomePageSetup createState() => HomePageSetup();
}

class HomePageSetup extends State<HomePage> {
  bool isHeartPressed = false;
  bool isPlayPressed = false;
  Duration _duration = new Duration();
  Duration _position = new Duration();
  AudioPlayer advancedPlayer;
  AudioCache audioCache;

  @override
  void initState() {
    super.initState();
    initPlayer();
  }

  void initPlayer() {
    advancedPlayer = new AudioPlayer();
    audioCache = new AudioCache(fixedPlayer: advancedPlayer);
    // ignore: deprecated_member_use
    advancedPlayer.durationHandler = (d) => setState(() => _duration = d);
    // ignore: deprecated_member_use
    advancedPlayer.positionHandler = (p) => setState(() => _position = p);
  }

  void seekToSecond(int second) {
    Duration newDuration = Duration(seconds: second);
    advancedPlayer.seek(newDuration);
  }

  double setChanged() {
    Duration newDuration = Duration(seconds: 0);
    advancedPlayer.seek(newDuration);
    return 0.0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      //Top bar with text and profile icon/button
      appBar: AppBar(
        title: Row(
          children: [
            Text(
              'Listen to Specially Curated Playlists',
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontFamily: 'Comfortaa',
              ),
            ),
            RawMaterialButton(
              onPressed: null,
              shape: CircleBorder(),
              child: Image(
                image: AssetImage('images/Profile.png'),
              ),
            ),
          ],
        ),
        backgroundColor: Colors.white,
      ),
      //box containing the playlists which the user can choose
      body: Column(
        children: [
          SizedBox(
            height: 65,
          ),
          Center(
            child: SizedBox(
              height: 400,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Color(0xFFF0F0F0),
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(16),
                      //playlist 1
                      child: RawMaterialButton(
                        onPressed: null,
                        child: Image(
                          image: AssetImage('images/Groups.jpg'),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(16),
                      //playlist 2
                      child: RawMaterialButton(
                          onPressed: null,
                          child: Image(
                              image: AssetImage('images/MadeForYou.jpg'))),
                    )
                  ],
                ),
              ),
            ),
          ),
          _SpotifyPlayBar("song", "Anna Gardner"),
        ],
      ),
    );
  }

  Widget _SpotifyPlayBar(String songTitle, String artist) {
    return Column(children: [
      Container(
        padding: EdgeInsets.only(left: 25, right: 25),
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  songTitle,
                  style: TextStyle(
                    color: Colors.grey.shade300,
                    fontFamily: "Comfortaa",
                    fontSize: 24,
                    //fontWeight: FontWeight.bold,
                    wordSpacing: 0.2,
                  ),
                ),
                Text(
                  artist,
                  style: TextStyle(
                    color: Colors.grey.shade400,
                    fontFamily: "Comfortaa",
                    //fontWeight: FontWeight.bold,
                    fontSize: 16,
                    letterSpacing: 0.1,
                  ),
                ),
              ],
            ),
            IconButton(
              icon: (isHeartPressed == true)
                  ? Icon(
                      LineIcons.heart,
                      color: Colors.green,
                      size: 30,
                    )
                  : Icon(
                      LineIcons.heart_o,
                      color: Colors.grey.shade400,
                      size: 30,
                    ),
              onPressed: () {
                setState(() {
                  isHeartPressed = (isHeartPressed == false) ? true : false;
                });
              },
            ),
          ],
        ),
      ),
      Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 5, right: 5),
            width: double.infinity,
            child: SliderTheme(
              data: SliderTheme.of(context).copyWith(
                activeTrackColor: Colors.white,
                inactiveTrackColor: Colors.grey.shade600,
                activeTickMarkColor: Colors.white,
                thumbColor: Colors.white,
                trackHeight: 3,
                thumbShape: RoundSliderThumbShape(
                  enabledThumbRadius: 4,
                ),
              ),
              child: Slider(
                value: (_position.inSeconds.toDouble() !=
                        _duration.inSeconds.toDouble())
                    ? _position.inSeconds.toDouble()
                    : setChanged(),
                min: 0,
                max: _duration.inSeconds.toDouble(),
                onChanged: (double value) {
                  setState(() {
                    seekToSecond(value.toInt());
                    value = value;
                  });
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25, right: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "${_position.inMinutes.toInt()}:${(_position.inSeconds % 60).toString().padLeft(2, "0")}",
                  style: TextStyle(
                    color: Colors.grey.shade400,
                    fontFamily: "ProximaNovaThin",
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "${_duration.inMinutes.toInt()}:${(_duration.inSeconds % 60).toString().padLeft(2, "0")}",
                  style: TextStyle(
                    color: Colors.grey.shade400,
                    fontFamily: "ProximaNovaThin",
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      Container(
        padding: EdgeInsets.only(left: 22, right: 22),
        width: double.infinity,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Icon(
              LineIcons.random,
              color: Colors.grey.shade400,
            ),
            Icon(
              Icons.skip_previous,
              color: Colors.grey.shade400,
              size: 40,
            ),
            Container(
              height: 90,
              width: 90,
              child: Center(
                child: IconButton(
                  iconSize: 70,
                  alignment: Alignment.center,
                  icon: (isPlayPressed == true)
                      ? Icon(
                          Icons.pause_circle_filled,
                          color: Colors.grey.shade400,
                        )
                      : Icon(
                          Icons.play_circle_filled,
                          color: Colors.grey.shade400,
                        ),
                  onPressed: () {
                    setState(() {
                      isPlayPressed = isPlayPressed == false ? true : false;
                      if (isPlayPressed == true) {
                        print("Playing .....");
                        audioCache.play(
                          'Dil Bechara - Title Song.mp3',
                        );
                      } else {
                        print("Paused .....");
                        advancedPlayer.pause();
                      }
                    });
                  },
                ),
              ),
            ),
            Icon(
              Icons.skip_next,
              color: Colors.grey.shade400,
              size: 40,
            ),
            Icon(
              LineIcons.repeat,
              color: Colors.grey.shade400,
            ),
          ],
        ),
      ),
      Container(
        padding: EdgeInsets.only(left: 22, right: 22),
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Icon(
              LineIcons.desktop,
              color: Colors.grey.shade400,
            ),
            Icon(
              LineIcons.list_alt,
              color: Colors.grey.shade400,
            ),
          ],
        ),
      ),
    ]);
  }
}
