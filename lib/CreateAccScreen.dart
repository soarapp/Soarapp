import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:soar_initial_screens/LinkSpScreen.dart';
import 'package:soar_initial_screens/SignInScreen.dart';
import 'package:soar_initial_screens/ThemeData/SizingUtils.dart';
import 'package:soar_initial_screens/ThemeData/ColorUtils.dart';
import 'package:soar_initial_screens/Backend Functions/Functions.dart';
import 'CommonWidgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_auth/firebase_auth.dart';
// This is the create accounts screen where users can enter their email,
// password, and password verification

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

  String _email, _password, _confirmpass;
  final auth = FirebaseAuth.instance;
  final _cpassKey = GlobalKey<FormState>();
  final _emailKey = GlobalKey<FormState>();
  final _passKey = GlobalKey<FormState>();

  // check if the user inputs are valid or not
  void _checkForm() async {
    final isCpassValid = _cpassKey.currentState.validate();
    final isEmailValid = _emailKey.currentState.validate();
    final isPassValid = _passKey.currentState.validate();
    if (isEmailValid && isPassValid && isCpassValid) {
      createAcc(_email, _password);
      confirmEmail(_email, _password);
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) {
            return LinkSpotifyScreen();
          },
        ),
      );
    }
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
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0xFFe4f2fc),
                              borderRadius: new BorderRadius.circular(10.0),
                            ),
                            height: 50,
                            child: Padding(
                                padding: EdgeInsets.fromLTRB(8, 0, 0, 0),
                                child: Form(
                                  key: _emailKey,
                                  // Email TextField
                                  child: TextFormField(
                                    keyboardType: TextInputType.emailAddress,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintStyle: TextStyle(color: Colors.grey),
                                    ),
                                    validator: (value) {
                                      if (value.trim().isEmpty) {
                                        return 'Please enter your email address';
                                      }
                                      // Check if the entered email has the right format
                                      if (!RegExp(r'\S+@\S+\.\S+')
                                          .hasMatch(value)) {
                                        return 'Please enter a valid email address';
                                      }
                                      // Return null if email is valid
                                      return null;
                                    },
                                    onChanged: (value) {
                                      setState(() {
                                        _email = value.trim();
                                      });
                                    },
                                  ),
                                )),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: SizedBox(),
                        ),
                      ],
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
                                  fontSize: 18.sp, fontWeight: FontWeight.bold),
                            )),
                        Expanded(
                          flex: 5,
                          child: SizedBox(),
                        ),
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
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0xFFe4f2fc),
                              borderRadius: new BorderRadius.circular(10.0),
                            ),
                            height: 50,
                            child: Padding(
                                padding: EdgeInsets.fromLTRB(8, 14, 0, 0),
                                child: Form(
                                  key: _passKey,
                                  // Password textfield
                                  child: TextFormField(
                                    obscureText: true,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintStyle: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 34),
                                    ),
                                    validator: (value) {
                                      if (value.trim().isEmpty) {
                                        return 'This field is required';
                                      }
                                      if (value.trim().length < 8) {
                                        return 'Password must be at least 8 characters in length';
                                      }
                                      // Return null if the entered password is valid
                                      return null;
                                    },
                                    onChanged: (value) {
                                      setState(() {
                                        _password = value.trim();
                                      });
                                    },
                                  ),
                                )),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: SizedBox(),
                        ),
                      ],
                    ),
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
                              borderRadius: new BorderRadius.circular(10.0),
                            ),
                            height: 50,
                            child: Padding(
                                padding: EdgeInsets.fromLTRB(8, 14, 0, 0),
                                // validate everything in the child form
                                child: Form(
                                  key: _cpassKey,
                                  child: TextFormField(
                                    obscureText: true,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintStyle: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 34),
                                    ),
                                    validator: (value) {
                                      // check if value is empty
                                      if (value.trim().isEmpty) {
                                        return 'This field is required';
                                      }
                                      // check if the passwords are not equal

                                      if (value.trim() != _password) {
                                        return 'Confirmation password does not match the entered password';
                                      }

                                      return null;
                                    },
                                    onChanged: (value) {
                                      setState(() {
                                        _confirmpass = value.trim();
                                      });
                                    },
                                  ),
                                )),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: SizedBox(),
                        ),
                      ],
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
                          child: Container(
                            height: 50,
                            child: ElevatedButton(
                              onPressed: () {
                                _checkForm();
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
                    Expanded(
                      flex: 4,
                      child: AlrAcctText(),
                    ),
                  ],
                ),
              ),
              // the three dot progress indicator at the bottom of the screen
              CircularProgressBar(),
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
            width: MediaQuery.of(context).size.height * PROG_BAR_SCALER,
            height: MediaQuery.of(context).size.height * PROG_BAR_SCALER,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.height * HUNDRETH_SCALER,
          ),
          ProgressBarButton(
            colorData: Color(0xFFCDCDCD),
            width: MediaQuery.of(context).size.height * PROG_BAR_SCALER,
            height: MediaQuery.of(context).size.height * PROG_BAR_SCALER,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.height * HUNDRETH_SCALER,
          ),
          ProgressBarButton(
            colorData: Color(0xFFCDCDCD),
            width: MediaQuery.of(context).size.height * PROG_BAR_SCALER,
            height: MediaQuery.of(context).size.height * PROG_BAR_SCALER,
          ),
        ],
      ),
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

class NextStepButton extends StatelessWidget {
  const NextStepButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * BUTTON_SCALER,
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
                fontSize: MediaQuery.of(context).size.height * SMALL_TXT_SCALER,
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
