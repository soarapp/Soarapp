import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:soar_initial_screens/OldFiles/ConnectHRDevice.dart';

// this is the apple music login screen that is no longer being used in this iteration
// of the application

class AppMusicLogInScreen extends StatefulWidget {
  static const String id = 'appMusicLogIn';

  @override
  _AppMusicLogInScreenState createState() => _AppMusicLogInScreenState();
}

class _AppMusicLogInScreenState extends State<AppMusicLogInScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 2,
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: SizedBox(),
                    ),
                    Expanded(
                        flex: 1,
                        child: InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Tab(
                              icon: Image.asset(
                                'assets/images/backArrow.png',
                                width: 25,
                                height: 25,
                              ),
                            ))),
                    Expanded(flex: 3, child: SizedBox()),
                    Expanded(
                      flex: 5,
                      child: Image.asset('assets/images/appleMusicLogo.png',
                          width: 60, height: 60),
                    ),
                    Expanded(flex: 5, child: SizedBox()),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Row(
                  children: [
                    Expanded(flex: 1, child: SizedBox()),
                    Expanded(
                      flex: 8,
                      child: Text(
                        "Apple Music Login",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Comfortaa',
                            fontSize: 35.0),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 1,
                      child: SizedBox(),
                    ),
                    Expanded(
                      flex: 7,
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 2),
                        ),
                        height: 50,
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(8, 0, 0, 0),
                          child: TextField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'email',
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
                ),
              ),
              Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 1,
                      child: SizedBox(),
                    ),
                    Expanded(
                      flex: 7,
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 2),
                        ),
                        height: 50,
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(8, 0, 0, 0),
                          child: TextField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'password',
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
                ),
              ),
              Expanded(
                flex: 1,
                child: SizedBox(),
              ),
              Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 1,
                      child: SizedBox(),
                    ),
                    Expanded(
                      flex: 7,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Container(
                            height: 50,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return ConnectHRScreen();
                                    },
                                  ),
                                );
                              },
                              child: Text("NEXT",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold)),
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.black),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: SizedBox(),
                    ),
                  ],
                  // By signing up, you agree to SOAR's Terms of Service and Privacy Policy.
                ),
              ),
              Expanded(
                flex: 1,
                child: Row(
                  children: [
                    Expanded(flex: 1, child: SizedBox()),
                    Expanded(
                        flex: 7,
                        child: Text(
                            "By signing up, you agree to SOAR's Terms of Service and Privacy Policy.",
                            style: TextStyle(color: Colors.black))),
                    Expanded(flex: 1, child: SizedBox()),
                  ],
                ),
              ),
              Expanded(
                flex: 7,
                child: SizedBox(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
