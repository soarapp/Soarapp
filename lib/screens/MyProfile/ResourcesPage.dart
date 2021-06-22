import 'package:flutter/material.dart';
import 'package:soar_initial_screens/ThemeData/SizingUtils.dart';
import 'package:soar_initial_screens/models/Util/SpotifyUtils.dart';
import 'package:soar_initial_screens/models/Util/StringUtils.dart';
import 'package:soar_initial_screens/models/Util/ColorUtils.dart';
import 'package:soar_initial_screens/CommonWidgetsAndMethods.dart';
import 'package:soar_initial_screens/screens/MyProfile/FAQPage.dart';
import 'package:soar_initial_screens/screens/MyProfile/MentalHealthPage.dart';
import 'package:soar_initial_screens/screens/MyProfile/MusicTherapy.dart';
import 'package:soar_initial_screens/screens/MyProfile/Helplines.dart';

class ResourcesScreen extends StatelessWidget {
  static const String id = 'resources';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ResourcesPage(),
    );
  }
}

class ResourcesPage extends StatefulWidget {
  @override
  ResourcesPageSetup createState() => ResourcesPageSetup();
}

class ResourcesPageSetup extends State<ResourcesPage> {
  bool songIsPlaying = true;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Stack(
        children: <Widget>[
          //background image placement
          new Container(
            decoration: new BoxDecoration(
              image: new DecorationImage(
                image: new AssetImage(
                  'assets/images/backgrounds/resourcesPageBackground.png',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          //everything on top of background
          Column(
            children: [
              Expanded(
                flex: 826,
                child: Row(
                  children: [
                    Expanded(
                      flex: 35,
                      child: SizedBox(),
                    ),
                    Expanded(
                      flex: 345,
                      child: Column(
                        children: [
                          Expanded(flex: 30, child: SizedBox()),
                          Expanded(
                            flex: 90,
                            child: Row(children: [
                              Expanded(
                                flex: 13,
                                child: Text(
                                  'Resources',
                                  style: TextStyle(
                                    color: black,
                                    fontFamily: 'OpenSans',
                                    fontWeight: FontWeight.bold,
                                    fontSize:
                                        MediaQuery.of(context).size.height *
                                            MED_TXT_SCALER,
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: SizedBox(),
                              ),
                              Expanded(
                                flex: 2,
                                child: Icon(
                                  Icons.more_horiz,
                                  color: Color(0xFF2B2B2B),
                                  size: MediaQuery.of(context).size.height *
                                      MED_TXT_SCALER,
                                ),
                              ),
                            ]),
                          ),
                          Expanded(
                            flex: 67,
                            child: SizedBox(),
                          ),
                          //this is the information column
                          Expanded(
                            flex: 277,
                            child: informationBox(context),
                          ),
                          Expanded(
                            flex: 94,
                            child: SizedBox(),
                          ),
                          Expanded(
                              flex: 148, child: musicTherapyFAQBox(context)),
                          Expanded(
                            flex: 158,
                            child: SizedBox(),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 35,
                      child: SizedBox(),
                    ),
                  ],
                ),
              ),
              Expanded(flex: 69, child: bottomIconBar(context, 4)),
            ],
          )
        ],
      ),
    );
  }
}

Widget informationBox(BuildContext context) {
  return Container(
    decoration: BoxDecoration(
        borderRadius: new BorderRadius.circular(20.0),
        color: Colors.white.withOpacity(.1),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.6),
            spreadRadius: 1,
            blurRadius: 2,
            offset: Offset(0, 2), // changes position of shadow
          ),
        ]),
    child: Column(
      children: [
        Expanded(
          flex: 3,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: new BorderRadius.circular(10.0),
                color: Color(0xFF70ADEB),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 2,
                    offset: Offset(0, 2), // changes position of shadow
                  ),
                ]),
            child: Row(children: [
              Expanded(flex: 1, child: SizedBox()),
              Expanded(
                flex: 10,
                child: Text(
                  'Information',
                  style: TextStyle(
                    color: Color(0xFFFFFFFF),
                    fontFamily: 'OpenSans',
                    fontSize:
                        MediaQuery.of(context).size.height * SEM_MED_TXT_SCALER,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(flex: 2, child: SizedBox()),
            ]),
          ),
        ),
        Expanded(
          flex: 9,
          child: infoOptionsBox(context),
        ),
      ],
    ),
  );
}

Widget infoOptionsBox(BuildContext context) {
  return Column(children: [
    Expanded(
      flex: 1,
      child: infoBox(context, 1),
    ),
    Expanded(
      flex: 1,
      child: infoBox(context, 2),
    ),
    Expanded(
      flex: 1,
      child: infoBox(context, 3),
    ),
  ]);
}

Widget infoBox(BuildContext context, int informationNum) {
  return Container(
      decoration: BoxDecoration(
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
      child: Row(children: [
        Expanded(
          flex: 1,
          child: SizedBox(),
        ),
        Expanded(
            flex: 9,
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      switch (informationNum) {
                        case 1:
                          {
                            return MentalHealthPage('mental health');
                          }
                          break;
                        case 2:
                          {
                            return MentalHealthPage('cancer');
                          }
                          break;
                        case 3:
                          {
                            return MusicTherapyPage();
                          }
                          break;
                      }
                      ;
                    },
                  ),
                );
              },
              child: Text(
                information[informationNum - 1],
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Color(0xFFFFFFFF),
                  fontFamily: 'OpenSans',
                  fontSize:
                      MediaQuery.of(context).size.height * SMALL_TXT_SCALER,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )),
      ]));
}

Widget musicTherapyFAQBox(BuildContext context) {
  return Container(
    decoration: BoxDecoration(
        borderRadius: new BorderRadius.circular(20.0),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 3,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ]),
    child: Column(children: [
      Expanded(
          flex: 1,
          child: Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    //                   <--- left side
                    color: Color(0xFF000000).withOpacity(.1),
                    width: .5,
                  ),
                ),
              ),
              child: underlinedTextWithIconBox(
                  context, questionQuoteIcon, "FAQ"))),
      Expanded(
          flex: 1,
          child: underlinedTextWithIconBox(context, callIcon, "Helplines")),
    ]),
  );
}

Widget underlinedTextWithIconBox(
    BuildContext context, String icon, String string) {
  return TextButton(
    onPressed: () {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) {
            return (string == 'FAQ') ? FAQPage() : HelplinesPage();
          },
        ),
      );
    },
    child: Row(children: [
      Expanded(flex: 1, child: SizedBox()),
      Expanded(
        flex: 6,
        child: Image.asset(icon, scale: 5.1),
      ),
      Expanded(
        flex: 2,
        child: SizedBox(),
      ),
      Expanded(
          flex: 32,
          child: Text(
            string,
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'OpenSans',
              fontSize: MediaQuery.of(context).size.height * SMALL_TXT_SCALER,
              fontWeight: FontWeight.normal,
            ),
          )),
    ]),
  );
}
