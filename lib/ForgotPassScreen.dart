import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
      builder: () => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          // overarching container for the entire screen
          body: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  alignment: Alignment(-.2, 0),
                  // background image
                  image: AssetImage('assets/images/splash.png'),
                  fit: BoxFit.cover),
            ),
            alignment: Alignment.bottomCenter,
            child: Column(
              children: [
                // part of the screen that allows the background image to display
                // on the top of the screen
                Expanded(
                  flex: 1,
                  child: SizedBox(),
                ),
                // bottom two thirds portion of the screen with the information on the card
                Expanded(
                  flex: 2,
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
                          flex: 4,
                          // back button and forgot password text are in line horizontally
                          child: Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: InkWell(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Padding(
                                    padding:
                                         EdgeInsets.fromLTRB(0, 0, 0, MediaQuery.of(context).size.height * 0.01 * 8),
                                    // back button
                                    child: Tab(
                                      icon: Icon(
                                        Icons.arrow_back_ios,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 5,
                                // Forgot Password title text
                                child: Text(
                                  "Forgot Password?",
                                  style: TextStyle(
                                      fontSize: MediaQuery.of(context).size.height * 0.01 * 4.8,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'OpenSans'),
                                ),
                              ),
                            ],
                          ),
                        ),
                        // The email text, user input for email, and text underneath
                        Expanded(
                          flex: 4,
                          child: Column(
                            children: [
                              Row(
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
                                            fontSize: MediaQuery.of(context).size.height * 0.01 * 2,
                                            fontWeight: FontWeight.bold),
                                      )),
                                  Expanded(
                                    flex: 5,
                                    child: SizedBox(),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: MediaQuery.of(context).size.height * 0.01 * 1.1,
                              ),
                              Row(
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
                                        borderRadius:
                                            new BorderRadius.circular(10.0),
                                      ),
                                      height: MediaQuery.of(context).size.height * 0.01 * 5,
                                      child: Padding(
                                        padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.height * 0.01, 0, 0, 0),
                                        child: TextField(
                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                            hintStyle:
                                                TextStyle(color: Colors.black),
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
                              ),
                              SizedBox(
                                height: MediaQuery.of(context).size.height * 0.01 * 1.2,
                              ),
                              Row(
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
                                        fontSize: MediaQuery.of(context).size.height * 0.01 * 1.1,
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
                        Expanded(
                          flex: 3,
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
                                      height: MediaQuery.of(context).size.height * 0.01 * 5,
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
                                                fontSize: MediaQuery.of(context).size.height * 0.01 * 2,
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
                              SizedBox(
                                height: MediaQuery.of(context).size.height * 0.01 * 1.1,
                              ),
                            ],
                          ),
                        ),
                        // space underneath the 'ENTER' button
                        Expanded(
                          flex: 1,
                          child: SizedBox(),
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
    );
  }
}
