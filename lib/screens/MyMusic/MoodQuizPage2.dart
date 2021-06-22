import 'package:flutter/material.dart';
import 'package:soar_initial_screens/ThemeData/SizingUtils.dart';
import 'package:soar_initial_screens/models/Util/StringUtils.dart';
import 'package:soar_initial_screens/models/Util/ColorUtils.dart';
import 'package:soar_initial_screens/screens/MyMusic/MoodQuizPage3.dart';

import '../../CommonWidgets.dart';

class MoodQuizPage2 extends StatefulWidget {
  @override
  MoodQuizPage2Setup createState() => MoodQuizPage2Setup();
}

class MoodQuizPage2Setup extends State<MoodQuizPage2> {
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
                          //this is the text asking how you fmoodSoon
                          Expanded(
                            flex: 10,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'How would you \nlike to feel?',
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
                      child: MoodBoxPage2(),
                    ),
                    //button for 'none of these describe my mood'
                    Expanded(
                      flex: 49,
                      child: TextButton(
                        onPressed: () => {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) {
                                return MoodQuizPage3();
                              },
                            ),
                          ),
                        },
                        child: Text(
                          'I don\'t want to feel a specific way',
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
                                          return MoodQuizPage3();
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
                              currPage: 2,
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
class MoodBoxPage2 extends StatefulWidget {
  @override
  _MoodBoxPage2 createState() => _MoodBoxPage2();
}

class _MoodBoxPage2 extends State<MoodBoxPage2> {
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
                        moodDesiredButtonArray = [0, 0, 0, 0, 0, 0, 0, 0];
                        moodDesiredButtonArray[0] = 1;
                      })
                    },
                    child: WordBoxPage2(buttonNum: 0, word: moodSoonButton0),
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
                        moodDesiredButtonArray = [0, 0, 0, 0, 0, 0, 0, 0];
                        moodDesiredButtonArray[1] = 1;
                      })
                    },
                    child: WordBoxPage2(buttonNum: 1, word: moodSoonButton1),
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
                        moodDesiredButtonArray = [0, 0, 0, 0, 0, 0, 0, 0];
                        moodDesiredButtonArray[2] = 1;
                      })
                    },
                    child: WordBoxPage2(buttonNum: 2, word: moodSoonButton2),
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
                        moodDesiredButtonArray = [0, 0, 0, 0, 0, 0, 0, 0];
                        moodDesiredButtonArray[3] = 1;
                      })
                    },
                    child: WordBoxPage2(buttonNum: 3, word: moodSoonButton3),
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
                        moodDesiredButtonArray = [0, 0, 0, 0, 0, 0, 0, 0];
                        moodDesiredButtonArray[4] = 1;
                      })
                    },
                    child: WordBoxPage2(buttonNum: 4, word: moodSoonButton4),
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
                        moodDesiredButtonArray = [0, 0, 0, 0, 0, 0, 0, 0];
                        moodDesiredButtonArray[5] = 1;
                      })
                    },
                    child: WordBoxPage2(buttonNum: 5, word: moodSoonButton5),
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
                        moodDesiredButtonArray = [0, 0, 0, 0, 0, 0, 0, 0];
                        moodDesiredButtonArray[6] = 1;
                      })
                    },
                    child: WordBoxPage2(buttonNum: 6, word: moodSoonButton6),
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
                        moodDesiredButtonArray = [0, 0, 0, 0, 0, 0, 0, 0];
                        moodDesiredButtonArray[7] = 1;
                      })
                    },
                    child: WordBoxPage2(buttonNum: 7, word: moodSoonButton7),
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
class WordBoxPage2 extends StatelessWidget {
  WordBoxPage2({
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
          color: (moodDesiredButtonArray[buttonNum] == 0) ? greyButton : tealButton,
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
