import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:soar_initial_screens/ForgotPassScreen.dart';
import 'package:soar_initial_screens/LinkSpScreen.dart';
import 'package:soar_initial_screens/SignInScreen.dart';
import 'package:soar_initial_screens/themeData/ColorUtils.dart';
import 'CommonWidgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// This is the create accounts screen where users can enter their email,
// password, and password verification

class ResetPassScreen extends StatefulWidget {
  static const String id = 'resetPass';

  @override
  _ResetPassScreenState createState() => _ResetPassScreenState();
}

// Here we extend state with SingleTickerProviderStateMixIn in order to enable
// animations for this class
class _ResetPassScreenState extends State<ResetPassScreen>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(MediaQuery.of(context).size.width,
          MediaQuery.of(context).size.height),
      builder: () => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          // the widget that will hold all of the widgets on the screen
          body: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minWidth: MediaQuery.of(context).size.width,
                minHeight: MediaQuery.of(context).size.height,
              ),
              child: IntrinsicHeight(
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        alignment: Alignment(-.2, 0),
                        // the background image for the  sp
                        // screen
                        image:
                            AssetImage('assets/images/backgrounds/createAccBackground.png'),
                        fit: BoxFit.fill),
                  ),
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    children: [
                      // the part of the screen that allows the background image to show
                      Expanded(
                        flex: 1,
                        child: SizedBox(),
                      ),
                      // the bottom three fourths of the screen with the white card
                      CreateAcctCard(),
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

class CreateAcctCard extends StatefulWidget {
  CreateAcctCard({Key key}) : super(key: key);

  @override
  CreateAcctCardState createState() => CreateAcctCardState();
}

class CreateAcctCardState extends State<CreateAcctCard>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;

  @override
  void initState() {
    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    Timer(Duration(milliseconds: 300), () => animationController.forward());

    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: SlideTransition(
        position: Tween<Offset>(
          begin: Offset(0, 0.20),
          end: Offset.zero,
        ).animate(animationController),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(40.0),
                topLeft: Radius.circular(40.0)),
            color: Colors.white,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // The Create New Account Text and the back button
              Expanded(
                flex: 5,
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      // InkWell allows the icon to be clickable thus making it a button
                      child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(
                              // use MediaQuery.of(context) to get the dimensions of the device
                              0,
                              0,
                              0,
                              MediaQuery.of(context).size.width / 9),
                          // the back button
                          child: Tab(
                            icon: Icon(
                              Icons.arrow_back_ios,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                    // The Create New Account text at the top of the screen
                    Expanded(
                      flex: 5,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // separating the 'create' text and the 'new account'
                          Row(
                            children: [
                              Text(
                                "Reset",
                                style: TextStyle(
                                    fontSize: 38.sp,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'OpenSans'),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                "Password",
                                style: TextStyle(
                                    fontSize: 38.sp,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'OpenSans'),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 8,
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: SizedBox(),
              ),
              // This is the email text
              Expanded(
                flex: 3,
                child: Column(
                  children: [
                    EmailText(),
                    SizedBox(
                      height: 10.w,
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: SizedBox(),
                        ),
                        // this is the text field for a user's email
                        Expanded(
                          flex: 5,
                          child: UsrInputTxtBox(
                            fieldColor: Color(0xFFe4f2fc),
                            paddingLeft: 8.h,
                            paddingBottom:
                                MediaQuery.of(context).size.width / 50,
                            fieldHeight: MediaQuery.of(context).size.width / 10,
                            borderRadius: 10.0,
                            hintTextColor: Colors.black,
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: SizedBox(),
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
              Expanded(
                flex: 3,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: SizedBox(),
                        ),
                        // this is the password text
                        Expanded(
                            flex: 11,
                            child: Text(
                              "Confirm New Password",
                              style: TextStyle(
                                  fontSize: 18.sp, fontWeight: FontWeight.bold),
                            )),
                      ],
                    ),
                    SizedBox(
                      height: 10.w,
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: SizedBox(),
                        ),
                        Expanded(
                          flex: 5,
                          // the text field for the password
                          child: UsrInputTxtBox(
                            fieldColor: Color(0xFFe4f2fc),
                            paddingLeft: 8.h,
                            paddingBottom:
                                MediaQuery.of(context).size.width / 50,
                            fieldHeight: MediaQuery.of(context).size.width / 10,
                            borderRadius: 10.0,
                            hintTextColor: Colors.black,
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: SizedBox(),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 150,
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: SizedBox(),
              ),
              // this is the expanded container that has the 'NEXT STEP' button
              Expanded(
                flex: 3,
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
                          child: NextStepButton(),
                        ),
                        Expanded(
                          child: SizedBox(),
                          flex: 1,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: SizedBox(),
                        ),
                        Expanded(
                          flex: 1,
                          child: SizedBox(),
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
      ),
    );
  }
}

class CircularProgressBar extends StatelessWidget {
  const CircularProgressBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ProgressBarButton(
            colorData: Color(0xFF6AABEF),
            width: 13.w,
            height: 13.h,
          ),
          SizedBox(
            width: 5.w,
          ),
          ProgressBarButton(
            colorData: Color(0xFFCDCDCD),
            width: 10.w,
            height: 10.h,
          ),
          SizedBox(
            width: 5.w,
          ),
          ProgressBarButton(
            colorData: Color(0xFFCDCDCD),
            width: 10.w,
            height: 10.h,
          ),
        ],
      ),
    );
  }
}

class NextStepButton extends StatelessWidget {
  const NextStepButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      child: ElevatedButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return LinkSpotifyScreen();
              },
            ),
          );
        },
        // this is the next step button
        child: Text("RESET PASSWORD",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white,
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                fontFamily: 'OpenSans')),
        style: ElevatedButton.styleFrom(primary: Color(0xFF6AABEF)),
      ),
    );
  }
}

class EmailText extends StatelessWidget {
  const EmailText({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: SizedBox(),
        ),
        Expanded(
            flex: 5,
            child: Text(
              "New Password",
              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
            )),
        Expanded(
          flex: 5,
          child: SizedBox(),
        ),
      ],
    );
  }
}
