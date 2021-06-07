import 'package:flutter/material.dart';
import 'package:soar_initial_screens/ThemeData/SizingUtils.dart';
import 'package:soar_initial_screens/models/Util/StringUtils.dart';
import 'package:soar_initial_screens/models/Util/ColorUtils.dart';
import 'package:soar_initial_screens/screens/MyMusic/MoodQuizPage3.dart';
import 'package:soar_initial_screens/CommonWidgetsAndMethods.dart';

void main() => runApp(MentalHealthScreen());

class MentalHealthScreen extends StatelessWidget {
  static const String id = 'MentalHealth';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MentalHealthPage(),
    );
  }
}

class MentalHealthPage extends StatefulWidget {
  @override
  MentalHealthPageSetup createState() => MentalHealthPageSetup();
}

class MentalHealthPageSetup extends State<MentalHealthPage> {
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
              flex: 2,
              child: SizedBox(),
            ),
            Expanded(
              flex: 5,
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
                      flex: 5,
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
                                Text(
                                  '        FAQ',
                                  style: TextStyle(
                                      fontSize:
                                      MediaQuery.of(context).size.height * SEM_MED_TXT_SCALER,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'OpenSans'),
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
                      flex: 17,
                      child: FAQDisplay(45),
                    ),
                    //button for 'none of these describe my mood'
                    Expanded(
                      flex: 3,
                      child: Container(
                          decoration:
                              BoxDecoration(color: Colors.white, boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset:
                                  Offset(3, 0), // changes position of shadow
                            ),
                          ]),
                          child: bottomIconBar(context, 4)),
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
  int resourceNum;

  FAQDisplay(int resourceNum) {
    this.resourceNum = resourceNum;
  }

  @override
  State createState() => new QuestionList(resourceNum);
}

class QuestionList extends State<FAQDisplay> {
  int resourceNum;

  QuestionList(int resourceNum) {
    this.resourceNum = resourceNum;
  }

  @override
  Widget build(BuildContext ctxt) {
    return new ListView.builder(
        itemCount: mentalHealthResources.length,
        itemBuilder: (BuildContext ctxt, int index) {
          return Container(
            padding: const EdgeInsets.only(left: 20, top: 10, bottom: 10.0),
            decoration: BoxDecoration(
              color: (resourceNum == index) ? Color(0xFFE4F2FC) : Colors.white,
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
            child: (resourceNum == index)
                ? Column(
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            (resourceNum == index)
                                ? resourceNum = 45
                                : resourceNum = index;
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
                                  mentalHealthResources[index],
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
                            Padding(
                              padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.height * HUNDRETH_SCALER, MediaQuery.of(context).size.height * HUNDRETH_SCALER,
                                  MediaQuery.of(context).size.height * HUNDRETH_SCALER * 2, MediaQuery.of(context).size.height * HUNDRETH_SCALER),
                              child: Container(width: MediaQuery.of(context).size.height * SMALL_TXT_SCALER,child: Image.asset(upArrow)),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        mentalHealthResourcesDetails[index],
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
                        resourceNum = index;
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
                              mentalHealthResources[index],
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
                        Padding(
                          padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.height * HUNDRETH_SCALER, MediaQuery.of(context).size.height * HUNDRETH_SCALER,
                              MediaQuery.of(context).size.height * HUNDRETH_SCALER * 2, MediaQuery.of(context).size.height * HUNDRETH_SCALER),
                          child: Container(width: MediaQuery.of(context).size.height * SMALL_TXT_SCALER,child: Image.asset(downArrow)),
                        ),
                      ],
                    ),
                  ),
          );
        });
  }
}
