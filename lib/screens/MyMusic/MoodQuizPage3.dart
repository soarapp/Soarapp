import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:soar_initial_screens/HomePgLanding.dart';
import 'package:soar_initial_screens/ThemeData/SizingUtils.dart';
import 'package:soar_initial_screens/models/Util/StringUtils.dart';
import 'package:soar_initial_screens/models/Util/ColorUtils.dart';
import 'package:soar_initial_screens/screens/MyMusic/playlist.dart';

import '../../CommonWidgets.dart';

class MoodQuizPage3 extends StatefulWidget {
  @override
  MoodQuizPage3Setup createState() => MoodQuizPage3Setup();
}

class MoodQuizPage3Setup extends State<MoodQuizPage3> {
  int blackQuestionButtonPressed = 0;
  int whiteQuestionButtonPressed = 0;

  //1 is my music 2 is discover
  int musicType = 1;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(MediaQuery.of(context).size.width,
          MediaQuery.of(context).size.height),
      builder: () => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          //background image
          body: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minWidth: MediaQuery.of(context).size.width,
                minHeight: MediaQuery.of(context).size.height * 1.9,
              ),
              child: IntrinsicHeight(
                child: Container(
                  //width: double.infinity,
                  //height: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(moodQuizBackground),
                        fit: BoxFit.fill),
                  ),
                  alignment: Alignment.bottomCenter,
                  //the white tab on top of background
                  child: Column(
                    children: [
                      Expanded(
                        flex: 267,
                        child: SizedBox(),
                      ),
                      Expanded(
                        flex: 632,
                        child: Container(
                          //width: double.infinity,
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
                                flex: 85,
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: InkWell(
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                        child: Column(children: [
                                          Expanded(
                                            flex: 1,
                                            child: SizedBox(),
                                          ),
                                          Expanded(
                                            flex: 3,
                                            child: Tab(
                                              icon: Icon(
                                                Icons.arrow_back_ios,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 2,
                                            child: SizedBox(),
                                          ),
                                        ]),
                                      ),
                                    ),
                                    //this is the text asking how you fmoodSoon
                                    Expanded(
                                      flex: 14,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                'How much time do you \nhave to listen?',
                                                style: TextStyle(
                                                    fontSize:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            SEM_MED_TXT_SCALER,
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
                              //drop down box of time to listen
                              Expanded(
                                flex: 30,
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: SizedBox(),
                                    ),
                                    Expanded(
                                      flex: 5,
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                new BorderRadius.circular(
                                                    BORDER_RADIUS),
                                            color: Color(0xFFF1F1F1),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey
                                                    .withOpacity(0.5),
                                                spreadRadius: 1,
                                                blurRadius: 2,
                                                offset: Offset(0,
                                                    2), // changes position of shadow
                                              ),
                                            ]),
                                        child: DropdownButtonHideUnderline(
                                          child: DropdownButton(
                                              value: playlistTimeChosen,
                                              items: [
                                                DropdownMenuItem(
                                                  child: Text("   Select",
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height *
                                                              SMALL_TXT_SCALER,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontFamily:
                                                              'OpenSans')),
                                                  value: 0,
                                                ),
                                                DropdownMenuItem(
                                                  child: Text("   15 minutes",
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height *
                                                              SMALL_TXT_SCALER,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          fontFamily:
                                                              'OpenSans')),
                                                  value: 1,
                                                ),
                                                DropdownMenuItem(
                                                  child: Text("   30 minutes",
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height *
                                                              SMALL_TXT_SCALER,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          fontFamily:
                                                              'OpenSans')),
                                                  value: 2,
                                                ),
                                                DropdownMenuItem(
                                                  child: Text("   45 minutes",
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height *
                                                              SMALL_TXT_SCALER,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          fontFamily:
                                                              'OpenSans')),
                                                  value: 3,
                                                ),
                                                DropdownMenuItem(
                                                  child: Text("   1 hour",
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height *
                                                              SMALL_TXT_SCALER,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          fontFamily:
                                                              'OpenSans')),
                                                  value: 4,
                                                ),
                                                DropdownMenuItem(
                                                  child: Text(
                                                      "   1 hour 15 minutes",
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height *
                                                              SMALL_TXT_SCALER,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          fontFamily:
                                                              'OpenSans')),
                                                  value: 5,
                                                ),
                                                DropdownMenuItem(
                                                  child: Text(
                                                      "   1 hour 30 minutes",
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height *
                                                              SMALL_TXT_SCALER,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          fontFamily:
                                                              'OpenSans')),
                                                  value: 6,
                                                ),
                                                DropdownMenuItem(
                                                  child: Text(
                                                      "   1 hour 45 minutes",
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height *
                                                              SMALL_TXT_SCALER,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          fontFamily:
                                                              'OpenSans')),
                                                  value: 7,
                                                ),
                                                DropdownMenuItem(
                                                  child: Text("   2 hours",
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height *
                                                              SMALL_TXT_SCALER,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          fontFamily:
                                                              'OpenSans')),
                                                  value: 8,
                                                ),
                                              ],
                                              onChanged: (value) {
                                                setState(() {
                                                  playlistTimeChosen = value;
                                                });
                                              }),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: SizedBox(),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: (blackQuestionButtonPressed == 1 ||
                                        whiteQuestionButtonPressed == 1)
                                    ? 5
                                    : 20,
                                child: SizedBox(),
                              ),
                              Expanded(
                                flex: 50,
                                child: Row(children: [
                                  Expanded(
                                    flex: 1,
                                    child: SizedBox(),
                                  ),
                                  //this is the text asking how you fmoodSoon
                                  Expanded(
                                    flex: 5,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              'What type of music do \nyou want to listen to?',
                                              style: TextStyle(
                                                  fontSize:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .height *
                                                          SMALL_TXT_SCALER * 1.2,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: 'OpenSans'),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ]),
                              ),
                              Expanded(
                                flex: 10,
                                child: SizedBox(),
                              ),
                              Expanded(
                                flex:
                                    (blackQuestionButtonPressed == 1) ? 60 : 30,
                                child: Column(
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: SizedBox(),
                                            flex: 1,
                                          ),
                                          Expanded(
                                            flex: 5,
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      new BorderRadius.circular(
                                                          BORDER_RADIUS),
                                                  color: Color(0xFFE1E4EB),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Colors.grey
                                                          .withOpacity(0.5),
                                                      spreadRadius: 1,
                                                      blurRadius: 2,
                                                      offset: Offset(0,
                                                          2), // changes position of shadow
                                                    ),
                                                  ]),
                                              child: Column(
                                                children: [
                                                  Expanded(
                                                    flex: 2,
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              new BorderRadius
                                                                      .circular(
                                                                  BORDER_RADIUS),
                                                          color: (musicType ==
                                                                  1)
                                                              ? tealButton
                                                                  .withOpacity(
                                                                      .9)
                                                              : Color(
                                                                  0xFFF1F1F1),
                                                          boxShadow: [
                                                            BoxShadow(
                                                              color: Colors.grey
                                                                  .withOpacity(
                                                                      .5),
                                                              spreadRadius: 1,
                                                              blurRadius: 2,
                                                              offset: Offset(0,
                                                                  2), // changes position of shadow
                                                            ),
                                                          ]),
                                                      child: TextButton(
                                                        onPressed: () {
                                                          setState(() {
                                                            musicType = 1;
                                                          });
                                                        },
                                                        child: Row(
                                                          children: [
                                                            Expanded(
                                                                flex: 1,
                                                                child:
                                                                    SizedBox()),
                                                            Expanded(
                                                              flex: 19,
                                                              child: Align(
                                                                alignment: Alignment
                                                                    .centerLeft,
                                                                child: Text(
                                                                    'My Music',
                                                                    style: TextStyle(
                                                                        color: (musicType ==
                                                                                1)
                                                                            ? Colors
                                                                                .white
                                                                            : Colors
                                                                                .black,
                                                                        fontSize:
                                                                            MediaQuery.of(context).size.height *
                                                                                SMALL_TXT_SCALER,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .bold,
                                                                        fontFamily:
                                                                            'OpenSans')),
                                                              ),
                                                            ),
                                                            Expanded(
                                                              flex: 3,
                                                              child: InkWell(
                                                                  //give info on what it means to choose my music
                                                                  onTap: () => {
                                                                        setState(
                                                                            () {
                                                                          if (blackQuestionButtonPressed ==
                                                                              0) {
                                                                            blackQuestionButtonPressed =
                                                                                1;
                                                                            whiteQuestionButtonPressed =
                                                                                0;
                                                                          } else {
                                                                            blackQuestionButtonPressed =
                                                                                0;
                                                                          }
                                                                        })
                                                                      },
                                                                  child: Image.asset(
                                                                      (musicType ==
                                                                              1)
                                                                          ? whiteQuestionIcon
                                                                          : blackQuestionIcon,
                                                                      scale:
                                                                          3)),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex:
                                                        (blackQuestionButtonPressed ==
                                                                1)
                                                            ? 3
                                                            : 0,
                                                    child:
                                                        (blackQuestionButtonPressed ==
                                                                1)
                                                            ? Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .all(
                                                                        6.0),
                                                                child: Text(
                                                                    'This option will curate a playlist including songs you have already listened to or saved to playlist on spotify.',
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .black,
                                                                        fontSize:
                                                                            MediaQuery.of(context).size.height *
                                                                                SMALL_TXT_SCALER,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .normal,
                                                                        fontFamily:
                                                                            'OpenSans')),
                                                              )
                                                            : SizedBox(),
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
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 10,
                                child: SizedBox(),
                              ),
                              Expanded(
                                flex:
                                    (whiteQuestionButtonPressed == 1) ? 60 : 30,
                                child: Column(
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: SizedBox(),
                                            flex: 1,
                                          ),
                                          Expanded(
                                            flex: 5,
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      new BorderRadius.circular(
                                                          10.0),
                                                  color: Color(0xFFE1E4EB),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Colors.grey
                                                          .withOpacity(0.5),
                                                      spreadRadius: 1,
                                                      blurRadius: 2,
                                                      offset: Offset(0,
                                                          2), // changes position of shadow
                                                    ),
                                                  ]),
                                              child: Column(
                                                children: [
                                                  Expanded(
                                                    flex: 2,
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              new BorderRadius
                                                                      .circular(
                                                                  10.0),
                                                          color: (musicType ==
                                                                  2)
                                                              ? tealButton
                                                                  .withOpacity(
                                                                      .9)
                                                              : Color(
                                                                  0xFFF1F1F1),
                                                          boxShadow: [
                                                            BoxShadow(
                                                              color: Colors.grey
                                                                  .withOpacity(
                                                                      0.5),
                                                              spreadRadius: 1,
                                                              blurRadius: 2,
                                                              offset: Offset(0,
                                                                  2), // changes position of shadow
                                                            ),
                                                          ]),
                                                      child: TextButton(
                                                        onPressed: () {
                                                          setState(() {
                                                            musicType = 2;
                                                          });
                                                        },
                                                        child: Row(
                                                          children: [
                                                            Expanded(
                                                                flex: 1,
                                                                child:
                                                                    SizedBox()),
                                                            Expanded(
                                                              flex: 19,
                                                              child: Align(
                                                                alignment: Alignment
                                                                    .centerLeft,
                                                                child: Text(
                                                                    'Songs discovered for me',
                                                                    style: TextStyle(
                                                                        color: (musicType ==
                                                                                2)
                                                                            ? Colors
                                                                                .white
                                                                            : Colors
                                                                                .black,
                                                                        fontSize:
                                                                            MediaQuery.of(context).size.height *
                                                                                SMALL_TXT_SCALER,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .bold,
                                                                        fontFamily:
                                                                            'OpenSans')),
                                                              ),
                                                            ),
                                                            Expanded(
                                                              flex: 3,
                                                              child: InkWell(
                                                                  //give info on what it means to choose my music
                                                                  onTap: () => {
                                                                        setState(
                                                                            () {
                                                                          if (whiteQuestionButtonPressed ==
                                                                              0) {
                                                                            whiteQuestionButtonPressed =
                                                                                1;
                                                                            blackQuestionButtonPressed =
                                                                                0;
                                                                          } else {
                                                                            whiteQuestionButtonPressed =
                                                                                0;
                                                                          }
                                                                        })
                                                                      },
                                                                  child: Image.asset(
                                                                      (musicType ==
                                                                              2)
                                                                          ? whiteQuestionIcon
                                                                          : blackQuestionIcon,
                                                                      scale:
                                                                          3)),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex:
                                                        (whiteQuestionButtonPressed ==
                                                                1)
                                                            ? 3
                                                            : 0,
                                                    child:
                                                        (whiteQuestionButtonPressed ==
                                                                1)
                                                            ? Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .all(
                                                                        6.0),
                                                                child: Text(
                                                                    'This option will curate a playlist including new songs recommended for you based on your Spotify listening history.',
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .black,
                                                                        fontSize:
                                                                            MediaQuery.of(context).size.height *
                                                                                SMALL_TXT_SCALER,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .normal,
                                                                        fontFamily:
                                                                            'OpenSans')),
                                                              )
                                                            : SizedBox(),
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
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 20,
                                child: SizedBox(),
                              ),
                              //next button
                              Expanded(
                                flex: 50,
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
                                          child: ReusableButton(
                                            buttonColor: tealButton,
                                            buttonHeight: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                BUTTON_SCALER,
                                            buttonText: "NEXT",
                                            textSize: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                SMALL_TXT_SCALER,
                                            onPressed: () => {
                                              Navigator.of(context).push(
                                                MaterialPageRoute(
                                                  builder: (context) {
                                                    return PlaylistScreen();
                                                  },
                                                ),
                                              ),
                                            },
                                          ),
                                        ),
                                        Expanded(
                                          child: SizedBox(),
                                          flex: 1,
                                        ),
                                      ],
                                    ),
                                    Expanded(
                                      child: SizedBox(),
                                      flex: 10,
                                    ),
                                    //four dots on bottom indicating which page we're on
                                    CircularProgressBar(
                                      currPage: 3,
                                      numPages: 4,
                                      accent: tealButton,
                                    ),
                                    Expanded(
                                      child: SizedBox(),
                                      flex: 5,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
