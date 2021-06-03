import 'package:flutter/material.dart';
import 'package:soar_initial_screens/models/Util/StringUtils.dart';
import 'package:soar_initial_screens/models/Util/ColorUtils.dart';
import 'package:soar_initial_screens/screens/MyMusic/MoodQuizPage2.dart';

// import 'package:soar/models/Util/StringUtils.dart';
// import 'package:soar/models/Util/ColorUtils.dart';
// import 'package:soar/screens/MyMusic/MoodQuizPage2.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MoodQuiz(),
    );
  }
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
                                          fontSize: 26,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'OpenSans'),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      rn,
                                      style: TextStyle(
                                          fontSize: 26,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'OpenSans'),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 6,
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
                            fontSize: 13,
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
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          new BorderRadius.circular(10.0),
                                      color: tealButton.withOpacity(.9),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          spreadRadius: 1,
                                          blurRadius: 2,
                                          offset: Offset(0,
                                              2), // changes position of shadow
                                        ),
                                      ]),
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
                                    child: Text(next,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'OpenSans')),
                                  ),
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
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: SizedBox(),
                                ),
                                Expanded(
                                  flex: 5,
                                  child: Image.asset(fourDots, scale: 1.1),
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
                    child: WordBox(0, moodNowButton0),
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
                    child: WordBox(1, moodNowButton1),
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
                    child: WordBox(2, moodNowButton2),
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
                    child: WordBox(3, moodNowButton3),
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
                    child: WordBox(4, moodNowButton4),
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
                    child: WordBox(5, moodNowButton5),
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
                    child: WordBox(6, moodNowButton6),
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
                    child: WordBox(7, moodNowButton7),
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

//widget for the individual buttons for each mood
Widget WordBox(int buttonNum, String word) {
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
                    fontSize: 18,
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
