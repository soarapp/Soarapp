import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:soar_initial_screens/CreateAccScreen.dart';
import 'package:soar_initial_screens/SignInScreen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// a screen which will confirm with the user that they are all set
// and should have received an email with their new credentials
// details

class AllSetScreen extends StatefulWidget {
  static const String id = 'allSet';

  @override
  _AllSetScreenState createState() => _AllSetScreenState();
}

class _AllSetScreenState extends State<AllSetScreen>
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
                  image: AssetImage('assets/images/splashReplicaNoLogo.png'),
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
            MediaQuery.of(context).size.height / 6),
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
                child: Image.asset('assets/images/circleChecked.png'),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  "You\'re All Set!",
                  style: TextStyle(
                      fontSize: 30.sp,
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
                      "Your password has been succesfully updated",
                      style: TextStyle(fontFamily: 'OpenSans', fontSize: 12.sp),
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
                flex: 5,
                child: Column(
                  children: [
                    // spacing out the 'ENTER' button horizontally
                    Row(
                      children: [
                        Expanded(
                          child: SizedBox(),
                          flex: 1,
                        ),
                        // The 'ENTER' button
                        Expanded(
                          flex: 5,
                          child: Container(
                            height: 50.h,
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
                                      fontSize: 18.sp,
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
