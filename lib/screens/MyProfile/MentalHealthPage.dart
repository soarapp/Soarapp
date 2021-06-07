import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/basic.dart';
import 'package:flutter/src/widgets/basic.dart';
import 'package:soar_initial_screens/models/Util/StringUtils.dart';
import 'package:soar_initial_screens/models/Util/ColorUtils.dart';
import 'package:soar_initial_screens/screens/MyMusic/MoodQuizPage3.dart';
import 'package:soar_initial_screens/CommonWidgetsAndMethods.dart';

void main() => runApp(MentalHealthScreen('mental health'));

class MentalHealthScreen extends StatelessWidget {
  static const String id = 'MentalHealth';
  String pageType;
  MentalHealthScreen(String pageType) {
    this.pageType = pageType;
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MentalHealthPage('mental health'),
    );
  }
}

class MentalHealthPage extends StatefulWidget {
  String pageType;
  MentalHealthPage(String pageType) {
    this.pageType = pageType;
  }
  @override
  MentalHealthPageSetup createState() => MentalHealthPageSetup(pageType);
}

class MentalHealthPageSetup extends State<MentalHealthPage> {
  String pageType;

  MentalHealthPageSetup(String pageType) {
    this.pageType = pageType;
  }
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
                                (pageType == 'mental health')
                                ? Text(
                                  '    Mental Health',
                                  style: TextStyle(
                                      fontSize: 28,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'OpenSans'),
                                )
                                : Text(
                              'Cancer Resources',
                              style: TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'OpenSans'),
                                ),
                                (pageType == 'mental health')
                                ? Text(
                                  '   Resources',
                                  style: TextStyle(
                                      fontSize: 28,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'OpenSans'),
                                )
                                    : SizedBox(),
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
                      flex: 17,
                      child: FAQDisplay(45, pageType),
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

class FAQDisplay extends StatefulWidget {
  int resourceNum;
  String pageType;
  FAQDisplay(int resourceNum, String pageType) {
    this.resourceNum = resourceNum;
    this.pageType = pageType;
  }

  @override
  State createState() => new QuestionList(resourceNum, pageType);
}

class QuestionList extends State<FAQDisplay> {
  int resourceNum;
  String pageType;

  QuestionList(int resourceNum, String pageType) {
    this.resourceNum =resourceNum;
    this.pageType = pageType;
  }

  @override
  Widget build(BuildContext ctxt) {
    return new ListView.builder(
        itemCount: (pageType == 'mental health')
        ? mentalHealthResources.length
        : cancerResources.length,
        itemBuilder: (BuildContext ctxt, int index) {
          return Column(
            children: [
              Container(
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
                                (pageType == 'mental health')
                                ? mentalHealthResources[index]
                                : cancerResources[index],
                                style: TextStyle(
                                  color: Color(0xFF6AABEF),
                                  fontFamily: 'OpenSans',
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Expanded(flex: 2, child: Image.asset(downArrow, scale: 4)),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20.0),
                      child: Text(
                        (pageType == 'mental health')
                        ? mentalHealthResourcesDetails[index]
                        : cancerResourcesDetails[index],
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'OpenSans',
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
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
                            (pageType == 'mental health')
                            ? mentalHealthResources[index]
                            : cancerResources[index],
                            style: TextStyle(
                              color: Color(0xFF6AABEF),
                              fontFamily: 'OpenSans',
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Image.asset(upArrow, scale :4),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                  decoration: BoxDecoration(
                  color: Color(0xFFE1E4EB),
          ),
                child: (resourceNum == index)
          ? Column(
                  children: [InkWell(
                    onTap: () {},
                    child: Row(
           children: [
             Expanded(flex: 1, child: Image.asset(bluePlusIcon, scale: 4)),
                    Expanded(
                      flex: 10,
                      child: Text(
                        'Add to Contacts',
                        style: TextStyle(
                          color: Color(0xFF6AABEF),
                          fontFamily: 'OpenSans',
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
          ]
          ),
                  ),
                    InkWell(
                      onTap: () {},
                      child: Row(
                          children: [
                            Expanded(flex: 1, child: Image.asset(bluePhoneIcon, scale: 4)),
                            Expanded(
                              flex: 10,
                              child: Text(
                                (pageType == 'mental health')
                                    ? mentalHealthResourcesNumbers[index]
                                    :cancerResourcesNumbers[index],
                                style: TextStyle(
                                  color: Color(0xFF6AABEF),
                                  fontFamily: 'OpenSans',
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )
                          ]
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Row(
                          children: [
                            Expanded(flex: 1, child: Image.asset(bluePaperclipIcon, scale: 4)),
                            Expanded(
                              flex: 10,
                              child: Text(
                                (pageType == 'mental health')
                                    ? mentalHealthResourcesLinks[index]
                                    :cancerResourcesLinks[index],
                                style: TextStyle(
                                  color: Color(0xFF6AABEF),
                                  fontFamily: 'OpenSans',
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            )
                          ]
                      ),
                    ),
          ]
                )
                : SizedBox(),
              )
            ],
          );
        });
  }
}
