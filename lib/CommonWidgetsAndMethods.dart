import 'package:flutter/material.dart';
import 'package:soar_initial_screens/ThemeData/SizingUtils.dart';
import 'package:soar_initial_screens/models/Util/StringUtils.dart';
import 'package:soar_initial_screens/models/Util/ColorUtils.dart';
import 'package:soar_initial_screens/models/Util/SpotifyUtils.dart';
import 'package:soar_initial_screens/screens/MyProfile/FAQPage.dart';
import 'package:soar_initial_screens/screens/MyProfile/ResourcesPage.dart';
import 'package:soar_initial_screens/NewHomePage.dart';

//This file includes the widgets and methods:
//PlaylistOrSongDisplay - a dynamic list view that displays the playlists of a user
//SongPlayingBar - the widget at the bottom of the page that shows the song playing and the skip or play button
//BottomIconBar - the widget at the bottom of the page that has all the buttons for seeing the chat or calendar etc.

//this widget is a dynamic listview display of songs and their album covers or of playlists and the playlist image
//it uses a List<String> or song names etc. to create the listview widget
class PlaylistOrSongDisplay extends StatefulWidget {
  List<String> _playlistOrSongNameList;
  List<String> _playlistOrSongImageList;

  PlaylistOrSongDisplay(List<String> playlistOrSongNameList,
      List<String> playlistOrSongImageList) {
    this._playlistOrSongNameList = playlistOrSongNameList;
    this._playlistOrSongImageList = playlistOrSongImageList;
  }

  @override
  State createState() =>
      new PlaylistOrSongList(_playlistOrSongNameList, _playlistOrSongImageList);
}

class PlaylistOrSongList extends State<PlaylistOrSongDisplay> {
  List<String> _playlistOrSongNameList;
  List<String> _playlistOrSongImageList;

  PlaylistOrSongList(List<String> playlistOrSongNameList,
      List<String> playlistOrSongImageList) {
    this._playlistOrSongNameList = playlistOrSongNameList;
    this._playlistOrSongImageList = playlistOrSongImageList;
  }

  @override
  Widget build(BuildContext ctxt) {
    return new ListView.builder(
        itemCount: _playlistOrSongNameList.length,
        itemBuilder: (BuildContext ctxt, int index) {
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
                  child: Image.asset(
                      imagePath + _playlistOrSongImageList[index] + jpg,
                      scale: 17),
                ),
                SizedBox(
                  width:
                      MediaQuery.of(context).size.height * HUNDRETH_SCALER * 2,
                ),
                Flexible(
                  child: Text(
                    _playlistOrSongNameList[index],
                    style: TextStyle(
                      color: Color(0xFF2B2B2B),
                      fontFamily: 'OpenSans',
                      fontSize:
                          MediaQuery.of(context).size.height * SMALL_TXT_SCALER,
                      fontWeight: FontWeight.normal,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    softWrap: false,
                  ),
                ),
              ],
            ),
          );
        });
  }
}

//this is the bar that shows the song playing and allows you to pause or play music
class SongPlayingBar extends StatefulWidget {
  @override
  _SongPlayingBar createState() => _SongPlayingBar();
}

class _SongPlayingBar extends State<SongPlayingBar> {
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: opaqueBlack,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
              flex: 1,
              child: TextButton(
                  child: (aSongCurrentlyPlaying == true)
                      ? Image.asset(pauseIcon, scale: 4.3)
                      : Image.asset(playIcon, scale: 3.4),
                  onPressed: () {
                    //pause or play song accordingly
                    setState(() {
                      aSongCurrentlyPlaying =
                          (aSongCurrentlyPlaying == false) ? true : false;
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
                      fontSize:
                          MediaQuery.of(context).size.height * SMALL_TXT_SCALER,
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
                      fontSize:
                          MediaQuery.of(context).size.height * SMALL_TXT_SCALER,
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
            child: TextButton(
              child: Image.asset(skipIcon, scale: 4.3),
              onPressed: () {
//at this point skip to the next song in the playlist
              },
            ),
          ),
        ],
      ),
    );
  }
}

//this is the icon bar at the bottom of many pages with all the buttons for visiting the profile or the chat etc.
//input blackIcon is that icon that should be in black and not greyed out -> 1 is the first icon 5 is last icon
Widget bottomIconBar(BuildContext context, int blackIcon) {
  return Container(
    decoration: BoxDecoration(color: Colors.white, boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.4),
        spreadRadius: 2,
        blurRadius: 5,
        offset: Offset(3, 0), // changes position of shadow
      ),
    ]),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(flex: 1, child: SizedBox()),
        Expanded(
            flex: 2,
            child: TextButton(
                child: (blackIcon == 1)
                    ? Image.asset(chatIconB, scale: 4.1)
                    : Image.asset(chatIcon, scale: 4.1),
                onPressed: () {
                  //navigate to chat page
                })),
        Expanded(flex: 1, child: SizedBox()),
        Expanded(
            flex: 2,
            child: TextButton(
                child: (blackIcon == 2)
                    ? Image.asset(calendarIconB, scale: 4.1)
                    : Image.asset(calendarIcon, scale: 4.1),
                onPressed: () {
                  //navigate to calendar page
                })),
        Expanded(flex: 1, child: SizedBox()),
        Expanded(
            flex: 2,
            child: TextButton(
                child: (blackIcon == 3)
                    ? Image.asset(musicIconB, scale: 4.1)
                    : Image.asset(musicIcon, scale: 4.1),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return HomePageScreen();
                      },
                    ),
                  );
                })),
        Expanded(flex: 1, child: SizedBox()),
        Expanded(
            flex: 2,
            child: TextButton(
                child: (blackIcon == 4)
                    ? Image.asset(questionIconB, scale: 4.1)
                    : Image.asset(questionIcon, scale: 4.1),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return ResourcesPage();
                      },
                    ),
                  );
                })),
        Expanded(flex: 1, child: SizedBox()),
        Expanded(
            flex: 2,
            child: TextButton(
                child: (blackIcon == 5)
                    ? Image.asset(userIconB, scale: 4.1)
                    : Image.asset(userIcon, scale: 4.1),
                onPressed: () {
                  //navigate to profile page
                  // navigate back to login screen for testing
                  // Navigator.of(context).push(
                  //   MaterialPageRoute(
                  //     builder: (context) {
                  //       return SpotifyLoginScreen();
                  //     },
                  //   ),
                  // );
                })),
        Expanded(flex: 1, child: SizedBox()),
      ],
    ),
  );
}


