import 'package:flutter/material.dart';
import 'package:soar_initial_screens/ThemeData/SizingUtils.dart';
import 'package:soar_initial_screens/models/Util/StringUtils.dart';
import 'package:soar_initial_screens/models/Util/ColorUtils.dart';
import 'package:soar_initial_screens/screens/MyMusic/MoodQuizPage2.dart';
import 'package:soar_initial_screens/CommonWidgets.dart';

// import 'package:soar/models/Util/StringUtils.dart';
// import 'package:soar/models/Util/ColorUtils.dart';
// import 'package:soar/screens/MyMusic/MoodQuizPage2.dart';

// method that serves as a getter for the height of this screen
// for the bouncing animation
double ogHeight = 0;

double getHeight() {
  return ogHeight;
}

class MoodQuiz extends StatefulWidget {
  @override
  MoodQuizSetup createState() => MoodQuizSetup();
}

class MoodQuizSetup extends State<MoodQuiz> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //background image
      body: Container(
        //width: double.infinity,
        //height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(moodQuizBackground), fit: BoxFit.fill),
        ),
        alignment: Alignment.bottomCenter,
        //the white tab on top of background
        child: Column(
          children: [
            Expanded(
              flex: 176,
              child: SizedBox(),
            ),
            Expanded(
              flex: 720,
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
                      flex: 163,
                      child: Row(
                        children: [
                          Expanded(
                            flex: 3,
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
                          //this is the text asking how you feel now
                          Expanded(
                            flex: 10,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      feelNow,
                                      style: TextStyle(
                                          fontSize: MediaQuery.of(context)
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
                            flex: 4,
                            child: SizedBox(),
                          ),
                        ],
                      ),
                    ),
                    //entire box with the mood options that you can click
                    Expanded(
                      flex: 350,
                      child: MoodBox(),
                    ),
                    //button for 'none of these describe my mood'
                    Expanded(
                      flex: 49,
                      child: TextButton(
                        onPressed: () => {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) {
                                return MoodQuizPage2();
                              },
                            ),
                          ),
                        },
                        child: Text(
                          noneDescribe,
                          style: TextStyle(
                            color: tealButton,
                            fontFamily: 'OpenSans',
                            fontWeight: FontWeight.bold,
                            fontSize: MediaQuery.of(context).size.height *
                                SMALL_TXT_SCALER,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 35,
                      child: SizedBox(),
                    ),
                    //next button
                    Expanded(
                      flex: 127,
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
                                  buttonHeight:
                                      MediaQuery.of(context).size.height *
                                          BUTTON_SCALER,
                                  buttonText: "NEXT",
                                  textSize: MediaQuery.of(context).size.height *
                                      SMALL_TXT_SCALER,
                                  onPressed: () => {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) {
                                          return MoodQuizPage2();
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
                            flex: 1,
                            child: SizedBox(),
                          ),
                          //four dots on bottom indicating which page we're on
                          Expanded(
                            flex: 1,
                            child: CircularProgressBar(
                              currPage: 1,
                              numPages: 4,
                              accent: tealButton,
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: SizedBox(),
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
    );
  }
}

//this is the entire section with all the mood buttons
class MoodBox extends StatefulWidget {
  @override
  _MoodBox createState() => _MoodBox();
}

class _MoodBox extends State<MoodBox> {
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Expanded(
        flex: 1,
        child: SizedBox(),
      ),
      Expanded(
        flex: 6,
        //first column of 4 buttons
        child: Column(children: [
          //button 0
          Expanded(
            flex: 1,
            child: Column(
              children: [
                Expanded(
                  flex: 6,
                  child: TextButton(
                    onPressed: () => {
                      setState(() {
                        moodNowButtonArray = [0, 0, 0, 0, 0, 0, 0, 0];
                        moodNowButtonArray[0] = 1;
                      })
                    },
                    child: WordBox(buttonNum: 0, word: moodNowButton0),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: SizedBox(),
                ),
              ],
            ),
          ),
          //button 1
          Expanded(
            flex: 1,
            child: Column(
              children: [
                Expanded(
                  flex: 6,
                  child: TextButton(
                    onPressed: () => {
                      setState(() {
                        moodNowButtonArray = [0, 0, 0, 0, 0, 0, 0, 0];
                        moodNowButtonArray[1] = 1;
                      })
                    },
                    child: WordBox(buttonNum: 1, word: moodNowButton1),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: SizedBox(),
                ),
              ],
            ),
          ),
          //button 2
          Expanded(
            flex: 1,
            child: Column(
              children: [
                Expanded(
                  flex: 6,
                  child: TextButton(
                    onPressed: () => {
                      setState(() {
                        moodNowButtonArray = [0, 0, 0, 0, 0, 0, 0, 0];
                        moodNowButtonArray[2] = 1;
                      })
                    },
                    child: WordBox(buttonNum: 2, word: moodNowButton2),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: SizedBox(),
                ),
              ],
            ),
          ),

          //button 3
          Expanded(
            flex: 1,
            child: Column(
              children: [
                Expanded(
                  flex: 6,
                  child: TextButton(
                    onPressed: () => {
                      setState(() {
                        moodNowButtonArray = [0, 0, 0, 0, 0, 0, 0, 0];
                        moodNowButtonArray[3] = 1;
                      })
                    },
                    child: WordBox(buttonNum: 3, word: moodNowButton3),
                  ),
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
      Expanded(
        flex: 1,
        child: SizedBox(),
      ),
      //button 4
      Expanded(
        flex: 6,
        child: Column(children: [
          Expanded(
            flex: 1,
            child: Column(
              children: [
                Expanded(
                  flex: 6,
                  child: TextButton(
                    onPressed: () => {
                      setState(() {
                        moodNowButtonArray = [0, 0, 0, 0, 0, 0, 0, 0];
                        moodNowButtonArray[4] = 1;
                      })
                    },
                    child: WordBox(buttonNum: 4, word: moodNowButton4),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: SizedBox(),
                ),
              ],
            ),
          ),
          //button 5
          Expanded(
            flex: 1,
            child: Column(
              children: [
                Expanded(
                  flex: 6,
                  child: TextButton(
                    onPressed: () => {
                      setState(() {
                        moodNowButtonArray = [0, 0, 0, 0, 0, 0, 0, 0];
                        moodNowButtonArray[5] = 1;
                      })
                    },
                    child: WordBox(buttonNum: 5, word: moodNowButton5),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: SizedBox(),
                ),
              ],
            ),
          ),
          //button 6
          Expanded(
            flex: 1,
            child: Column(
              children: [
                Expanded(
                  flex: 6,
                  child: TextButton(
                    onPressed: () => {
                      setState(() {
                        moodNowButtonArray = [0, 0, 0, 0, 0, 0, 0, 0];
                        moodNowButtonArray[6] = 1;
                      })
                    },
                    child: WordBox(buttonNum: 6, word: moodNowButton6),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: SizedBox(),
                ),
              ],
            ),
          ),
          //button 7
          Expanded(
            flex: 1,
            child: Column(
              children: [
                Expanded(
                  flex: 6,
                  child: TextButton(
                    onPressed: () => {
                      setState(() {
                        moodNowButtonArray = [0, 0, 0, 0, 0, 0, 0, 0];
                        moodNowButtonArray[7] = 1;
                      })
                    },
                    child: WordBox(buttonNum: 7, word: moodNowButton7),
                  ),
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
      Expanded(
        flex: 1,
        child: SizedBox(),
      ),
    ]);
  }
}

// Word Box widget used extensively in the Mood Quiz:

// ignore: must_be_immutable
class WordBox extends StatelessWidget {
  WordBox({
    Key key,
    this.buttonNum,
    this.word,
  }) : super(key: key);

  int buttonNum;
  String word;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: new BorderRadius.circular(10.0),
          color: (moodNowButtonArray[buttonNum] == 0) ? greyButton : tealButton,
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
            child: SizedBox(),
          ),
          Expanded(
            ////
            flex: 3,
            child: Row(children: [
              Expanded(
                flex: 1,
                child: SizedBox(),
              ),
              Expanded(
                flex: 4,
                child: Center(
                  child: Text(
                    word,
                    style: TextStyle(
                      color: Color(0xFF2B2B2B),
                      fontFamily: 'OpenSans',
                      fontWeight: FontWeight.bold,
                      fontSize:
                          MediaQuery.of(context).size.height * SMALL_TXT_SCALER,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: SizedBox(),
              ),
            ]),
          ),
          Expanded(
            flex: 1,
            child: SizedBox(),
          )
        ],
      ),
    );
  }
}
