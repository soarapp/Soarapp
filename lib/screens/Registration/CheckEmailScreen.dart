import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:soar_initial_screens/screens/Registration/SignInScreen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:soar_initial_screens/ThemeData/SizingUtils.dart';
import 'package:soar_initial_screens/CommonWidgets.dart';

// the screen where users will receive a message to check their email
// for further updates after trying to retrieve their new password

class CheckEmailScreen extends StatefulWidget {
  static const String id = 'checkEmailScreen';

  @override
  _CheckEmailScreenState createState() => _CheckEmailScreenState();
}

class _CheckEmailScreenState extends State<CheckEmailScreen>
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
            MediaQuery.of(context).size.height / 5),
        child: Container(
          // in a col, so vertical axis is already defined by expanded
          // need to define cross axis dimensions
          width: double.infinity,
          decoration: BoxDecoration(
            // creating a curved border radius for the card
            borderRadius: BorderRadius.all(Radius.circular(MED_BORDER_RADIUS)),
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
                flex: 7,
                child: Image.asset('assets/images/icons/mailIcon.png'),
              ),
              Expanded(
                flex: 1,
                child: Text(
                  "Check Your Email",
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height *
                          SEM_MED_TXT_SCALER,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'OpenSans'),
                ),
              ),
              Expanded(
                flex: 1,
                child: SizedBox(),
              ),
              Expanded(
                flex: 2,
                child: Container(
                    width: MediaQuery.of(context).size.width / 1.2,
                    child: Text(
                      "A link to reset your password has been sent to the email address you entered!",
                      style: TextStyle(
                          fontFamily: 'OpenSans',
                          fontSize: MediaQuery.of(context).size.height *
                              SMALL_TXT_SCALER),
                      textAlign: TextAlign.center,
                    )),
              ),
              // the clickable didn't get the email text
              Expanded(
                flex: 2,
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height *
                            SMALL_TXT_SCALER,
                        color: Colors.black,
                        fontFamily: 'OpenSans'),
                    children: <TextSpan>[
                      TextSpan(
                          text: 'Didn\'t get the link?',
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
