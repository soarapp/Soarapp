import 'package:flutter/material.dart';
import 'package:soar_initial_screens/ThemeData/SizingUtils.dart';
import 'package:soar_initial_screens/models/Util/SpotifyUtils.dart';
import 'package:soar_initial_screens/models/Util/StringUtils.dart';
import 'package:soar_initial_screens/models/Util/ColorUtils.dart';
import 'package:soar_initial_screens/CommonWidgetsAndMethods.dart';
import 'package:soar_initial_screens/screens/MyMusic/MoodQuiz.dart';
import 'package:marquee/marquee.dart';

//this is the homepage for the app: it contains the playlists which
// the user can play as well as profile settings
//TODO: scale for all screens possible
//TODO: make icons and music buttons actually do what they are intended to do :)
//TODO: make song bar disappear if no song playing

class HomePageScreen extends StatefulWidget {
  static const String id = 'homepage';
  // commented  the lines below because they were causing an error:
  // SpotifyUtils spotifyPlayer;
  //
  // HomePageScreen({this.spotifyPlayer});

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
              Expanded(flex: 35, child: SizedBox()),
              //my music bar
              Expanded(
                flex: 65,
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
                          fontSize: MediaQuery.of(context).size.height * TINY_TXT_SCALER,
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
              Expanded(
                flex: 50,
                child: SizedBox(),
              ),
              //favorite song image and title row
              Expanded(
                flex: 199,
                child: Padding(
                  padding: const EdgeInsets.only(left: 55.0, right: 55),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
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
                                      offset: Offset(
                                          0, 3), // changes position of shadow
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
                          flex: 190,
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
                                child: (favSongName.length > 13)
                                    ? Marquee(
                                        text: favSongName,
                                        style: TextStyle(
                                          color: black,
                                          fontFamily: 'Roboto',
                                          fontSize: 24,
                                          fontWeight: FontWeight.normal,
                                        ),
                                        scrollAxis: Axis.horizontal,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        blankSpace: 20.0,
                                        velocity: 10.0,
                                        numberOfRounds: 3,
                                        startPadding: 10,
                                      )
                                    : Text(
                                        favSongName,
                                        style: TextStyle(
                                          color: black,
                                          fontFamily: 'Roboto',
                                          fontSize: 24,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                              ),
                              Expanded(
                                flex: 1,
                                child: (favSongArtist.length > 13)
                                    ? Marquee(
                                  text: favSongArtist,
                                  style: TextStyle(
                                    color: black,
                                    fontFamily: 'Roboto',
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                  ),
                                  scrollAxis: Axis.horizontal,
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  blankSpace: 20.0,
                                  velocity: 10.0,
                                  numberOfRounds: 3,
                                  startPadding: 10,
                                )
                                    : Text(
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
                                          Radius.circular(8)),
                                      child: Container(
                                        color: opaqueBlack,
                                        child: Row(children: [
                                          Expanded(flex: 1, child: SizedBox()),
                                          Expanded(
                                            flex: 5,
                                            child: TextButton(
                                              child: (favSongCurrentlyPlaying ==
                                                      true)
                                                  ? Image.asset(pauseIcon,
                                                      scale: .3)
                                                  : Image.asset(playIcon,
                                                      scale: 1),
                                              onPressed: () {
                                                //spotifyPlayer.play();
                                                setState(() {
                                                  if (favSongCurrentlyPlaying ==
                                                      true) {
                                                    favSongCurrentlyPlaying =
                                                        false;
                                                    aSongCurrentlyPlaying =
                                                        false;
                                                  } else {
                                                    favSongCurrentlyPlaying =
                                                        true;
                                                    aSongCurrentlyPlaying =
                                                        true;
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
                      ]),
                ),
              ),
              Expanded(
                flex: 50,
                child: SizedBox(),
              ),
              //my playlists block with scroll function
              Expanded(
                flex: 337,
                child: Padding(
                  padding: const EdgeInsets.only(left: 60, right: 60),
                  child: playlistBlock(context),
                ),
              ),
              Expanded(
                flex: 40,
                child: SizedBox(),
              ),
              //song playing bar -> if playing it shows, if not playing it disappears
              Expanded(
                flex: 77,
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
                  child: bottomTabNavigator(context, 3),
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
        borderRadius: new BorderRadius.circular(20.0),
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
                          size: 36,
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

// class FavSongBar extends StatefulWidget {
//   SpotifyUtils spotifyPlayer;
//
//   FavSongBar(SpotifyUtils spotifyPlayer) {
//     this.spotifyPlayer = spotifyPlayer;
//   }
//
//   @override
//   _FavSongBar createState() => _FavSongBar(spotifyPlayer);
// }

// class _FavSongBar extends State<FavSongBar> {
//   SpotifyUtils spotifyPlayer;
//
//   _FavSongBar(SpotifyUtils spotifyPlayer) {
//     this.spotifyPlayer = spotifyPlayer;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(left: 55.0, right: 55),
//       child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
//         Expanded(
//           flex: 199,
//           child: AspectRatio(
//             aspectRatio: 1,
//             child: Container(
//               decoration: BoxDecoration(
//                   borderRadius: new BorderRadius.circular(28.0),
//                   image: DecorationImage(
//                     image: AssetImage(favSongImg),
//                     fit: BoxFit.fill,
//                   ),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.grey.withOpacity(0.5),
//                       spreadRadius: 1,
//                       blurRadius: 3,
//                       offset: Offset(0, 3), // changes position of shadow
//                     ),
//                   ]),
//             ),
//           ),
//         ),
//         Expanded(
//           flex: 17,
//           child: SizedBox(),
//         ),
//         Expanded(
//           flex: 190,
//           child: Column(
//             children: [
//               Expanded(
//                 flex: 1,
//                 child: SizedBox(),
//               ),
//               Expanded(
//                 flex: 1,
//                 child:
//                 Text(
//                   currFavSong,
//                   style: TextStyle(
//                     color: black,
//                     fontFamily: 'Roboto',
//                     fontSize: 14,
//                     fontWeight: FontWeight.normal,
//                   ),
//                 ),
//               ),
//               Expanded(
//                 flex: 1,
//                 child: Marquee(
//                   text: favSongName,
//                   style: TextStyle(
//                     color: black,
//                     fontFamily: 'Roboto',
//                     fontSize: 24,
//                     fontWeight: FontWeight.normal,
//                   ),
//                   scrollAxis: Axis.horizontal,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   blankSpace: 20.0,
//                   velocity: 10.0,
//                   //numberOfRounds: 5,
//                   startPadding: 10,
//                 ),
//
//               ),
//               Expanded(
//                 flex: 1,
//                 child: Text(
//                   favSongArtist,
//                   style: TextStyle(
//                     color: black,
//                     fontFamily: 'Roboto',
//                     fontSize: 14,
//                     fontWeight: FontWeight.normal,
//                   ),
//                 ),
//               ),
//               Expanded(
//                 flex: 1,
//                 child: Row(children: [
//                   Expanded(flex: 2, child: SizedBox()),
//                   Expanded(
//                     flex: 2,
//                     child: ClipRRect(
//                       borderRadius: new BorderRadius.all(Radius.circular(8)),
//                       child: Container(
//                         color: opaqueBlack,
//                         child: Row(children: [
//                           Expanded(flex: 1, child: SizedBox()),
//                           Expanded(
//                             flex: 5,
//                             child: TextButton(
//                               child: (favSongCurrentlyPlaying == true)
//                                   ? Image.asset(playIcon, scale: .3)
//                                   : Image.asset(pauseIcon, scale: 1),
//                               onPressed: () {
//                                 //spotifyPlayer.play();
//                                 setState(() {
//                                   if (favSongCurrentlyPlaying == true) {
//                                     favSongCurrentlyPlaying = false;
//                                     aSongCurrentlyPlaying = false;
//                                   } else {
//                                     favSongCurrentlyPlaying = true;
//                                     aSongCurrentlyPlaying = true;
//                                     songIsOrWasPlaying = true;
//                                   }
//                                 });
//                               },
//                             ),
//                           ),
//                           Expanded(flex: 1, child: SizedBox()),
//                         ]),
//                       ),
//                     ),
//                   ),
//                   Expanded(flex: 2, child: SizedBox())
//                 ]),
//               ),
//               Expanded(
//                 flex: 1,
//                 child: SizedBox(),
//               ),
//             ],
//           ),
//         ),
//       ]),
//     );
//   }
// }
