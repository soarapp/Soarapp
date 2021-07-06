import 'package:flutter/material.dart';
import 'package:soar_initial_screens/ThemeData/SizingUtils.dart';
import 'package:soar_initial_screens/models/Util/SpotifyUtils.dart';
import 'package:soar_initial_screens/models/Util/StringUtils.dart';
import 'package:soar_initial_screens/models/Util/ColorUtils.dart';
import 'package:soar_initial_screens/CommonWidgetsAndMethods.dart';
import 'package:soar_initial_screens/screens/MyMusic/MoodQuiz.dart';
import 'package:marquee/marquee.dart';
import 'package:soar_initial_screens/screens/MyMusic/playlists.dart';
import 'package:soar_initial_screens/Settings.dart';

//this is the homepage for the app: it contains the playlists which
// the user can play as well as profile settings
//TODO: scale for all screens possible
//TODO: make icons and music buttons actually do what they are intended to do :)
//TODO: make song bar disappear if no song playing

class HomePageScreen extends StatefulWidget {
  static const String id = 'homepage';

  //SpotifyUtils spotifyPlayer;

  HomePageScreen();

  @override
  HomePageSetup createState() => HomePageSetup();
}

class HomePageSetup extends State<HomePageScreen> {
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
              Expanded(flex: 87, child: SizedBox()),
              //favorite song image and title row
              Expanded(
                flex: 700,
                child: Row(
                  children: [
                    Expanded(flex: 40, child: SizedBox()),
                    Expanded(
                        flex: 335,
                        child: Column(
                          children: [
                            Expanded(flex: 284, child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: new BorderRadius.circular(LG_BORDER_RADIUS),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 1,
                                      blurRadius: 3,
                                      offset: Offset(0, 3), // changes position of shadow
                                    ),
                                  ]),
                              child: Column(
                                children: [
                                  Expanded(
                                    flex: 5,
                                    child: Column(
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: SizedBox(),
                                        ),
                                        Expanded(
                                          flex: 4,
                                          child: Row(
                                            children: [
                                              Expanded(
                                                flex: 1,
                                                child: SizedBox(),
                                              ),
                                              Expanded(
                                                flex: 7,
                                                child: Text(
                                                  "My Music",
                                                  style: TextStyle(
                                                    color: Color(0xFF000000),
                                                    fontFamily: 'OpenSans',
                                                    fontSize: MediaQuery.of(context).size.height *
                                                        MED_TXT_SCALER,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                flex: 2,
                                                child: InkWell(
                                                  onTap: () {
                                                    Navigator.of(context).push(
                                                      MaterialPageRoute(
                                                        builder: (context) {
                                                          return SettingsPage();
                                                        },
                                                      ),
                                                    );
                                                  },
                                                  child: Image.asset(settingsIcon, scale: 4),
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
                                    flex: 6,
                                    child:
                                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                                      Expanded(flex: 50, child: SizedBox()),
                                      Expanded(
                                        flex: 199,
                                        child: AspectRatio(
                                          aspectRatio: 1,
                                          child: Container(
                                            decoration: BoxDecoration(
                                                borderRadius: new BorderRadius.circular(28.0),
                                                image: DecorationImage(
                                                  image: AssetImage(favSongImg),
                                                  fit: BoxFit.fill,
                                                ),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.grey.withOpacity(0.5),
                                                    spreadRadius: 1,
                                                    blurRadius: 3,
                                                    offset: Offset(0, 3), // changes position of shadow
                                                  ),
                                                ]),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 17,
                                        child: SizedBox(),
                                      ),
                                      Expanded(
                                        flex: 220,
                                        child: Column(
                                          children: [
                                            Expanded(
                                              flex: 1,
                                              child: SizedBox(),
                                            ),
                                            Expanded(
                                              flex: 3,
                                              child: Text(
                                                currFavSong,
                                                style: TextStyle(
                                                  color: black,
                                                  fontFamily: 'Roboto',
                                                  fontSize: MediaQuery.of(context).size.height *
                                                      TINY_TXT_SCALER *
                                                      1.2,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 3,
                                              child: (favSongName.length > 13)
                                                  ? Marquee(
                                                text: favSongName,
                                                style: TextStyle(
                                                  color: black,
                                                  fontFamily: 'Roboto',
                                                  fontSize: MediaQuery.of(context).size.height *
                                                      SMALL_TXT_SCALER *
                                                      1.5,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                                scrollAxis: Axis.horizontal,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                blankSpace: 20.0,
                                                velocity: 10.0,
                                                //numberOfRounds: 5,
                                                startPadding: 10,
                                              )
                                                  : Text(
                                                favSongName,
                                                style: TextStyle(
                                                  color: black,
                                                  fontFamily: 'Roboto',
                                                  fontSize: MediaQuery.of(context).size.height *
                                                      SMALL_TXT_SCALER *
                                                      1.5,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 3,
                                              child: Text(
                                                favSongArtist,
                                                style: TextStyle(
                                                  color: black,
                                                  fontFamily: 'Roboto',
                                                  fontSize: MediaQuery.of(context).size.height *
                                                      SMALL_TXT_SCALER,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 4,
                                              child: Row(children: [
                                                Expanded(flex: 2, child: SizedBox()),
                                                Expanded(
                                                  flex: 3,
                                                  child: ClipRRect(
                                                    borderRadius:
                                                    new BorderRadius.all(Radius.circular(8)),
                                                    child: Container(
                                                      color: opaqueBlack,
                                                      child: Row(children: [
                                                        Expanded(flex: 1, child: SizedBox()),
                                                        Expanded(
                                                          flex: 6,
                                                          child: TextButton(
                                                            child: (favSongCurrentlyPlaying == true && aSongCurrentlyPlaying == true)
                                                                ? Image.asset(pauseIcon, scale: 5)
                                                                : Image.asset(playIcon, scale: 5),
                                                            onPressed: () {
                                                              //spotifyPlayer.play();

                                                              setState(() {
                                                                if (favSongCurrentlyPlaying == true) {
                                                                  favSongCurrentlyPlaying = false;
                                                                  aSongCurrentlyPlaying = false;
                                                                } else {
                                                                  favSongCurrentlyPlaying = true;
                                                                  aSongCurrentlyPlaying = true;
                                                                  songIsOrWasPlaying = true;
                                                                }
                                                              });
                                                            },
                                                          ),
                                                        ),
                                                        Expanded(flex: 1, child: SizedBox()),
                                                      ]),
                                                    ),
                                                  ),
                                                ),
                                                Expanded(flex: 2, child: SizedBox())
                                              ]),
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: SizedBox(),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(flex: 50, child: SizedBox())
                                    ]),
                                  ),
                                  Expanded(flex: 1, child: SizedBox())
                                ],
                              ),
                            )),
                            Expanded(flex: (songIsOrWasPlaying)
                                ? 50
                                : 79, child: SizedBox()),
                            Expanded(
                                flex: (songIsOrWasPlaying == true) ? 337 : 275,
                                child: playlistBlock(context)),
                          ],
                        )),
                    Expanded(flex: 40, child: SizedBox()),
                  ],
                ),
              ),
              Expanded(
                flex: (songIsOrWasPlaying == true) ? 49 : 42,
                child: SizedBox(),
              ),
              //my playlists block with scroll function
              //song playing bar -> if playing it shows, if not playing it disappears
              Expanded(
                flex: (songIsOrWasPlaying == true) ? 77 : 0,
                child: (songIsOrWasPlaying == true)
                    ? SongPlayingBar()
                    : SizedBox(),
              ),
              //bottom icon bar
              Expanded(
                flex: 69,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: bottomIconBar(context, 3),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

Widget playlistBlock(BuildContext context) {
  return Container(
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: new BorderRadius.circular(LG_BORDER_RADIUS),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 3,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ]),
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
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) {
                                return PlaylistsScreen();
                              },
                            ),
                          );
                        },
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) {
                                  return PlaylistsScreen();
                                },
                              ),
                            );
                          },
                          child: Text(
                            myPlaylists,
                            style: TextStyle(
                              color: Color(0xFF000000),
                              fontFamily: 'OpenSans',
                              fontSize: MediaQuery.of(context).size.height *
                                  SEM_MED_TXT_SCALER,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) {
                                return MoodQuiz();
                              },
                            ),
                          );
                        },
                        child: Icon(
                          Icons.control_point_rounded,
                          color: Colors.black,
                          size: MediaQuery.of(context).size.height *
                              SEM_MED_TXT_SCALER,
                        ),
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
          child: PlaylistOrSongDisplay(playlistNamesList, playlistImagesList),
        ),
      ],
    ),
  );
}


