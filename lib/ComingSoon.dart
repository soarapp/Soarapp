import 'package:flutter/material.dart';
import 'package:soar_initial_screens/ThemeData/SizingUtils.dart';
import 'package:soar_initial_screens/models/Util/SpotifyUtils.dart';
import 'package:soar_initial_screens/models/Util/StringUtils.dart';
import 'package:soar_initial_screens/models/Util/ColorUtils.dart';
import 'package:soar_initial_screens/CommonWidgetsAndMethods.dart';
import 'package:soar_initial_screens/screens/MyMusic/MoodQuiz.dart';
import 'package:marquee/marquee.dart';
import 'package:soar_initial_screens/screens/MyMusic/playlists.dart';

//this is the comingSoon for the app: it contains the playlists which
// the user can play as well as profile settings
//TODO: scale for all screens possible
//TODO: make icons and music buttons actually do what they are intended to do :)
//TODO: make song bar disappear if no song playing

class ComingSoonScreen extends StatefulWidget {
  static const String id = 'comingSoon';
  //SpotifyUtils spotifyPlayer;
  int chatOrCal;
  ComingSoonScreen(int chatOrCal){
    this.chatOrCal = chatOrCal;
  }

  @override
  ComingSoonSetup createState() => ComingSoonSetup(chatOrCal);
}

class ComingSoonSetup extends State<ComingSoonScreen> {
  int chatOrCal;
  ComingSoonSetup(int chatOrCal) {
    this.chatOrCal = chatOrCal;
  }
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
                  comingSoonBackground,
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          //everything on top of background
          Column(
            children: [
              Expanded(
                flex: 223,
                child: SizedBox(),
              ),
              Expanded(
                flex: 400,
                child:Row(
                  children: [
                    Expanded(
                      flex: 27,
                      child: SizedBox(),
                    ),
                    Expanded(
                      flex: 360,
                      child:Container(
                        decoration: BoxDecoration(
                            borderRadius: new BorderRadius.circular(28),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 1,
                                blurRadius: 3,
                                offset: Offset(0, 3), // changes position of shadow
                              ),
                            ]),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            children: [
                              Expanded(
                                flex: 7,
                                child: Image.asset(cautionIcon, scale: 4),
                              ),
                              Expanded(
                                flex: 1,
                                child: SizedBox(),
                              ),
                              Expanded(
                                flex: 3,
                                child: Text('Coming Soon',
                                  style: TextStyle(
                                      fontSize: MediaQuery.of(context).size.height * MED_TXT_SCALER,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'OpenSans'),),
                              ),
                              Expanded(
                                flex: 1,
                                child: Text('We’re still working on this feature! ',
                                  style: TextStyle(
                                      fontSize: MediaQuery.of(context).size.height * SMALL_TXT_SCALER,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'OpenSans'),),
                              ),
                              Expanded(
                                flex: 1,
                                child: Text(
                                    'Check back soon for updates.',
                                  style: TextStyle(
                                      fontSize: MediaQuery.of(context).size.height * SMALL_TXT_SCALER,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'OpenSans'),),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 27,
                      child: SizedBox(),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 225,
                child: SizedBox(),
              ),
              //bottom icon bar
              Expanded(
                flex: 69,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: (chatOrCal == 1)
    ? bottomIconBar(context, 1)
                  : bottomIconBar(context, 2),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}