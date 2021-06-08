import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:soar_initial_screens/screens/Registration/ForgotPassScreen.dart';
import 'package:soar_initial_screens/screens/Registration/MakeProfileScreen.dart';
import 'package:soar_initial_screens/screens/Registration/SignInScreen.dart';
import 'package:soar_initial_screens/ThemeData/SizingUtils.dart';
import 'package:soar_initial_screens/themeData/ColorUtils.dart';
import 'package:soar_initial_screens/CommonWidgets.dart';

// This is the Link Spotify screen where users can link their Spotify accounts

// method that serves as a getter for the height of this screen
// for the bouncing animation
double ogHeight = 0;

double getHeight() {
  return ogHeight;
}

class LinkSpotifyScreen extends StatefulWidget {
  static const String id = 'linkSpotify';

  @override
  _LinkSpotifyScreenState createState() => _LinkSpotifyScreenState();
}

class _LinkSpotifyScreenState extends State<LinkSpotifyScreen> {
  @override
  Widget build(BuildContext context) {
    ogHeight = MediaQuery.of(context).size.height;
    return ScreenUtilInit(
      designSize: Size(MediaQuery.of(context).size.width,
          MediaQuery.of(context).size.height),
      builder: () => Scaffold(
        // container which holds all components on the screen
        body: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: MediaQuery.of(context).size.width,
              minHeight: MediaQuery.of(context).size.height,
            ),
            child: IntrinsicHeight(
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      alignment: Alignment(-.2, 0),
                      image:
                          AssetImage('assets/images/backgrounds/linkSpBackground.png'),
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
                    LinkSpCard(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class LinkSpCard extends StatefulWidget {
  LinkSpCard({Key key}) : super(key: key);

  @override
  LinkSpCardState createState() => LinkSpCardState();
}

class LinkSpCardState extends State<LinkSpCard>
    with SingleTickerProviderStateMixin {
  double _height = getHeight() - (getHeight() / 10);

  @override
  void initState() {
    //Start the animation
    Future.delayed(Duration(milliseconds: 100)).then((value) => setState(() {
          _height = getHeight();
        }));
    super.initState();
  }

  Widget build(BuildContext context) {
    return Expanded(
      flex: 4,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(40.0), topLeft: Radius.circular(40.0)),
          color: Colors.white,
        ),
        child: AnimatedContainer(
          //Duration of the animation
          duration: Duration(milliseconds: 600),
          //Animation finish
          curve: Curves.bounceOut,
          width: double.infinity,
          //height pointing to the global variable for the animation
          height: _height,
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
                flex: 1,
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
                                fontSize: MediaQuery.of(context).size.height *
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
              SizedBox(
                height: MediaQuery.of(context).size.height * HUNDRETH_SCALER,
              ),
              // The part of the screen with the Spotify button
              // and the text underneath it
              Expanded(
                flex: 1,
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
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                      'assets/images/icons/otherSpotifyLogo.png'),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 40,
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
                          HUNDRETH_SCALER,
                    ),
                    Center(
                      child: Text(
                        "Link Spotify Premium Account",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: MediaQuery.of(context).size.height *
                              TINY_TXT_SCALER,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height:
                    MediaQuery.of(context).size.height * HUNDRETH_SCALER * 2,
              ),
              // The skip this step button
              Expanded(
                flex: 1,
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
                                      fontSize:
                                          MediaQuery.of(context).size.height *
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
              CircularProgressBar(
                numPages: 3,
                currPage: 2,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * HUNDRETH_SCALER * 3,
              ),
              Expanded(
                child: SizedBox(),
                flex: 3,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
