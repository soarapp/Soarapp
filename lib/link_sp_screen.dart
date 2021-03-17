import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:soar_initial_screens/forgot_pass_screen.dart';
import 'package:soar_initial_screens/make_profile_screen.dart';
import 'package:soar_initial_screens/sign_in_screen.dart';
import 'package:soar_initial_screens/themeData.dart';
import 'CommonWidgets.dart';

class LinkSpotifyScreen extends StatefulWidget {
  static const String id = 'linkSpotify';

  @override
  _LinkSpotifyScreenState createState() => _LinkSpotifyScreenState();
}

class _LinkSpotifyScreenState extends State<LinkSpotifyScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          width: double.infinity,
          height: 1600,
          decoration: const BoxDecoration(
            image: DecorationImage(
                alignment: Alignment(-.2, 0),
                image: AssetImage('assets/images/linkSpBackground.png'),
                fit: BoxFit.fill),
          ),
          alignment: Alignment.bottomCenter,
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: SizedBox(),
              ),
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
                              child: InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 0, 0, 50),
                                  child: Tab(
                                    icon: Icon(
                                      Icons.arrow_back_ios,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 5,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "Link Your",
                                        style: TextStyle(
                                            fontSize: 38,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'OpenSans'),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "Music",
                                        style: TextStyle(
                                            fontSize: 38,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'OpenSans'),
                                      ),
                                    ],
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
                                    height: 50,
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
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                              'assets/images/otherSpotifyLogo.png'),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text("Sign In with Spotify",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 18,
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
                              height: 10,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: SizedBox(),
                                ),
                                Expanded(
                                  flex: 4,
                                  child: Text(
                                    "Link Spotify Premium Account",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: SizedBox(),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
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
                                    height: 50,
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
                                      child: Text("SKIP THIS STEP",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18,
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
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ProgressBarButton(
                              colorData: Color(0xFFCDCDCD),
                              width: 10,
                              height: 10,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            ProgressBarButton(
                              colorData: Color(0xFF6AABEF),
                              width: 13,
                              height: 13,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            ProgressBarButton(
                              colorData: Color(0xFFCDCDCD),
                              width: 10,
                              height: 10,
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: SizedBox(),
                      ),
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
