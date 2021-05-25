import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:soar_initial_screens/ThemeData/SizingUtils.dart';
import 'package:soar_initial_screens/main.dart';

// This is the forgot password screen where users can enter their email
// address

class ForgotPassScreen extends StatefulWidget {
  static const String id = 'forgotPass';

  @override
  _ForgotPassScreenState createState() => _ForgotPassScreenState();
}

class _ForgotPassScreenState extends State<ForgotPassScreen> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(MediaQuery.of(context).size.width,
          MediaQuery.of(context).size.height),
      builder: () => Scaffold(
          // overarching container for the entire screen
          body: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minWidth: MediaQuery.of(context).size.width,
                minHeight: MediaQuery.of(context).size.height,
              ),
              // sizes the container child to the intrinsic height of the screen
              child: IntrinsicHeight(
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        alignment: Alignment(-.2, 0),
                        // background image
                        image:
                            AssetImage('assets/images/splashReplicaNoLogo.png'),
                        fit: BoxFit.cover),
                  ),
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    children: [
                      // part of the screen that allows the background image to display
                      // on the top of the screen
                      Expanded(
                        flex: 2,
                        child: SizedBox(),
                      ),
                      // bottom two thirds portion of the screen with the information on the card
                      Expanded(
                        flex: 4,
                        child: Container(
                          width: double.infinity,
                          // gives the circular borders to the card on the screen
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(40.0),
                                topLeft: Radius.circular(40.0)),
                            color: Colors.white,
                          ),
                          // column that will hold the widgets in the card
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // the back button and the Forgot Password text
                              Expanded(
                                flex: 1,
                                // back button and forgot password text are in line horizontally
                                child: Row(
                                  children: [
                                    BackButton(),
                                    ForgotPswdText(),
                                  ],
                                ),
                              ),
                              // The email text, user input for email, and text underneath
                              Expanded(
                                flex: 1,
                                child: Column(
                                  children: [
                                    EmailText(),
                                    // space in between the email text and the actual text field for the
                                    // email text
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              HUNDRETH_SCALER *
                                              1.1,
                                    ),
                                    EmailTextBox(),
                                    // space in between the email textbox and the additional info text
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              HUNDRETH_SCALER,
                                    ),
                                    EmailAddlInfo(),
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Column(
                                  children: [
                                    EnterButton(),
                                  ],
                                ),
                              ),
                              // space underneath the 'ENTER' button
                              Expanded(
                                child: SizedBox(),
                                flex: 1,
                              ),
                            ],
                          ),
                        ),
                      ),
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

// The blue enter button at the bottom of the screen
class EnterButton extends StatelessWidget {
  const EnterButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SizedBox(),
          flex: 1,
        ),
        // The 'ENTER' button
        Expanded(
          flex: 5,
          child: Container(
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
              child: Text("ENTER",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize:
                          MediaQuery.of(context).size.height * SMALL_TXT_SCALER,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'OpenSans')),
              style: ElevatedButton.styleFrom(primary: Color(0xFF6AABEF)),
            ),
          ),
        ),
        Expanded(
          child: SizedBox(),
          flex: 1,
        ),
      ],
    );
  }
}

// The additional email information underneath the email textbox
class EmailAddlInfo extends StatelessWidget {
  const EmailAddlInfo({
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
        // the text underneath the text field
        Expanded(
          flex: 4,
          child: Text(
            "Enter the email address associated with your account",
            style: TextStyle(
              color: Colors.black,
              fontSize: MediaQuery.of(context).size.height * TINY_TXT_SCALER,
            ),
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

// The actual text box where the user can enter their email address
class EmailTextBox extends StatelessWidget {
  const EmailTextBox({
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
        // the user input text field
        Expanded(
          flex: 5,
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xFFe4f2fc),
              borderRadius: new BorderRadius.circular(BORDER_RADIUS),
            ),
            height: MediaQuery.of(context).size.height * FIELD_SIZE_SCALER,
            child: Padding(
              padding: EdgeInsets.fromLTRB(
                  MediaQuery.of(context).size.height * HUNDRETH_SCALER,
                  0,
                  0,
                  MediaQuery.of(context).size.height * HUNDRETH_SCALER * 1.2),
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintStyle: TextStyle(color: Colors.black),
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
    );
  }
}

// The word 'email' above the email textbox
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
        // the email text
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

// the back button to the left of the 'Forgot Password' Text
// at the top of the screen
class BackButton extends StatelessWidget {
  const BackButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: Padding(
          padding: EdgeInsets.fromLTRB(0, 0, 0,
              MediaQuery.of(context).size.height * HUNDRETH_SCALER * 6),
          // back button
          child: Tab(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}

class ForgotPswdText extends StatelessWidget {
  const ForgotPswdText({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 6,
      // Forgot Password title text
      child: Text(
        "Forgot \nPassword?",
        style: TextStyle(
            fontSize: MediaQuery.of(context).size.height * FIELD_SIZE_SCALER,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans'),
      ),
    );
  }
}
