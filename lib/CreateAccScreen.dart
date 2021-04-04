import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:soar_initial_screens/ForgotPassScreen.dart';
import 'package:soar_initial_screens/LinkSpScreen.dart';
import 'package:soar_initial_screens/SignInScreen.dart';
import 'package:soar_initial_screens/themeData/ColorUtils.dart';
import 'CommonWidgets.dart';

// This is the create accounts screen where users can enter their email,
// password, and password verification

class CreateAccScreen extends StatefulWidget {
  static const String id = 'createAccount';

  @override
  _CreateAccScreenState createState() => _CreateAccScreenState();
}

class _CreateAccScreenState extends State<CreateAccScreen> with SingleTickerProviderStateMixin {
  AnimationController _animationController;

  @override
  void initState() {
    _animationController= AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 500)
    );
    Timer(Duration(milliseconds: 200), () => _animationController.forward());

    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();

  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        // the widget that will hold all of the widgets on the screen
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
                alignment: Alignment(-.2, 0),
                // the background image for the screen
                image: AssetImage('assets/images/createAccBackground.png'),
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
              CreateAcctCard(
                animationController: _animationController,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CreateAcctCard extends StatelessWidget {
  final AnimationController animationController;

  const CreateAcctCard({
    Key key, @required this.animationController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: SlideTransition(
        position: Tween<Offset>(
          begin: Offset(0,0.20),
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
                flex: 3,
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
                          padding:
                              const EdgeInsets.fromLTRB(0, 0, 0, 50),
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
                                "Create",
                                style: TextStyle(
                                    fontSize: 38,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'OpenSans'),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                "New Account",
                                style: TextStyle(
                                    fontSize: 38,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'OpenSans'),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: SizedBox(),
                    ),
                  ],
                ),
              ),
              // This is the email text
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: SizedBox(),
                        ),
                        Expanded(
                            flex: 5,
                            child: Text(
                              "Email",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            )),
                        Expanded(
                          flex: 5,
                          child: SizedBox(),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
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
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0xFFe4f2fc),
                              borderRadius:
                                  new BorderRadius.circular(10.0),
                            ),
                            height: 50,
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(8, 0, 0, 0),
                              child: TextField(
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintStyle:
                                      TextStyle(color: Colors.black),
                                ),
                              ),
                            ),
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
                flex: 2,
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
                            flex: 5,
                            child: Text(
                              "Password",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            )),
                        Expanded(
                          flex: 5,
                          child: SizedBox(),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
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
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0xFFe4f2fc),
                              borderRadius:
                                  new BorderRadius.circular(10.0),
                            ),
                            height: 50,
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(8, 14, 0, 0),
                              child: TextField(
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintStyle: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 34),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: SizedBox(),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
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
                        // the text for the confirm password
                        Expanded(
                            flex: 5,
                            child: Text(
                              "Confirm Password",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            )),
                        Expanded(
                          flex: 5,
                          child: SizedBox(),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: SizedBox(),
                        ),
                        Expanded(
                          flex: 5,
                          // the text field for the confirm password
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0xFFe4f2fc),
                              borderRadius:
                                  new BorderRadius.circular(10.0),
                            ),
                            height: 50,
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(8, 14, 0, 0),
                              child: TextField(
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintStyle: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 34),
                                ),
                              ),
                            ),
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
                          child: Container(
                            height: 50,
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
                              child: Text("NEXT STEP",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'OpenSans')),
                              style: ElevatedButton.styleFrom(
                                  primary: Color(0xFF6AABEF)),
                            ),
                          ),
                        ),
                        Expanded(
                          child: SizedBox(),
                          flex: 1,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: SizedBox(),
                        ),
                        // Already have an account text
                        Expanded(
                          flex: 4,
                          child: RichText(
                            text: TextSpan(
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.black,
                                  fontFamily: 'OpenSans'),
                              children: <TextSpan>[
                                TextSpan(
                                    text: 'Already have an account? ',
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        print(
                                            'Pressing Forgot Password');
                                      }),
                                TextSpan(
                                    text: 'Sign In',
                                    style: TextStyle(
                                        color: Color(0xFF6AABEF),
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'OpenSans'),
                                    // Sign In text that is clickable
                                    // and will allow the user to go to the
                                    // Sign in Page
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (context) {
                                              return SignInScreen();
                                            },
                                          ),
                                        );
                                      }),
                              ],
                            ),
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
              // the three dot progress indicator at the bottom of the screen
              Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ProgressBarButton(
                      colorData: Color(0xFF6AABEF),
                      width: 13,
                      height: 13,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    ProgressBarButton(
                      colorData: Color(0xFFCDCDCD),
                      width: 10,
                      height: 10,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    ProgressBarButton(
                      colorData: Color(0xFFCDCDCD),
                      width: 10,
                      height: 10,
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
