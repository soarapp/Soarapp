import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:soar_initial_screens/screens/Registration/ForgotPassScreen.dart';
import 'package:soar_initial_screens/screens/Registration/LinkSpScreen.dart';
import 'package:soar_initial_screens/screens/Registration/SignInScreen.dart';
import 'package:soar_initial_screens/ThemeData/SizingUtils.dart';
import 'package:soar_initial_screens/ThemeData/ColorUtils.dart';
import '../../CommonWidgets.dart';
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
    return Background(
      AssetImage('assets/images/backgrounds/createAccBackground.png'),
      Column(
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
                    child: BackButton(),
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
                              "Reset \nPassword",
                              style: TextStyle(
                                  fontSize: MediaQuery.of(context).size.height *
                                      LARGE_TXT_SCALER,
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
                      // this is the text field for a user's email
                      Expanded(
                        flex: 5,
                        child: UsrInputTxtBox(
                          fieldColor: Color(0xFFe4f2fc),
                          paddingLeft: MediaQuery.of(context).size.height *
                              HUNDRETH_SCALER,
                          paddingBottom: MediaQuery.of(context).size.height *
                              HUNDRETH_SCALER,
                          fieldHeight: MediaQuery.of(context).size.height *
                              FIELD_SIZE_SCALER,
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
                                fontSize: MediaQuery.of(context).size.height *
                                    SMALL_TXT_SCALER,
                                fontWeight: FontWeight.bold),
                          )),
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
                      Expanded(
                        flex: 5,
                        // the text field for the password
                        child: UsrInputTxtBox(
                          fieldColor: Color(0xFFe4f2fc),
                          paddingLeft: MediaQuery.of(context).size.height *
                              HUNDRETH_SCALER,
                          paddingBottom: MediaQuery.of(context).size.width / 50,
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
                        child: ReusableButton(
                          buttonHeight: MediaQuery.of(context).size.height *
                              LG_BUTTON_SCALER,
                          buttonText: "RESET PASSWORD",
                          textSize: MediaQuery.of(context).size.height *
                              SMALL_TXT_SCALER,
                          textColor: Colors.white,
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
                  SizedBox(
                    height:
                        MediaQuery.of(context).size.height * HUNDRETH_SCALER,
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
    );
  }
}

class BackButton extends StatelessWidget {
  const BackButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
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
