import 'package:flutter/material.dart';

//import 'package:spotify_sdk/spotify_sdk.dart';
import 'package:line_icons/line_icons.dart';
import 'package:flutter/services.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

//this is the homepage for the app: it contains the playlists which
// the user can play as well as profile settings
//TODO: make a playlist to the list a method that takes in song name, pic, and link to music basically
//TODO: scale for all screens possible
//TODO: clean up code and create widget methods to make code cleaner
//TODO: add comments for clarity for others
//TODO: make icons and music buttons actually do what they are intended to do :)

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
    return new Scaffold(
      body: new Stack(
        children: <Widget>[
          new Container(
            decoration: new BoxDecoration(
              image: new DecorationImage(
                image: new AssetImage(
                  "images/homeMusic.png",
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          new SizedBox(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 34, top: 20),
                      child: Text(
                        "My Music",
                        style: TextStyle(
                          color: Color(0xFF2B2B2B),
                          fontFamily: 'OpenSans',
                          fontSize: 36,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20, right: 23.0),
                      child: Icon(
                        Icons.more_horiz,
                        color: Color(0xFF2B2B2B),
                        size: 36,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 55.0, top: 10),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 15, top: 20),
                          child: ClipRRect(
                            borderRadius:
                                new BorderRadius.all(Radius.circular(33)),
                            child: Container(
                              color: Colors.transparent,
                              child:
                                  Image.asset('images/favSong.jpg', scale: 2.6),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 50.0),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 15),
                                child: Text(
                                  "Current Favorite Song",
                                  style: TextStyle(
                                    color: Color(0xFF2B2B2B),
                                    fontFamily: 'Roboto',
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ),
                              Text(
                                "TakeCare",
                                style: TextStyle(
                                  color: Color(0xFF2B2B2B),
                                  fontFamily: 'Roboto',
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: Text(
                                  "Beach House",
                                  style: TextStyle(
                                    color: Color(0xFF2B2B2B),
                                    fontFamily: 'Roboto',
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ),
                              ClipRRect(
                                borderRadius:
                                    new BorderRadius.all(Radius.circular(10)),
                                child: Container(
                                  color: Color(0xFF0E192E).withOpacity(.5),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20, right: 20),
                                    child: Icon(
                                      Icons.play_arrow_outlined,
                                      color: Colors.white,
                                      size: 36,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ]),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 15, top: 34),
                  child: Center(
                    child: ClipRRect(
                      borderRadius: new BorderRadius.all(Radius.circular(33)),
                      child: SizedBox(
                        height: 300,
                        width: 300,
                        child: Container(
                          color: Colors.white,
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Text(
                                      "My Playlists",
                                      style: TextStyle(
                                        color: Color(0xFF000000),
                                        fontFamily: 'OpenSans',
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Icon(
                                      Icons.control_point_rounded,
                                      color: Colors.black,
                                      size: 36,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 234,
                                child: ListView(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.only(
                                          left: 20, top: 10, bottom: 10.0),
                                      decoration: BoxDecoration(
                                        border: Border(
                                          bottom: BorderSide(
                                            //                   <--- left side
                                            color: Color(0xFF000000)
                                                .withOpacity(.1),
                                            width: .5,
                                          ),
                                          top: BorderSide(
                                            //                    <--- top side
                                            color: Color(0xFF000000)
                                                .withOpacity(.1),
                                            width: .5,
                                          ),
                                        ),
                                      ),
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(right: 7),
                                            child: Image.asset(
                                                'images/album1.jpg',
                                                scale: 17),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              "Stress to Relaxation",
                                              style: TextStyle(
                                                color: Color(0xFF2B2B2B),
                                                fontFamily: 'OpenSans',
                                                fontSize: 18,
                                                fontWeight: FontWeight.normal,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.only(
                                          left: 20, top: 10, bottom: 10.0),
                                      decoration: BoxDecoration(
                                        border: Border(
                                          bottom: BorderSide(
                                            //                   <--- left side
                                            color: Color(0xFF000000)
                                                .withOpacity(.1),
                                            width: .5,
                                          ),
                                          top: BorderSide(
                                            //                    <--- top side
                                            color: Color(0xFF000000)
                                                .withOpacity(.1),
                                            width: .5,
                                          ),
                                        ),
                                      ),
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(right: 7),
                                            child: Image.asset(
                                                'images/album2.jpg',
                                                scale: 17),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              "Down to Lighthearted",
                                              style: TextStyle(
                                                color: Color(0xFF2B2B2B),
                                                fontFamily: 'OpenSans',
                                                fontSize: 18,
                                                fontWeight: FontWeight.normal,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.only(
                                          left: 20, top: 10, bottom: 10.0),
                                      decoration: BoxDecoration(
                                        border: Border(
                                          bottom: BorderSide(
                                            //                   <--- left side
                                            color: Color(0xFF000000)
                                                .withOpacity(.1),
                                            width: .5,
                                          ),
                                          top: BorderSide(
                                            //                    <--- top side
                                            color: Color(0xFF000000)
                                                .withOpacity(.1),
                                            width: .5,
                                          ),
                                        ),
                                      ),
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(right: 7),
                                            child: Image.asset(
                                                'images/album3.png',
                                                scale: 26),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              "Tired to Upbeat",
                                              style: TextStyle(
                                                color: Color(0xFF2B2B2B),
                                                fontFamily: 'OpenSans',
                                                fontSize: 18,
                                                fontWeight: FontWeight.normal,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.only(
                                          left: 20, top: 10, bottom: 10.0),
                                      decoration: BoxDecoration(
                                        border: Border(
                                          bottom: BorderSide(
                                            //                   <--- left side
                                            color: Color(0xFF000000)
                                                .withOpacity(.1),
                                            width: .5,
                                          ),
                                          top: BorderSide(
                                            //                    <--- top side
                                            color: Color(0xFF000000)
                                                .withOpacity(.1),
                                            width: .5,
                                          ),
                                        ),
                                      ),
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(right: 7),
                                            child: Image.asset(
                                                'images/album4.jpg',
                                                scale: 14),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              "Restless to Sleepy",
                                              style: TextStyle(
                                                color: Color(0xFF2B2B2B),
                                                fontFamily: 'OpenSans',
                                                fontSize: 18,
                                                fontWeight: FontWeight.normal,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.only(
                                          left: 20, top: 10, bottom: 10.0),
                                      decoration: BoxDecoration(
                                        border: Border(
                                          bottom: BorderSide(
                                            //                   <--- left side
                                            color: Color(0xFF000000)
                                                .withOpacity(.1),
                                            width: .5,
                                          ),
                                          top: BorderSide(
                                            //                    <--- top side
                                            color: Color(0xFF000000)
                                                .withOpacity(.1),
                                            width: .5,
                                          ),
                                        ),
                                      ),
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(right: 7),
                                            child: Image.asset(
                                                'images/album5.jpg',
                                                scale: 24),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              "Human to Superhero",
                                              style: TextStyle(
                                                color: Color(0xFF2B2B2B),
                                                fontFamily: 'OpenSans',
                                                fontSize: 18,
                                                fontWeight: FontWeight.normal,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 26.0),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: Color(0xFF0E192E).withOpacity(.5),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Icon(
                            Icons.pause_rounded,
                            color: Colors.white,
                            size: 36,
                          ),
                        ),
                        Column(
                          children: [
                            Text(
                              "Lies We Told",
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'OpenSans',
                                fontSize: 18,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            Text(
                              "Fallen Roses",
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'OpenSans',
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 15.0),
                          child: Icon(
                            Icons.skip_next_outlined,
                            color: Colors.white,
                            size: 36,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 25.0, top: 16, bottom:15.075),
                          child: Icon(
                          Icons.chat_bubble_outline,
                          color: Color(0xFF8C8C8C).withOpacity(.43),
                          size: 35,
                      ),
                        ),
                      Icon(
                        Icons.calendar_today_outlined,
                        color: Color(0xFF8C8C8C).withOpacity(.43),
                        size: 35,
                      ),
                      Icon(
                        Icons.music_note_outlined,
                        color: Color(0xFF8C8C8C),
                        size: 35,
                      ),
                        Icon(
                          Icons.where_to_vote_outlined,
                          color: Color(0xFF8C8C8C).withOpacity(.43),
                          size: 35,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 25.0),
                          child: Icon(
                            Icons.location_history_outlined,
                            color: Color(0xFF8C8C8C).withOpacity(.43),
                            size: 35,
                          ),
                        ),
                  ],
                    ),
                ),
              ],
            ),
          )
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
