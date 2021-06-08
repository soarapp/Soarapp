import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:soar_initial_screens/screens/Registration/LinkSpScreen.dart';
import 'package:soar_initial_screens/screens/Registration/SignInScreen.dart';
import 'package:soar_initial_screens/ThemeData/SizingUtils.dart';
import 'package:soar_initial_screens/main.dart';
import '../../CommonWidgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:soar_initial_screens/screens/Registration/RegisterScreen.dart';
import 'package:soar_initial_screens/CommonWidgets.dart';

// This is the create accounts screen where users can enter their email,
// password, and password verification

// method that serves as a getter for the height of this screen
// for the bouncing animation
double ogHeight = 0;

double getHeight() {
  return ogHeight;
}

class CreateAccScreen extends StatefulWidget {
  static const String id = 'createAccount';

  @override
  _CreateAccScreenState createState() => _CreateAccScreenState();
}

// Here we extend state with SingleTickerProviderStateMixIn in order to enable
// animations for this class
class _CreateAccScreenState extends State<CreateAccScreen>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    ogHeight = MediaQuery.of(context).size.height;
    return ScreenUtilInit(
      designSize: Size(MediaQuery.of(context).size.width,
          MediaQuery.of(context).size.height),
      builder: () => Scaffold(
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
                      image: AssetImage(
                          'assets/images/backgrounds/createAccBackground.png'),
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
      flex: 3,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(40.0), topLeft: Radius.circular(40.0)),
          color: Colors.white,
        ),
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
              // The Create New Account Text and the back button
              Expanded(
                flex: 3,
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      // InkWell allows the icon to be clickable thus making it a button
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(
                            MediaQuery.of(context).size.width *
                                HUNDRETH_SCALER *
                                2,
                            MediaQuery.of(context).size.width *
                                HUNDRETH_SCALER *
                                2,
                            0,
                            MediaQuery.of(context).size.width / 10),
                        child: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Tab(
                            icon: Icon(
                              Icons.arrow_back_ios,
                              color: Colors.black,
                              size:
                                  MediaQuery.of(context).size.height * 0.01 * 3,
                            ),
                          ),
                        ),
                      ),
                    ),
                    // The Create New Account text at the top of the screen
                    Expanded(
                      flex: 5,
                      child: CreateNewAcctText(),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height:
                    MediaQuery.of(context).size.height * HUNDRETH_SCALER * 2,
              ),
              // This is the email text
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    EmailText(),
                    SizedBox(
                      height: MediaQuery.of(context).size.height *
                          HUNDRETH_SCALER *
                          2,
                    ),
                    CreateAcctTxtBox(),
                  ],
                ),
              ),
              SizedBox(
                height:
                    MediaQuery.of(context).size.height * HUNDRETH_SCALER * 2,
              ),
              // Password text and password textbox
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    // 'Password' Text above Password textbox
                    PasswordText(),
                    SizedBox(
                      height:
                          MediaQuery.of(context).size.height * HUNDRETH_SCALER,
                    ),
                    CreateAcctTxtBox(),
                  ],
                ),
              ),
              SizedBox(
                height:
                    MediaQuery.of(context).size.height * HUNDRETH_SCALER * 2,
              ),
              // Confirm Password Text and Field
              Expanded(
                flex: 3,
                child: Column(
                  children: [
                    ConfirmPsswdText(),
                    SizedBox(
                      height:
                          MediaQuery.of(context).size.height * HUNDRETH_SCALER,
                    ),
                    CreateAcctTxtBox(),
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
                          child: ReusableButton(
                            buttonText: "NEXT STEP",
                            textColor: Colors.white,
                            buttonHeight: MediaQuery.of(context).size.height *
                                BUTTON_SCALER,
                            textSize: MediaQuery.of(context).size.height *
                                SMALL_TXT_SCALER,
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) {
                                    return LinkSpotifyScreen();
                                  },
                                ),
                              );
                            },
                          ),
                        ),
                        Expanded(
                          child: SizedBox(),
                          flex: 1,
                        ),
                      ],
                    ),
                    Expanded(
                      flex: 4,
                      child: AlrAcctText(),
                    ),
                  ],
                ),
              ),
              // the three dot progress indicator at the bottom of the screen
              CircularProgressBar(
                numPages: 3,
                currPage: 1,
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

class CreateNewAcctText extends StatelessWidget {
  const CreateNewAcctText({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "Create \nNew Account",
          style: TextStyle(
              fontSize: MediaQuery.of(context).size.height * MED_TXT_SCALER,
              fontWeight: FontWeight.bold,
              fontFamily: 'OpenSans'),
        ),
      ],
    );
  }
}

class ConfirmPsswdText extends StatelessWidget {
  const ConfirmPsswdText({
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
        // the text for the confirm password
        Expanded(
          flex: 5,
          child: Text(
            "Confirm Password",
            style: TextStyle(
                fontSize: MediaQuery.of(context).size.height * SMALL_TXT_SCALER,
                fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
          flex: 5,
          child: SizedBox(),
        ),
      ],
    );
  }
}

class CreateAcctTxtBox extends StatelessWidget {
  const CreateAcctTxtBox({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
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
            paddingLeft: MediaQuery.of(context).size.height * HUNDRETH_SCALER,
            paddingBottom: MediaQuery.of(context).size.height * HUNDRETH_SCALER,
            fieldHeight: MediaQuery.of(context).size.height * FIELD_SIZE_SCALER,
            borderRadius: BORDER_RADIUS,
            hintTextColor: Colors.black,
          ),
        ),
        Expanded(
          flex: 1,
          child: SizedBox(),
        ),
      ],
    );
  }
}

class PasswordText extends StatelessWidget {
  const PasswordText({
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
        // this is the password text
        Expanded(
            flex: 5,
            child: Text(
              "Password",
              style: TextStyle(
                  fontSize:
                      MediaQuery.of(context).size.height * SMALL_TXT_SCALER,
                  fontWeight: FontWeight.bold),
            )),
        Expanded(
          flex: 5,
          child: SizedBox(),
        ),
      ],
    );
  }
}

class AlrAcctText extends StatelessWidget {
  const AlrAcctText({
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
                text: 'Already have an account? ',
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    print('Pressing Forgot Password');
                  }),
            TextSpan(
                text: 'Sign In',
                style: TextStyle(
                    color: Color(0xFF6AABEF),
                    fontSize:
                        MediaQuery.of(context).size.height * TINY_TXT_SCALER,
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
              "Email",
              style: TextStyle(
                  fontSize:
                      MediaQuery.of(context).size.height * SMALL_TXT_SCALER,
                  fontWeight: FontWeight.bold),
            )),
        Expanded(
          flex: 5,
          child: SizedBox(),
        ),
      ],
    );
  }
}
