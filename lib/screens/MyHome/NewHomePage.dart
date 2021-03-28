import 'package:flutter/material.dart';
import 'package:soarapp/models/Util/StringUtils.dart';
import 'package:soarapp/models/Util/ColorUtils.dart';

//this is the homepage for the app: it contains the playlists which
// the user can play as well as profile settings
//TODO: make a playlist to the list a method that takes in song name, pic, and link to music basically
//TODO: scale for all screens possible
//TODO: clean up code and create widget methods to make code cleaner
//TODO: add comments for clarity for others
//TODO: make icons and music buttons actually do what they are intended to do :)
//TODO: make song bar disappear if no song playing

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
  bool songIsPlaying = true;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Stack(
        children: <Widget>[
          //background image placement
          new Container(
            decoration: new BoxDecoration(
              image: new DecorationImage(
                image: new AssetImage(
                  homeBackgroundImg,
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          //everything on top of background
          Column(
            children: [
              Expanded(flex: 1, child: SizedBox()),
              //my music bar
              Expanded(
                flex: 8,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(flex: 1, child: SizedBox()),
                    Expanded(
                      flex: 5,
                      child: Text(
                        myMusic,
                        style: TextStyle(
                          color: Color(0xFF2B2B2B),
                          fontFamily: 'OpenSans',
                          fontWeight: FontWeight.bold,
                          fontSize: 36,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Icon(
                        Icons.more_horiz,
                        color: Color(0xFF2B2B2B),
                        size: 36,
                      ),
                    ),
                  ],
                ),
              ),
              //favorite song image and title row
              Expanded(
                  flex: 12,
                  child: favSongBar(),
              ),
              Expanded(
                flex: 2,
                child: SizedBox(),
              ),
              //my playlists block with scroll function
              Expanded(
                flex: 22,
                child: Row(children: [
                  Expanded(flex: 1, child: SizedBox()),
                  Expanded(
                    flex: 5,
                    child: playlistBlock(),
                  ),
                  Expanded(flex: 1, child: SizedBox()),
                ]),
              ),
              Expanded(
                flex: 2,
                child: SizedBox(),
              ),
              //song playing bar -> if playing it shows, if not playing it disappears
              Expanded(
                flex: 5,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: opaqueBlack,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                          flex: 1,
                          child: FlatButton(
                              child: (songIsPlaying == true)
                                  ? Image.asset(pauseIcon)
                                  : Image.asset(playIcon, scale: .9),
                              onPressed: () {
                                //pause or play song accordingly
                                setState(() {
                                  songIsPlaying =
                                  (songIsPlaying == false) ? true : false;
                                });
                              })),
                      Expanded(
                        flex: 5,
                        child: Column(
                          children: [
                            Expanded(flex: 1, child: SizedBox()),
                            Expanded(
                              flex: 2,
                              child: Text(
                                currSong,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'OpenSans',
                                  fontSize: 18,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Text(
                                currSongArtist,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'OpenSans',
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ),
                            Expanded(flex: 1, child: SizedBox())
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: FlatButton(
                          child: Image.asset(skipIcon),
                          onPressed: () {
                            //at this point skip to the next song in the playlist
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              //bottom icon bar
              Expanded(
                flex: 5,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: bottomIconBar(),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

Widget playlistBar(String imageName, String playlistName) {

  return Container(
    padding: const EdgeInsets.only(left: 20, top: 10, bottom: 10.0),
    decoration: BoxDecoration(
      border: Border(
        bottom: BorderSide(
          //                   <--- left side
          color: Color(0xFF000000).withOpacity(.1),
          width: .5,
        ),
        top: BorderSide(
          //                    <--- top side
          color: Color(0xFF000000).withOpacity(.1),
          width: .5,
        ),
      ),
    ),
    child: Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 7),
          child: Image.asset(imagePath + imageName + jpg, scale: 17),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            playlistName,
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
  );
}

Widget bottomIconBar() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Expanded(flex: 1, child: SizedBox()),
      Expanded(flex: 2, child: FlatButton(child: Image.asset(chatIcon), onPressed:() {
        //navigate to chat page
      })),
      Expanded(flex: 1, child: SizedBox()),
      Expanded(flex: 2, child: FlatButton(child: Image.asset(calendarIcon), onPressed:(){
        //navigate to calendar page
      })),
      Expanded(flex: 1, child: SizedBox()),
      Expanded(flex: 2, child: FlatButton(child: Image.asset(musicIcon), onPressed:(){
        //navigate to music page
      })),
      Expanded(flex: 1, child: SizedBox()),
      Expanded(flex: 2, child: FlatButton(child: Image.asset(questionIcon), onPressed: () {
        //navigate to question page
      })),
      Expanded(flex: 1, child: SizedBox()),
      Expanded(flex: 2, child: FlatButton(child: Image.asset(userIcon), onPressed: () {
        //navigate to profile page
      })),
      Expanded(flex: 1, child: SizedBox()),
    ],
  );
}

Widget playlistBlock() {
  return ClipRRect(
    borderRadius: new BorderRadius.all(Radius.circular(33)),
    child: Container(
      color: Colors.white,
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: Column(
              children: [
                Expanded(
                  flex: 1,
                  child: SizedBox(),
                ),
                Expanded(
                  flex: 3,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: SizedBox(),
                      ),
                      Expanded(
                        flex: 7,
                        child: Text(
                          myPlaylists,
                          style: TextStyle(
                            color: Color(0xFF000000),
                            fontFamily: 'OpenSans',
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Icon(
                          Icons.control_point_rounded,
                          color: Colors.black,
                          size: 36,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: SizedBox(),
                )
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: ListView(
              children: [
                playlistBar('album2', 'Stress to Relaxation'),
                playlistBar('album2', 'Restless to Sleepy'),
                playlistBar('album2', 'Down to Lighthearted'),
                playlistBar('album2', 'Tired to Upbeat'),
                playlistBar('album2', 'Human to SuperHero'),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

Widget favSongBar() {
  bool favSongIsPlaying = false;

  return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 2,
          child: SizedBox(),
        ),
        Expanded(
          flex: 8,
          child: ClipRRect(
            borderRadius:
            new BorderRadius.all(Radius.circular(22)),
            child: Image.asset(favSongImg, scale: 1),
          ),
        ),
        Expanded(
          flex: 1,
          child: SizedBox(),
        ),
        Expanded(
          flex: 8,
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: SizedBox(),
              ),
              Expanded(
                flex: 1,
                child: Text(
                  currFavSong,
                  style: TextStyle(
                    color: black,
                    fontFamily: 'Roboto',
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Text(
                  favSongName,
                  style: TextStyle(
                    color: black,
                    fontFamily: 'Roboto',
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Text(
                  favSongArtist,
                  style: TextStyle(
                    color: black,
                    fontFamily: 'Roboto',
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Row(children: [
                  Expanded(flex: 2, child: SizedBox()),
                  Expanded(
                    flex: 2,
                    child: ClipRRect(
                      borderRadius: new BorderRadius.all(
                          Radius.circular(10)),
                      child: Container(
                        color: opaqueBlack,
                        child: Row(children: [
                          Expanded(flex: 1, child: SizedBox()),
                          Expanded(
                              flex: 2,
                              child: FlatButton(child: Image.asset(playIcon, scale: 1.4), onPressed: () {

                              })),
                          Expanded(flex: 1, child: SizedBox()),
                        ]),
                      ),
                    ),
                  ),
                  Expanded(
                      flex: 2,
                      child: SizedBox()
                  )
                ]),
              ),
              Expanded(
                flex: 1,
                child: SizedBox(),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: SizedBox(),
        ),
      ]);
}
