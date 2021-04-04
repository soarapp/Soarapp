import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:soar_initial_screens/ForgotPassScreen.dart';
import 'package:soar_initial_screens/LinkSpScreen.dart';
import 'package:soar_initial_screens/SignInScreen.dart';
import 'package:soar_initial_screens/themeData/ColorUtils.dart';
import 'CommonWidgets.dart';

// This screen allows the user to customize their profile

class MakeProfileScreen extends StatefulWidget {
  static const String id = 'makeProfile';

  @override
  _MakeProfileScreenState createState() => _MakeProfileScreenState();
}

class _MakeProfileScreenState extends State<MakeProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        // the overarching container that contains the entirety of the components
        // on the screen
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
                alignment: Alignment(-.2, 0),
                image: AssetImage('assets/images/Group1.png'),
                fit: BoxFit.fill),
          ),
          alignment: Alignment.bottomCenter,
          child: Column(
            children: [
              // the top part of the screen where you can see the background
              Expanded(
                flex: 1,
                child: SizedBox(),
              ),
              // the top part of the screen with the 'Create Your Profile' text
              Expanded(
                flex: 2,
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: SizedBox(),
                    ),
                    Expanded(
                      flex: 6,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                "Create",
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
                                "Your Profile",
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
                      flex: 1,
                      child: SizedBox(),
                    ),
                  ],
                ),
              ),
              // the bottom portion of the screen with the white card and all 
              // of the components within the white card
              Expanded(
                flex: 13,
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(40.0),
                        topLeft: Radius.circular(40.0)),
                    color: Colors.white,
                  ),
                  // column within the white card
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // space right above the photo upload portion of the screen
                      Expanded(
                        flex: 1,
                        child: SizedBox(),
                      ),
                      // circular widget with camera icon where users can see their 
                      // current user profile picture and upload a new picture
                      Expanded(
                        flex: 3,
                        child: Column(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Image.asset(
                                'assets/images/defaultCamPhoto.png',
                                width: 160,
                                height: 160,
                              ),
                            ),
                            // space between camera icon logo and the 'Add Photo' text
                            SizedBox(
                              height: 10,
                            ),
                            // The 'Add Photo' text
                            Row(
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: SizedBox(),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: RichText(
                                    text: TextSpan(
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.black,
                                          fontFamily: 'OpenSans'),
                                      children: <TextSpan>[
                                        TextSpan(
                                            text: 'Add Photo',
                                            style: TextStyle(
                                                color: Color(0xFF6AABEF),
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'OpenSans'),
                                            recognizer: TapGestureRecognizer()
                                              ..onTap = () {
                                                Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                    builder: (context) {
                                                      return SignInScreen();
                                                    },
                                                  ),
                                                );
                                              }),
                                      ],
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
                      // the part of the screen where users can enter their name in a text input
                      Expanded(
                        flex: 3,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: SizedBox(),
                                ),
                                // 'Name' text
                                Expanded(
                                    flex: 10,
                                    child: Text(
                                      "Name",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold),
                                    ),),
                                Expanded(
                                  flex: 1,
                                  child: SizedBox(),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: SizedBox(),
                                ),
                                Expanded(
                                  flex: 10,
                                  // the text field where users can enter their name
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Color(0xFFF4F6F9),
                                      borderRadius:
                                          new BorderRadius.circular(10.0),
                                    ),
                                    height: 50,
                                    child: Padding(
                                      padding: EdgeInsets.fromLTRB(8, 14, 0, 0),
                                      child: TextField(
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.only(
                                            bottom: 50 /
                                                2, // HERE THE IMPORTANT PART
                                          ),
                                          border: InputBorder.none,
                                          hintStyle: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 34),
                                        ),
                                      ),
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
                        flex: 6,
                        // the part of the screen where the large card will be placed
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            // using a row to horizontally space out the card
                            Row(
                              children: [
                                Expanded(
                                  child: SizedBox(),
                                  flex: 1,
                                ),
                                // the large card
                                Expanded(
                                  flex: 15,
                                  child: Container(
                                    height: 250,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFFEFAFA),
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          topRight: Radius.circular(10),
                                          bottomLeft: Radius.circular(10),
                                          bottomRight: Radius.circular(10)),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          spreadRadius: 5,
                                          blurRadius: 7,
                                          offset: Offset(0,
                                              3), // changes position of shadow
                                        ),
                                      ],
                                    ),
                                    child:
                                    // will contain all of the widgets inside the large card    
                                    Column(
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: Column(
                                            children: [
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Row(
                                                children: [
                                                  Expanded(
                                                    flex: 1,
                                                    child: SizedBox(),
                                                  ),
                                                  Expanded(
                                                    flex: 10,
                                                    child: Text(
                                                      "What's your favorite song?",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 1,
                                                    child: SizedBox(),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height: 5),
                                              Row(
                                                children: [
                                                  Expanded(
                                                    flex: 1,
                                                    child: SizedBox(),
                                                  ),
                                                  // grey container which contains one of the songs,
                                                  // a hypertext link to add their favorite song, 
                                                  // and a heart button to like the current song they are listening to
                                                  Expanded(
                                                    flex: 15,
                                                    child: Container(
                                                      height: 95,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0xFFE1E4EB),
                                                        borderRadius:
                                                            BorderRadius.only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        10),
                                                                topRight: Radius
                                                                    .circular(
                                                                        10),
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        10),
                                                                bottomRight: Radius
                                                                    .circular(
                                                                        10)),
                                                      ),
                                                      child: Row(
                                                        children: [
                                                          Expanded(
                                                            flex: 1,
                                                            child: SizedBox(),
                                                          ),
                                                          // grey box within the grey rectangle
                                                          Expanded(
                                                            flex: 2,
                                                            child: Container(
                                                              height: 60,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Color(
                                                                    0xFFC7CAD0),
                                                                borderRadius: BorderRadius.only(
                                                                    topLeft: Radius
                                                                        .circular(
                                                                            10),
                                                                    topRight: Radius
                                                                        .circular(
                                                                            10),
                                                                    bottomLeft:
                                                                        Radius.circular(
                                                                            10),
                                                                    bottomRight:
                                                                        Radius.circular(
                                                                            10)),
                                                              ),
                                                            ),
                                                          ),
                                                          // Hypertext that will allow the user to add their favorite song
                                                          Expanded(
                                                            flex: 6,
                                                            child: Row(
                                                              children: [
                                                                Expanded(
                                                                  flex: 1,
                                                                  child:
                                                                      SizedBox(),
                                                                ),
                                                                Expanded(
                                                                  flex: 6,
                                                                  child:
                                                                      RichText(
                                                                    text:
                                                                        TextSpan(
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              9,
                                                                          color: Colors
                                                                              .black,
                                                                          fontFamily:
                                                                              'OpenSans'),
                                                                      children: <
                                                                          TextSpan>[
                                                                        TextSpan(
                                                                            text:
                                                                                'Add Your Favorite Song',
                                                                            style: TextStyle(
                                                                                color: Color(0xFF6AABEF),
                                                                                fontSize: 12,
                                                                                fontWeight: FontWeight.bold,
                                                                                fontFamily: 'OpenSans'),
                                                                            recognizer: TapGestureRecognizer()
                                                                              ..onTap = () {
                                                                                Navigator.of(context).push(
                                                                                  MaterialPageRoute(
                                                                                    builder: (context) {
                                                                                      return SignInScreen();
                                                                                    },
                                                                                  ),
                                                                                );
                                                                              }),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          // Heart icon that user can click to like a song
                                                          Expanded(
                                                            flex: 2,
                                                            child: new Tab(
                                                              icon: new Image
                                                                      .asset(
                                                                  "assets/images/heartIcon.png"),
                                                            ),
                                                          ),
                                                        ],
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
                                        // the part of the screen where the user can enter their bio
                                        Expanded(
                                          flex: 1,
                                          child: Row(
                                            children: [
                                              Expanded(
                                                flex: 3,
                                                child: Column(
                                                  children: [
                                                    SizedBox(
                                                      height: 5,
                                                    ),
                                                    Row(
                                                      children: [
                                                        Expanded(
                                                          flex: 1,
                                                          child: SizedBox(),
                                                        ),
                                                        Expanded(
                                                          flex: 10,
                                                          child: Text(
                                                            "Bio",
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          flex: 1,
                                                          child: SizedBox(),
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(height: 5),
                                                    Row(
                                                      children: [
                                                        Expanded(
                                                          flex: 1,
                                                          child: SizedBox(),
                                                        ),
                                                        Expanded(
                                                          flex: 15,
                                                          child: Container(
                                                            height: 70,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Color(
                                                                  0xFFF4F6F9),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        10),
                                                                topRight: Radius
                                                                    .circular(
                                                                        10),
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        10),
                                                                bottomRight:
                                                                    Radius
                                                                        .circular(
                                                                            10),
                                                              ),
                                                              boxShadow: [
                                                                BoxShadow(
                                                                  color: Colors
                                                                      .grey
                                                                      .withOpacity(
                                                                          0.5),
                                                                  spreadRadius:
                                                                      5,
                                                                  blurRadius: 7,
                                                                  offset: Offset(
                                                                      0,
                                                                      3), // changes position of shadow
                                                                ),
                                                              ],
                                                            ),
                                                            child: Row(
                                                              children: [
                                                                Expanded(
                                                                  flex: 1,
                                                                  child:
                                                                      SizedBox(),
                                                                ),
                                                              ],
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
                                              // the part of the screen where users can enter their social media information
                                              Expanded(
                                                flex: 2,
                                                child: Column(
                                                  children: [
                                                    SizedBox(
                                                      height: 5,
                                                    ),
                                                    Row(
                                                      children: [
                                                        Expanded(
                                                          flex: 1,
                                                          child: SizedBox(),
                                                        ),
                                                        Expanded(
                                                          flex: 10,
                                                          child: Text(
                                                            "Social Media",
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          flex: 1,
                                                          child: SizedBox(),
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(height: 5),
                                                    Row(
                                                      children: [
                                                        Expanded(
                                                          flex: 1,
                                                          child: SizedBox(),
                                                        ),
                                                        Expanded(
                                                          flex: 15,
                                                          child: Container(
                                                            height: 70,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Color(
                                                                  0xFFF4F6F9),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        10),
                                                                topRight: Radius
                                                                    .circular(
                                                                        10),
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        10),
                                                                bottomRight:
                                                                    Radius
                                                                        .circular(
                                                                            10),
                                                              ),
                                                              boxShadow: [
                                                                BoxShadow(
                                                                  color: Colors
                                                                      .grey
                                                                      .withOpacity(
                                                                          0.5),
                                                                  spreadRadius:
                                                                      5,
                                                                  blurRadius: 7,
                                                                  offset: Offset(
                                                                      0,
                                                                      3), // changes position of shadow
                                                                ),
                                                              ],
                                                            ),
                                                            child: Row(
                                                              children: [
                                                                Expanded(
                                                                  flex: 1,
                                                                  child:
                                                                      SizedBox(),
                                                                ),
                                                              ],
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
                                            ],
                                          ),
                                        ),
                                      ],
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
                      Expanded(
                        flex: 1,
                        child: SizedBox(),
                      ),
                      // the create account button and skip this step text
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
                                  child: Column(
                                    children: [
                                      Container(
                                        height: 50,
                                        // the actual button
                                        child: ElevatedButton(
                                          onPressed: () {
                                            Navigator.of(context).push(
                                              MaterialPageRoute(
                                                builder: (context) {
                                                  return LinkSpotifyScreen();
                                                },
                                              ),
                                            );
                                          },
                                          child: Text("CREATE ACCOUNT",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: 'OpenSans')),
                                          style: ElevatedButton.styleFrom(
                                              primary: Color(0xFF6AABEF)),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 7,
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                            flex: 3,
                                            child: SizedBox(),
                                          ),
                                          // skip this step hypertext
                                          Expanded(
                                            flex: 4,
                                            child: RichText(
                                              text: TextSpan(
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.black,
                                                    fontFamily: 'OpenSans'),
                                                children: <TextSpan>[
                                                  TextSpan(
                                                      text: 'Skip this step',
                                                      style: TextStyle(
                                                          color:
                                                              Color(0xFF6AABEF),
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontFamily:
                                                              'OpenSans'),
                                                      recognizer:
                                                          TapGestureRecognizer()
                                                            ..onTap = () {
                                                              Navigator.of(
                                                                      context)
                                                                  .push(
                                                                MaterialPageRoute(
                                                                  builder:
                                                                      (context) {
                                                                    return SignInScreen();
                                                                  },
                                                                ),
                                                              );
                                                            }),
                                                ],
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
                      // the progress bar portion of the screen
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
