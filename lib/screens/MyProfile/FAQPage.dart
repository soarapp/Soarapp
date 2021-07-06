import 'package:flutter/material.dart';
import 'package:soar_initial_screens/ThemeData/SizingUtils.dart';
import 'package:soar_initial_screens/models/Util/StringUtils.dart';
import 'package:soar_initial_screens/models/Util/ColorUtils.dart';
import 'package:soar_initial_screens/screens/MyMusic/MoodQuizPage3.dart';
import 'package:soar_initial_screens/CommonWidgetsAndMethods.dart';

void main() => runApp(FAQScreen());

class FAQScreen extends StatelessWidget {
  static const String id = 'FAQ';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FAQPage(),
    );
  }
}

class FAQPage extends StatefulWidget {
  @override
  FAQPageSetup createState() => FAQPageSetup();
}

class FAQPageSetup extends State<FAQPage> {
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
                      flex: 92,
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
                                  '        FAQ',
                                  style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.height *
                                              SEM_MED_TXT_SCALER,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'OpenSans'),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 97,
                            child: SizedBox(),
                          ),
                        ],
                      ),
                    ),
                    //entire box with the mood options that you can click
                    Expanded(
                      flex: 479,
                      child: FAQDisplay(45),
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
class FAQDisplay extends StatefulWidget {
  int questionNum;

  FAQDisplay(int questionNum) {
    this.questionNum = questionNum;
  }

  @override
  State createState() => new QuestionList(questionNum);
}

class QuestionList extends State<FAQDisplay> {
  int questionNum;

  QuestionList(int questionNum) {
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
                          child: Text(
                            questions[index],
                            style: TextStyle(
                              color: Color(0xFF6AABEF),
                              fontFamily: 'OpenSans',
                              fontSize:
                              MediaQuery.of(context).size.height *
                                  SMALL_TXT_SCALER,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                          flex: 2,
                          child: Image.asset(upArrow, scale: 4)),
                    ],
                  ),
                ),
                Text(
                  answers[index],
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'OpenSans',
                    fontSize: MediaQuery.of(context).size.height *
                        SMALL_TXT_SCALER,
                    fontWeight: FontWeight.normal,
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
                  Expanded(
                    flex: 9,
                    child: Padding(
                      padding:
                      const EdgeInsets.only(top: 5.0, bottom: 5.0),
                      child: Text(
                        questions[index],
                        style: TextStyle(
                          color: Color(0xFF6AABEF),
                          fontFamily: 'OpenSans',
                          fontSize: MediaQuery.of(context).size.height *
                              SMALL_TXT_SCALER,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Image.asset(downArrow, scale: 4),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
