import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:soar_initial_screens/screens/Registration/CreateAccScreen.dart';
import 'package:soar_initial_screens/screens/Registration/SignInScreen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:soar_initial_screens/ThemeData/SizingUtils.dart';
import 'package:soar_initial_screens/CommonWidgets.dart';

// a screen which will let the user know that there has ben an error in signing into
// their account

class SignInErrorScreen extends StatefulWidget {
  static const String id = 'signInError';

  @override
  _SignInErrorScreenState createState() => _SignInErrorScreenState();
}

class _SignInErrorScreenState extends State<SignInErrorScreen>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Background(
      AssetImage('assets/images/backgrounds/splashReplicaNoLogo.png'),
      Column(
        children: [
          // expanded with SizedBox in a col helps create a gap between
          // the top of the screen and the curved white card
          Expanded(
            flex: 1,
            child: SizedBox(),
          ),
          // Container acts as curved white card which contains elements
          RegisterCard(),
        ],
      ),
    );
  }
}

class RegisterCard extends StatelessWidget {
  const RegisterCard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 4,
      child: Padding(
        padding: EdgeInsets.fromLTRB(
            MediaQuery.of(context).size.width / 20,
            0,
            MediaQuery.of(context).size.width / 20,
            MediaQuery.of(context).size.height / 6),
        child: Container(
          // in a col, so vertical axis is already defined by expanded
          // need to define cross axis dimensions
          width: double.infinity,
          decoration: BoxDecoration(
            // creating a curved border radius for the card
            borderRadius: BorderRadius.all(Radius.circular(LG_BORDER_RADIUS)),
            color: Colors.white,
          ),
          // adding vertical elements such as the the Synch Logo and buttons
          // within the card
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 1,
                child: SizedBox(),
              ),
              // the image of the security lock
              Expanded(
                flex: 12,
                child: Image.asset('assets/images/icons/lock.png'),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  "Sign In Error",
                  style: TextStyle(
                      fontSize:
                          MediaQuery.of(context).size.height * MED_TXT_SCALER,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'OpenSans'),
                ),
              ),
              Expanded(
                flex: 1,
                child: SizedBox(),
              ),
              Expanded(
                flex: 5,
                child: Container(
                    width: MediaQuery.of(context).size.width / 1.5,
                    child: Text(
                      "A link has been sent to your email address. Please confirm your email before signing in!",
                      style: TextStyle(
                          fontFamily: 'OpenSans',
                          fontSize: MediaQuery.of(context).size.height *
                              SMALL_TXT_SCALER),
                      textAlign: TextAlign.center,
                    )),
              ),
              // space between above paragraph text and clickable didn't get the email text below
              Expanded(
                flex: 1,
                child: SizedBox(),
              ),
              // the clickable didn't get the email text
              Expanded(
                flex: 3,
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height *
                            SMALL_TXT_SCALER,
                        color: Colors.black,
                        fontFamily: 'OpenSans'),
                    children: <TextSpan>[
                      TextSpan(
                          text: 'Didn\'t get the email?',
                          style: TextStyle(
                              color: Color(0xFF6AABEF),
                              fontSize: MediaQuery.of(context).size.height *
                                  SMALL_TXT_SCALER,
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
        ),
      ),
    );
  }
}
