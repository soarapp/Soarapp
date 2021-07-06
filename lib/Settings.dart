import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:soar_initial_screens/ThemeData/SizingUtils.dart';
import 'package:soar_initial_screens/models/Util/StringUtils.dart';
import 'package:soar_initial_screens/CommonWidgetsAndMethods.dart';

void main() => runApp(SettingsScreen());

class SettingsScreen extends StatelessWidget {
  static const String id = 'settings';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SettingsPage(),
    );
  }
}

class SettingsPage extends StatefulWidget {
  @override
  SettingsPageSetup createState() => SettingsPageSetup();
}

class SettingsPageSetup extends State<SettingsPage> {
  int popUpNum = -1;
  int questionNum = 45;
  @override
  Widget build(BuildContext context) {
    return (popUpNum == -1)

    ? Scaffold(
      //background image
      body:
        Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(moodQuizBackground), fit: BoxFit.fill),
          ),
          alignment: Alignment.bottomCenter,
        //the white tab on top of background
        child: Column(
          children: [
            Expanded(
              flex: 422,
              child: SizedBox(),
            ),
            Expanded(
              flex: 417,
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: SizedBox(),
                                ),
                                Expanded(
                                  flex: 8,
                                  child: Text(
                                    '    Settings',
                                    style: TextStyle(
                                        fontSize: MediaQuery.of(context)
                                            .size
                                            .height *
                                            MED_TXT_SCALER,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'OpenSans'),
                                  ),
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
                    Expanded(flex: 479, child:
                    ListView.builder(
                        itemCount: settingsResources.length,
                        itemBuilder: (BuildContext ctxt, int index) {
                          return Container(
                            decoration: BoxDecoration(
                              color: (questionNum == index)
                                  ? Color(0xFF81C4C8).withOpacity(.3)
                                  : Colors.white,
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
                            alignment: Alignment.centerLeft,
                            child: (questionNum == index && index == 0)
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
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20, top: 10, bottom: 10.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          flex: 9,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                top: 5.0, bottom: 5.0),
                                            child: Text(
                                              settingsResources[index],
                                              style: TextStyle(
                                                color: Colors.black,
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
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          popUpNum = 0;
                                        });
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.only(
                                            left: 20, top: 15, bottom: 15.0),
                                        decoration: BoxDecoration(
                                          color: (questionNum == index)
                                              ? Color(0xFF81C4C8).withOpacity(0)
                                              : Colors.white,
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
                                        alignment: Alignment.centerLeft,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              settingsResources1[index],
                                              style: TextStyle(
                                                color: Color(0xFF2B2B2B),
                                                fontFamily: 'OpenSans',
                                                fontSize:
                                                MediaQuery.of(context).size.height *
                                                    SMALL_TXT_SCALER,
                                                fontWeight: FontWeight.normal,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          popUpNum = 1;
                                        });
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.only(
                                            left: 20, top: 15, bottom: 15.0),
                                        decoration: BoxDecoration(
                                          color: (questionNum == index)
                                              ? Color(0xFF81C4C8).withOpacity(0)
                                              : Colors.white,
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
                                        alignment: Alignment.centerLeft,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              settingsResources2[index],
                                              style: TextStyle(
                                                color: Color(0xFF2B2B2B),
                                                fontFamily: 'OpenSans',
                                                fontSize:
                                                MediaQuery.of(context).size.height *
                                                    SMALL_TXT_SCALER,
                                                fontWeight: FontWeight.normal,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.only(
                                          left: 20, top: 15, bottom: 15.0),
                                      decoration: BoxDecoration(
                                        color: (questionNum == index)
                                            ? Color(0xFF81C4C8).withOpacity(0)
                                            : Colors.white,
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
                                      alignment: Alignment.centerLeft,
                                      child: InkWell(
                                        onTap: () {
                                          setState(() {
                                            popUpNum = 2;
                                          });
                                        },
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              settingsResources3[index],
                                              style: TextStyle(
                                                color: Color(0xFF2B2B2B),
                                                fontFamily: 'OpenSans',
                                                fontSize:
                                                MediaQuery.of(context).size.height *
                                                    SMALL_TXT_SCALER,
                                                fontWeight: FontWeight.normal,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            )
                                : InkWell(
                              onTap: () {
                                setState(() {
                                  questionNum = index;
                                });
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 20, bottom: 10, top: 10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      flex: 9,
                                      child: Padding(
                                        padding:
                                        const EdgeInsets.only(top: 5.0, bottom: 5.0),
                                        child: Text(
                                          settingsResources[index],
                                          style: TextStyle(
                                            color: Colors.black,
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
                                      child: Image.asset(downArrow, scale: 4.2),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        })),
                    //button for 'none of these describe my mood'
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 69,
              child: bottomIconBar(context, 3),
            ),
          ],
        ),
    )
    )
    : Scaffold(
      body: Stack(children: [
       Container(
         child: Stack(
              //background image
              children: [
                Opacity(
                  opacity: .7,
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(moodQuizBackground), fit: BoxFit.fill),
                    ),
                    alignment: Alignment.bottomCenter,
                  ),
                ),
                //the white tab on top of background
                Column(
                  children: [
                    Expanded(
                      flex: 422,
                      child: SizedBox(),
                    ),
                    Expanded(
                      flex: 417,
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
                          color: Colors.white.withOpacity(.7),
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
                                    child: TextButton(
                                      onPressed: () {
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
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: SizedBox(),
                                        ),
                                        Expanded(
                                          flex: 6,
                                          child: Container(
                                            child: Text(
                                              '    Settings',
                                              style: TextStyle(
                                                  fontSize: .95 * MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      MED_TXT_SCALER,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: 'OpenSans'
                                              ),
                                            ),
                                          ),
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
                            Expanded(flex: 479, child:
                            ListView.builder(
                                itemCount: settingsResources.length,
                                itemBuilder: (BuildContext ctxt, int index) {
                                  return Container(
                                    decoration: BoxDecoration(
                                      color: (questionNum == index)
                                          ? Color(0xFF81C4C8).withOpacity(.3)
                                          : Colors.white.withOpacity(0),
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
                                    alignment: Alignment.centerLeft,
                                    child: (questionNum == index && index == 0)
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
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 20,top: 10.0, bottom: 10.0),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Expanded(
                                                  flex: 9,
                                                  child: Padding(
                                                    padding: const EdgeInsets.only(
                                                        top: 10.0, bottom: 10.0),
                                                    child: Text(
                                                      settingsResources[index],
                                                      style: TextStyle(
                                                        color: Colors.black,
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
                                        ),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                setState(() {
                                                  popUpNum = 0;
                                                });
                                              },
                                              child: Container(
                                                padding: const EdgeInsets.only(
                                                    left: 20, top: 15, bottom: 15),
                                                decoration: BoxDecoration(
                                                  color: (questionNum == index)
                                                      ? Color(0xFF81C4C8).withOpacity(0)
                                                      : Colors.white,
                                                  border: Border(
                                                    top: BorderSide(
//                    <--- top side
                                                      color: Color(0xFF000000).withOpacity(.1),
                                                      width: .5,
                                                    ),
                                                  ),
                                                ),
                                                alignment: Alignment.centerLeft,
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      settingsResources1[index],
                                                      style: TextStyle(
                                                        color: Color(0xFF2B2B2B),
                                                        fontFamily: 'OpenSans',
                                                        fontSize:
                                                        MediaQuery.of(context).size.height *
                                                            SMALL_TXT_SCALER,
                                                        fontWeight: FontWeight.normal,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            InkWell(
                                              onTap: () {
                                                setState(() {
                                                  popUpNum = 1;
                                                });
                                              },
                                              child: Container(
                                                padding: const EdgeInsets.only(
                                                    left:20, top: 15, bottom: 15),
                                                decoration: BoxDecoration(
                                                  color: (questionNum == index)
                                                      ? Color(0xFF81C4C8).withOpacity(0)
                                                      : Colors.white,
                                                  border: Border(
                                                    top: BorderSide(
//                    <--- top side
                                                      color: Color(0xFF000000).withOpacity(.1),
                                                      width: .5,
                                                    ),
                                                  ),
                                                ),
                                                alignment: Alignment.centerLeft,
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      settingsResources2[index],
                                                      style: TextStyle(
                                                        color: Color(0xFF2B2B2B),
                                                        fontFamily: 'OpenSans',
                                                        fontSize:
                                                        MediaQuery.of(context).size.height *
                                                            SMALL_TXT_SCALER,
                                                        fontWeight: FontWeight.normal,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Container(
                                              padding: const EdgeInsets.only(
                                                  left: 11),
                                              decoration: BoxDecoration(
                                                color: (questionNum == index)
                                                    ? Color(0xFF81C4C8).withOpacity(0)
                                                    : Colors.white,
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
                                              alignment: Alignment.centerLeft,
                                              child: TextButton(
                                                onPressed: () {
                                                  setState(() {
                                                    popUpNum = 2;
                                                  });
                                                },
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      settingsResources3[index],
                                                      style: TextStyle(
                                                        color: Color(0xFF2B2B2B),
                                                        fontFamily: 'OpenSans',
                                                        fontSize:
                                                        MediaQuery.of(context).size.height *
                                                            SMALL_TXT_SCALER,
                                                        fontWeight: FontWeight.normal,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    )
                                        : InkWell(
                                      onTap: () {
                                        setState(() {
                                          questionNum = index;
                                        });
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 20, top: 10, bottom: 10.0),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              flex: 9,
                                              child: Padding(
                                                padding:
                                                const EdgeInsets.only(top: 5.0, bottom: 5.0),
                                                child: Text(
                                                  settingsResources[index],
                                                  style: TextStyle(
                                                    color: Colors.black,
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
                                    ),
                                  );
                                })),
                            //button for 'none of these describe my mood'
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 69,
                      child: bottomIconBar(context, 3),
                    ),
                  ],
                ),
              ],
            ),
       ),
        Align(
          alignment: Alignment.center,
          child: Container(
            height: 4.2 * MediaQuery.of(context).size.height *
                FIELD_SIZE_SCALER,
            width: 6.2 * MediaQuery.of(context).size.height *
                FIELD_SIZE_SCALER,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: new BorderRadius.circular(LG_BORDER_RADIUS),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 3,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ]),
            child: Row(
              children: [
                Expanded(flex: 1, child: SizedBox()),
                Expanded(
                  flex: 8,
                  child: Column(
                    children: [
                      Expanded(
                        flex: 1,
                        child: SizedBox()
                      ),
                      Expanded(
                        flex: 5,
                        child: Text(
                          'Are you sure you want to ' + settingsPopUp[popUpNum] + "?",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFF000000),
                            fontFamily: 'OpenSans',
                            fontSize: 1.1 * MediaQuery.of(context).size.height * SMALL_TXT_SCALER,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: SizedBox()
                      ),
                      Expanded(
                        flex: 10,
                        child: Column(
                          children: [
                            Expanded(
                              flex: 4,
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Color(0xFF81C4C8),
                                    borderRadius: new BorderRadius.circular(LG_BORDER_RADIUS),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 1,
                                        blurRadius: 3,
                                        offset: Offset(0, 3), // changes position of shadow
                                      ),
                                    ]),
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 15.0, right: 15),
                                  child: TextButton(
                                    onPressed: () {
                                      //do whatever should be done lol @sukjit






                                    },
                                    child: Text(
                                      settingsPopUpButtons[popUpNum],
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Color(0xFF000000),
                                        fontFamily: 'OpenSans',
                                        fontSize: 1.2 * MediaQuery.of(context).size.height * SMALL_TXT_SCALER,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 4,
                              child: TextButton(
                                onPressed: () {
                                  setState(() {
                                    popUpNum = -1;
                                  });
                                },
                                child: Text(
                                  "Cancel",
                                  style: TextStyle(
                                    color: Color(0xFF000000),
                                    fontFamily: 'OpenSans',
                                    fontSize: 1.2 * MediaQuery.of(context).size.height * SMALL_TXT_SCALER,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: SizedBox(),
                      )
                    ],
                  ),
                ),
                Expanded(flex: 1, child: SizedBox())
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
