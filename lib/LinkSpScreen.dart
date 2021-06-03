import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:soar_initial_screens/ForgotPassScreen.dart';
import 'package:soar_initial_screens/MakeProfileScreen.dart';
import 'package:soar_initial_screens/SignInScreen.dart';
import 'package:soar_initial_screens/ThemeData/SizingUtils.dart';
import 'package:soar_initial_screens/themeData/ColorUtils.dart';
import 'CommonWidgets.dart';

// This is the Link Spotify screen where users can link their Spotify accounts

class LinkSpotifyScreen extends StatefulWidget {
  static const String id = 'linkSpotify';

  @override
  _LinkSpotifyScreenState createState() => _LinkSpotifyScreenState();
}

class _LinkSpotifyScreenState extends State<LinkSpotifyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // container which holds all components on the screen
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
              alignment: Alignment(-.2, 0),
              image: AssetImage('assets/images/backgrounds/linkSpBackground.png'),
              fit: BoxFit.fill),
        ),
        alignment: Alignment.bottomCenter,
        child: Column(
          children: [
            // the open first half of the screen with the background image
            Expanded(
              flex: 2,
              child: SizedBox(),
            ),
            // the rounded white card bottom half of the screen
            Expanded(
              flex: 2,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(40.0),
                      topLeft: Radius.circular(40.0)),
                  color: Colors.white,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 3,
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            // back button that allows users to navigate to the previous page
                            child: InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(
                                    MediaQuery.of(context).size.height *
                                        HUNDRETH_SCALER *
                                        2,
                                    0,
                                    0,
                                    MediaQuery.of(context).size.height *
                                        HUNDRETH_SCALER *
                                        5),
                                // back button icon
                                child: Tab(
                                  icon: Icon(
                                    Icons.arrow_back_ios,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          // 'Link Your Music' Text
                          Expanded(
                            flex: 5,
                            child: Row(
                              children: [
                                Text(
                                  "Link Your \nMusic",
                                  style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.height *
                                              MED_TXT_SCALER,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'OpenSans'),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: SizedBox(),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: SizedBox(),
                    ),
                    // The part of the screen with the Spotify button
                    // and the text underneath it
                    Expanded(
                      flex: 2,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: SizedBox(),
                                flex: 1,
                              ),
                              Expanded(
                                flex: 5,
                                child: Container(
                                  height: MediaQuery.of(context).size.height *
                                      LG_BUTTON_SCALER,
                                  // the Spotify button
                                  child: ElevatedButton(
                                    onPressed: () {
                                      // Navigator.of(context).push(
                                      //   MaterialPageRoute(
                                      //     builder: (context) {
                                      //       return ConnectHRScreen();
                                      //     },
                                      //   ),
                                      // );
                                    },
                                    // the row within the button where the logo and the
                                    // text will be placed
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                            'assets/images/icons/otherSpotifyLogo.png'),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              40,
                                        ),
                                        Text("Sign In with Spotify",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    SMALL_TXT_SCALER,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'OpenSans')),
                                      ],
                                    ),
                                    style: ElevatedButton.styleFrom(
                                        primary: Color(0xFF1DB954)),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: SizedBox(),
                                flex: 1,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height *
                                HUNDRETH_SCALER *
                                1.5,
                          ),
                          Expanded(
                            flex: 4,
                            child: Center(
                              child: Text(
                                "Link Spotify Premium Account",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: MediaQuery.of(context).size.height *
                                      TINY_TXT_SCALER,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height *
                          HUNDRETH_SCALER *
                          2,
                    ),
                    // The skip this step button
                    Expanded(
                      flex: 2,
                      child: Column(
                        children: [
                          // put in row to space horizontally easily
                          Row(
                            children: [
                              Expanded(
                                child: SizedBox(),
                                flex: 1,
                              ),
                              Expanded(
                                flex: 5,
                                child: Container(
                                  height: MediaQuery.of(context).size.height *
                                      LG_BUTTON_SCALER,
                                  // the button specifically
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) {
                                            return MakeProfileScreen();
                                          },
                                        ),
                                      );
                                    },
                                    child: Text("Skip this Step",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                SMALL_TXT_SCALER,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'OpenSans')),
                                    style: ElevatedButton.styleFrom(
                                        primary: Color(0xFFA5C5E5)),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: SizedBox(),
                                flex: 1,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    // The three dot progress indicator at the bottom of the screen
                    CircularProgressBar(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CircularProgressBar extends StatelessWidget {
  const CircularProgressBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ProgressBarButton(
            colorData: Color(0xFFCDCDCD),
            width: MediaQuery.of(context).size.height * PROG_BAR_SCALER,
            height: MediaQuery.of(context).size.height * PROG_BAR_SCALER,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.height * HUNDRETH_SCALER,
          ),
          ProgressBarButton(
            colorData: Color(0xFF6AABEF),
            width: MediaQuery.of(context).size.height * PROG_BAR_SCALER,
            height: MediaQuery.of(context).size.height * PROG_BAR_SCALER,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.height * HUNDRETH_SCALER,
          ),
          ProgressBarButton(
            colorData: Color(0xFFCDCDCD),
            width: MediaQuery.of(context).size.height * PROG_BAR_SCALER,
            height: MediaQuery.of(context).size.height * PROG_BAR_SCALER,
          ),
        ],
      ),
    );
  }
}
