import 'package:flutter/material.dart';
import 'package:soar_initial_screens/ThemeData/SizingUtils.dart';
import 'package:soar_initial_screens/models/Util/StringUtils.dart';
import 'package:soar_initial_screens/models/Util/ColorUtils.dart';
import 'package:soar_initial_screens/screens/MyMusic/MoodQuizPage3.dart';
import 'package:soar_initial_screens/CommonWidgetsAndMethods.dart';

class MusicTherapyScreen extends StatelessWidget {
  static const String id = 'musicTherapy';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MusicTherapyPage(),
    );
  }
}

class MusicTherapyPage extends StatefulWidget {
  @override
  MusicTherapyPageSetup createState() => MusicTherapyPageSetup();
}

class MusicTherapyPageSetup extends State<MusicTherapyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //background image
      body: Container(
        //width: double.infinity,
        //height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(resourcesBackground), fit: BoxFit.fill),
        ),
        alignment: Alignment.bottomCenter,
        //the white tab on top of background
        child: Column(
          children: [
            Expanded(
              flex: 255,
              child: SizedBox(),
            ),
            Expanded(
              flex: 640,
              child: Container(
                //width: double.infinity,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 1,
                      blurRadius: 3,
                      offset: Offset(1, 0), // changes position of shadow
                    ),
                  ],
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(40.0),
                      topLeft: Radius.circular(40.0)),
                  color: Colors.white,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 170,
                      child: Row(
                        children: [
                          Expanded(
                            flex: 23,
                            child: SizedBox(),
                          ),
                          Expanded(
                            flex: 12,
                            child: InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Column(children: [
                                Expanded(
                                  flex: 25,
                                  child: SizedBox(),
                                ),
                                Expanded(
                                  flex: 18,
                                  child: Tab(
                                    icon: Icon(
                                      Icons.arrow_back_ios,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 41,
                                  child: SizedBox(),
                                ),
                              ]),
                            ),
                          ),
                          //this is the text asking how you fmoodSoon
                          Expanded(
                            flex: 270,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Music Therapy',
                                  style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.height *
                                              MED_TXT_SCALER,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'OpenSans'),
                                ),
                                Text(
                                  'Resources',
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
                            flex: 32,
                            child: SizedBox(),
                          ),
                        ],
                      ),
                    ),
                    //entire box with the mood options that you can click
                    Expanded(
                      flex: 479,
                      child: FAQDisplayMusicTherapy(45),
                    ),
                    //button for 'none of these describe my mood'
                    Expanded(
                      flex: 69,
                      child: bottomIconBar(context, 4),
                    ),
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

// ignore: must_be_immutable
class FAQDisplayMusicTherapy extends StatefulWidget {
  int questionNum;

  FAQDisplayMusicTherapy(int questionNum) {
    this.questionNum = questionNum;
  }

  @override
  State createState() => new QuestionListMusicTherapy(questionNum);
}

class QuestionListMusicTherapy extends State<FAQDisplayMusicTherapy> {
  int questionNum;

  QuestionListMusicTherapy(int questionNum) {
    this.questionNum = questionNum;
  }

  @override
  Widget build(BuildContext ctxt) {
    return new ListView.builder(
        itemCount: questions.length,
        itemBuilder: (BuildContext ctxt, int index) {
          return Container(
            padding: const EdgeInsets.only(left: 20, top: 10, bottom: 10.0),
            decoration: BoxDecoration(
              color: (questionNum == index) ? Color(0xFFE4F2FC) : Colors.white,
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
            alignment: Alignment.center,
            child: (questionNum == index)
                ? Column(
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            (questionNum == index)
                                ? questionNum = 45
                                : questionNum = index;
                          });
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              flex: 9,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 5.0, bottom: 5.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      musicTherapyResourcesAbbreviations[index],
                                      style: TextStyle(
                                        color: Color(0xFF6AABEF),
                                        fontFamily: 'OpenSans',
                                        fontSize:
                                            MediaQuery.of(context).size.height *
                                                SEM_MED_TXT_SCALER,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      musicTherapyResources[index],
                                      style: TextStyle(
                                        color: Color(0xFF6AABEF),
                                        fontFamily: 'OpenSans',
                                        fontSize:
                                            MediaQuery.of(context).size.height *
                                                SMALL_TXT_SCALER,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(
                                  MediaQuery.of(context).size.height *
                                      HUNDRETH_SCALER,
                                  MediaQuery.of(context).size.height *
                                      HUNDRETH_SCALER,
                                  MediaQuery.of(context).size.height *
                                      HUNDRETH_SCALER *
                                      2,
                                  MediaQuery.of(context).size.height *
                                      HUNDRETH_SCALER),
                              child: Container(
                                  width: MediaQuery.of(context).size.height *
                                      SMALL_TXT_SCALER,
                                  child: Image.asset(upArrow)),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 18.0),
                        child: Text(
                          musicTherapyResourcesDetails[index],
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'OpenSans',
                            fontSize: MediaQuery.of(context).size.height *
                                SMALL_TXT_SCALER,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 13.0),
                        child: InkWell(
                          child: Row(
                            children: [
                              Expanded(
                                  flex: 1,
                                  child:
                                      Image.asset(bluePaperclipIcon, scale: 4)),
                              Expanded(
                                flex: 13,
                                child: Text(
                                  musicTherapyResourcesLinks[index],
                                  style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    color: Color(0xFF6AABEF),
                                    fontFamily: 'OpenSans',
                                    fontSize:
                                        MediaQuery.of(context).size.height *
                                            SMALL_TXT_SCALER,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  )
                : InkWell(
                    onTap: () {
                      setState(() {
                        questionNum = index;
                      });
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                musicTherapyResourcesAbbreviations[index],
                                style: TextStyle(
                                  color: Color(0xFF6AABEF),
                                  fontFamily: 'OpenSans',
                                  fontSize: MediaQuery.of(context).size.height *
                                      SEM_MED_TXT_SCALER,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                musicTherapyResources[index],
                                style: TextStyle(
                                  color: Color(0xFF6AABEF),
                                  fontFamily: 'OpenSans',
                                  fontSize: MediaQuery.of(context).size.height *
                                      SMALL_TXT_SCALER,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(
                              MediaQuery.of(context).size.height *
                                  HUNDRETH_SCALER,
                              MediaQuery.of(context).size.height *
                                  HUNDRETH_SCALER,
                              MediaQuery.of(context).size.height *
                                  HUNDRETH_SCALER *
                                  2,
                              MediaQuery.of(context).size.height *
                                  HUNDRETH_SCALER),
                          child: Container(
                              width: MediaQuery.of(context).size.height *
                                  SMALL_TXT_SCALER,
                              child: Image.asset(downArrow)),
                        ),
                      ],
                    ),
                  ),
          );
        });
  }
}
