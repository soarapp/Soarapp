import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:soar_initial_screens/screens/Registration/ForgotPassScreen.dart';
import 'package:soar_initial_screens/screens/Registration/CreateAccScreen.dart';
import 'package:soar_initial_screens/screens/Registration/RegisterScreen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:soar_initial_screens/CommonWidgets.dart';
import 'package:soar_initial_screens/ThemeData/SizingUtils.dart';
import 'package:soar_initial_screens/Backend Functions/Functions.dart';

// This is the Sign In Screen that users will navigate to
// after clicking Login

// method that serves as a getter for the height of this screen
// for the bouncing animation
String _email;
String _password;
double ogHeight = 0;

double getHeight() {
  return ogHeight;
}

class SignInScreen extends StatefulWidget {
  static const String id = 'signIn';

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen>
    with SingleTickerProviderStateMixin {
  Widget build(BuildContext context) {
    ogHeight = MediaQuery.of(context).size.height;
    return Background(
      AssetImage('assets/images/backgrounds/signInBackground.png'),
      Column(
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
    );
  }
}

class SignInCard extends StatefulWidget {
  SignInCard({Key key}) : super(key: key);

  @override
  SignInCardState createState() => SignInCardState();
}

// The large, rounded card on the screen
class SignInCardState extends State<SignInCard>
    with SingleTickerProviderStateMixin {
  double _height = getHeight() - (getHeight() / 10);

  @override
  void initState() {
    //Start the animation
    Future.delayed(Duration(milliseconds: 100)).then((value) => setState(() {
          _height = getHeight();
        }));
    super.initState();
  }

  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Container(
        width: double.infinity,
        // Decoration allows you to curve the corners of the card
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(40.0), topLeft: Radius.circular(40.0)),
          color: Colors.white,
        ),
        // Column will hold widgets within the curved card part of the app
        child: AnimatedContainer(
          //Duration of the animation
          duration: Duration(milliseconds: 600),
          //Animation finish
          curve: Curves.bounceOut,
          width: double.infinity,
          //height pointing to the global variable for the animation
          height: _height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(40.0),
                topLeft: Radius.circular(40.0)),
            color: Colors.white,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Sign In Text
              Expanded(
                flex: 4,
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: SizedBox(),
                    ),
                    Expanded(
                        flex: 7,
                        child: Text(
                          "Sign In",
                          style: TextStyle(
                              fontSize: MediaQuery.of(context).size.height *
                                  LARGE_TXT_SCALER,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'OpenSans'),
                        )),
                    Expanded(
                      flex: 1,
                      child: SizedBox(),
                    ),
                  ],
                ),
              ),
              // Email Text and Text Field
              Expanded(
                flex: 3,
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
                                fontSize: MediaQuery.of(context).size.height *
                                    SMALL_TXT_SCALER,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Expanded(
                          flex: 5,
                          child: SizedBox(),
                        ),
                      ],
                    ),
                    // helps space out the 'EMAIL' text and the text field underneath it
                    SizedBox(
                      height:
                          MediaQuery.of(context).size.height * HUNDRETH_SCALER,
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
                                  _email = value.trim();
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
                flex: 17,
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
                                  fontSize:
                                      (MediaQuery.of(context).size.height *
                                              HUNDRETH_SCALER) *
                                          2,
                                  fontWeight: FontWeight.bold),
                            )),
                        Expanded(
                          flex: 5,
                          child: SizedBox(),
                        ),
                      ],
                    ),
                    SizedBox(
                      height:
                          MediaQuery.of(context).size.height * HUNDRETH_SCALER,
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
                                  _password = value.trim();
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
                      height: MediaQuery.of(context).size.height *
                          HUNDRETH_SCALER *
                          3,
                    ),
                    // Spacing out the Forgot Password hyperlink with a row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Forgot password hypertext which will link to the Forgot Password page
                        ForgotPasswordText(),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height *
                          HUNDRETH_SCALER *
                          2,
                    ),
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
                      height: MediaQuery.of(context).size.height *
                          HUNDRETH_SCALER *
                          2,
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
              SizedBox(
                height: MediaQuery.of(context).size.height * HUNDRETH_SCALER,
              ),
              Expanded(
                flex: 2,
                child: SizedBox(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DontHaveAcctTxt extends StatelessWidget {
  const DontHaveAcctTxt({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
        text: TextSpan(
          style: TextStyle(
              fontSize: MediaQuery.of(context).size.height * TINY_TXT_SCALER,
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
                    fontSize:
                        MediaQuery.of(context).size.height * TINY_TXT_SCALER,
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
          signIn(_email, _password, context);
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
