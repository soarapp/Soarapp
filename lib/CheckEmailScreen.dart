import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:soar_initial_screens/CreateAccScreen.dart';
import 'package:soar_initial_screens/SignInScreen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
    return ScreenUtilInit(
      designSize: Size(MediaQuery.of(context).size.width,
          MediaQuery.of(context).size.height),
      builder: () => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          // overarching widget which encompasses all other components on the screen
          body: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  alignment: Alignment(-.2, 0),
                  image: AssetImage('assets/images/backgrounds/splashReplicaNoLogo.png'),
                  fit: BoxFit.cover),
            ),
            alignment: Alignment.bottomCenter,
            child: Column(
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
          ),
        ),
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
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
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
                child: Image.asset('assets/images/icons/mailIcon.png'),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  "Check Your Email",
                  style: TextStyle(
                      fontSize: 25.sp,
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
                    width: MediaQuery.of(context).size.width / 1.2,
                    child: Text(
                      "A link to reset your password has been sent to the email address you entered!",
                      style: TextStyle(fontFamily: 'OpenSans', fontSize: 12.sp),
                      textAlign: TextAlign.center,
                    )),
              ),
              // the clickable didn't get the email text
              Expanded(
                flex: 3,
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(
                        fontSize: 12.sp,
                        color: Colors.black,
                        fontFamily: 'OpenSans'),
                    children: <TextSpan>[
                      TextSpan(
                          text: 'Didn\'t get the email?',
                          style: TextStyle(
                              color: Color(0xFF6AABEF),
                              fontSize: 12.sp,
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

class CreateAccButton extends StatelessWidget {
  const CreateAccButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55.h,
      child: ElevatedButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return CreateAccScreen();
              },
            ),
          );
        },
        child: Text(
          "NEW ACCOUNT",
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.sp,
          ),
        ),
        style: ElevatedButton.styleFrom(
          primary: Color(0xFFA2BBD5),
          elevation: 10.0,
          shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(10.0),
          ),
        ),
      ),
    );
  }
}

class LogInButton extends StatelessWidget {
  const LogInButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55.h,
      child: ElevatedButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return SignInScreen();
              },
            ),
          );
        },
        child: Text(
          "LOG IN",
          style: TextStyle(color: Colors.white, fontSize: 16.sp),
        ),
        style: ElevatedButton.styleFrom(
          primary: Color(0xFF80B7EF),
          elevation: 10.0,
          shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(10.0),
          ),
        ),
      ),
    );
  }
}
