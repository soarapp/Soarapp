import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:soar_initial_screens/ForgotPassScreen.dart';
import 'package:soar_initial_screens/CreateAccScreen.dart';
import 'package:soar_initial_screens/RegisterScreen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:soar_initial_screens/CommonWidgets.dart';
import 'package:soar_initial_screens/ThemeData/SizingUtils.dart';
import 'package:soar_initial_screens/Backend Functions/Functions.dart';
import 'package:soar_initial_screens/LinkSpScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';

// This is the Sign In Screen that users will navigate to
// after clicking Login

class SignInScreen extends StatefulWidget {
  static const String id = 'signIn';

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen>
    with SingleTickerProviderStateMixin {
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(MediaQuery.of(context).size.width,
          MediaQuery.of(context).size.height),
      builder: () => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
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
                        image: AssetImage('assets/images/backgrounds/signInBackground.png'),
                        fit: BoxFit.cover),
                  ),
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    children: [
                      // Expanded with a SizedBox that allows the background image to render
                      // and pushes the rest of the card content below
                      Expanded(
                        flex: 1,
                        child: SizedBox(),
                      ),
                      // Start of the curved card content portion of the screen
                      SignInCard(),
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

class SignInCard extends StatefulWidget {
  SignInCard({Key key}) : super(key: key);
  @override
  SignInCardState createState() => SignInCardState();
}

class SignInCardState extends State<SignInCard>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    Timer(Duration(milliseconds: 200), () => _animationController.forward());

    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  String _email, _password;
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 2,
        child: SlideTransition(
          position: Tween<Offset>(
            begin: Offset(0, 1),
            end: Offset.zero,
          ).animate(_animationController),
          child: Container(
            width: double.infinity,
            // Decoration allows you to curve the corners of the card
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(40.0),
                  topLeft: Radius.circular(40.0)),
              color: Colors.white,
            ),
            // Column will hold widgets within the curved card part of the app
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Sign In Text
                Expanded(
                  flex: 3,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: SizedBox(),
                      ),
                      Expanded(
                          flex: 5,
                          child: Text(
                            "Sign In",
                            style: TextStyle(
                                fontSize: 80,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'OpenSans'),
                          )),
                      Expanded(
                        flex: 2,
                        child: SizedBox(),
                      ),
                    ],
                  ),
                ),
                // Email Text and Text Field
                Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      // row to help space out the Email bold text horizontally
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
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              )),
                          Expanded(
                            flex: 5,
                            child: SizedBox(),
                          ),
                        ],
                      ),
                      // helps space out the 'EMAIL' text and the text field underneath it
                      SizedBox(
                        height: 10,
                      ),
                      // Row to help space out the blue text field portion of the user input
                      Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: SizedBox(),
                          ),
                          // Blue text field portion for the email user input
                          Expanded(
                            flex: 5,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Color(0xFFe4f2fc),
                                borderRadius: new BorderRadius.circular(10.0),
                              ),
                              height: 50,
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(8, 0, 0, 0),
                                child: TextField(
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintStyle: TextStyle(color: Colors.black),
                                  ),
                                  onChanged: (value) {
                                    setState(() {
                                      _email = value.trim();
                                    });
                                  },
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
                // Password text underneath the blue user email input area
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
                          Expanded(
                              flex: 5,
                              child: Text(
                                "Password",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
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
                          // the pre-filled text for the password and
                          // the text input box where users can enter their
                          // password
                          Expanded(
                            flex: 5,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Color(0xFFe4f2fc),
                                borderRadius: new BorderRadius.circular(10.0),
                              ),
                              height: 50,
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(8, 14, 0, 0),
                                child: TextField(
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: '••••••••••••',
                                    hintStyle: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 34),
                                  ),
                                  onChanged: (value) {
                                    setState(() {
                                      _password = value.trim();
                                    });
                                  },
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
                      // space between the password text input
                      SizedBox(
                        height: 10,
                      ),
                      // Spacing out the Forgot Password hyperlink with a row
                      Row(
                        children: [
                          Expanded(
                            flex: 4,
                            child: SizedBox(),
                          ),
                          // Forgot password hypertext which will link to the Forgot Password page
                          Expanded(
                            flex: 3,
                            child: RichText(
                              text: TextSpan(
                                children: <TextSpan>[
                                  TextSpan(
                                      text: 'Forgot Password?',
                                      style: TextStyle(
                                          color: Color(0xFF6AABEF),
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          Navigator.of(context).push(
                                            MaterialPageRoute(
                                              builder: (context) {
                                                return ForgotPassScreen();
                                              },
                                            ),
                                          );
                                        }),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 4,
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
                // Password text underneath the blue user email input area
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
                          Expanded(
                            flex: 5,
                            child: Container(
                              height: 50,
                              child: ElevatedButton(
                                onPressed: () {
                                  signIn(_email, _password, context);
                                },
                                child: Text("SIGN IN",
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
                      // spacing between Sign In button and the text underneath it
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: SizedBox(),
                          ),
                          // Hypertext that will lead to creating a new account
                          // if the user does not have an account
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
                                      text: 'Don\'t have an account? ',
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          print('Pressing Forgot Password');
                                        }),
                                  TextSpan(
                                      text: 'Create new account',
                                      style: TextStyle(
                                          color: Color(0xFF6AABEF),
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'OpenSans'),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          Navigator.of(context).push(
                                            MaterialPageRoute(
                                              builder: (context) {
                                                return CreateAccScreen();
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

                          Expanded(
                            flex: 1,
                            child: SizedBox(),
                          ),
                        ],
                      ),
                      // space between the password text input
                      SizedBox(
                        height: 10.h,
                      ),
                      // Spacing out the Forgot Password hyperlink with a row
                      Row(
                        children: [
                          Expanded(
                            flex: 4,
                            child: SizedBox(),
                          ),
                          // Forgot password hypertext which will link to the Forgot Password page
                          Expanded(
                            flex: 3,
                            child: ForgotPasswordText(),
                          ),
                          Expanded(
                            flex: 4,
                            child: SizedBox(),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                // Expanded area for the sign in button
                Expanded(
                  flex: 3,
                  child: Column(
                    children: [
                      // row to space out Sign In Button horizontally
                      Row(
                        children: [
                          Expanded(
                            child: SizedBox(),
                            flex: 1,
                          ),
                          // Sign In Button
                          Expanded(
                            flex: 5,
                            child: SignInButton(),
                          ),
                          Expanded(
                            child: SizedBox(),
                            flex: 1,
                          ),
                        ],
                      ),
                      // spacing between Sign In button and the text underneath it
                      SizedBox(
                        height: 10.h,
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: SizedBox(),
                          ),
                          // Hypertext that will lead to creating a new account
                          // if the user does not have an account
                          Expanded(
                            flex: 4,
                            child: DontHaveAcctTxt(),
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
                // Vertical spacing underneath the Sign in Button and text underneath it
                // to leave space between the widget and the bottom of the screen
                Expanded(
                  flex: 1,
                  child: SizedBox(),
                ),
              ],
            ),
          ),
        ));
  }
}

class DontHaveAcctTxt extends StatelessWidget {
  const DontHaveAcctTxt({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: TextStyle(
            fontSize: 12.sp, color: Colors.black, fontFamily: 'OpenSans'),
        children: <TextSpan>[
          TextSpan(
              text: 'Don\'t have an account? ',
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  print('Pressing Forgot Password');
                }),
          TextSpan(
              text: 'Create new account',
              style: TextStyle(
                  color: Color(0xFF6AABEF),
                  fontSize: 12.sp,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'OpenSans'),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return CreateAccScreen();
                      },
                    ),
                  );
                }),
        ],
      ),
    );
  }
}

class SignInButton extends StatelessWidget {
  const SignInButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * BUTTON_SCALER,
      child: ElevatedButton(
        onPressed: () {
          // Navigator.of(context).push(
          //   MaterialPageRoute(
          //     builder: (context) {
          //       return ConnectHRScreen();
          //     },
          //   ),
          // );
        },
        child: Text("SIGN IN",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white,
                fontSize: MediaQuery.of(context).size.height * SMALL_TXT_SCALER,
                fontWeight: FontWeight.bold,
                fontFamily: 'OpenSans')),
        style: ElevatedButton.styleFrom(primary: Color(0xFF6AABEF)),
      ),
    );
  }
}

class ForgotPasswordText extends StatelessWidget {
  const ForgotPasswordText({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: <TextSpan>[
          TextSpan(
              text: 'Forgot Password?',
              style: TextStyle(
                  color: Color(0xFF6AABEF),
                  fontSize:
                      MediaQuery.of(context).size.height * TINY_TXT_SCALER,
                  fontWeight: FontWeight.bold),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return ForgotPassScreen();
                      },
                    ),
                  );
                }),
        ],
      ),
    );
  }
}
