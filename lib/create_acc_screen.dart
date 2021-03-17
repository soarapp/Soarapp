import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:soar_initial_screens/forgot_pass_screen.dart';
import 'package:soar_initial_screens/link_sp_screen.dart';
import 'package:soar_initial_screens/sign_in_screen.dart';
import 'package:soar_initial_screens/themeData.dart';

import 'CommonWidgets.dart';

class CreateAccScreen extends StatefulWidget {
  static const String id = 'createAccount';

  @override
  _CreateAccScreenState createState() => _CreateAccScreenState();
}

class _CreateAccScreenState extends State<CreateAccScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
                alignment: Alignment(-.2, 0),
                image: AssetImage('assets/images/createAccBackground.png'),
                fit: BoxFit.fill),
          ),
          alignment: Alignment.bottomCenter,
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: SizedBox(),
              ),
              Expanded(
                flex: 3,
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
                      Expanded(
                        flex: 3,
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
                                      const EdgeInsets.fromLTRB(0, 0, 0, 50),
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
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "Create",
                                        style: TextStyle(
                                            fontSize: 38,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'OpenSans'),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "New Account",
                                        style: TextStyle(
                                            fontSize: 38,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'OpenSans'),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: SizedBox(),
                            ),
                          ],
                        ),
                      ),
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
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    )),
                                Expanded(
                                  flex: 5,
                                  child: SizedBox(),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: SizedBox(),
                                ),
                                Expanded(
                                  flex: 5,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Color(0xFFe4f2fc),
                                      borderRadius:
                                          new BorderRadius.circular(10.0),
                                    ),
                                    height: 50,
                                    child: Padding(
                                      padding: EdgeInsets.fromLTRB(8, 0, 0, 0),
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
                          ],
                        ),
                      ),
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
                                      "Password",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    )),
                                Expanded(
                                  flex: 5,
                                  child: SizedBox(),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: SizedBox(),
                                ),
                                Expanded(
                                  flex: 5,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Color(0xFFe4f2fc),
                                      borderRadius:
                                          new BorderRadius.circular(10.0),
                                    ),
                                    height: 50,
                                    child: Padding(
                                      padding: EdgeInsets.fromLTRB(8, 14, 0, 0),
                                      child: TextField(
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintStyle: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 34),
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
                              height: 10,
                            ),
                          ],
                        ),
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
                                Expanded(
                                    flex: 5,
                                    child: Text(
                                      "Confirm Password",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    )),
                                Expanded(
                                  flex: 5,
                                  child: SizedBox(),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: SizedBox(),
                                ),
                                Expanded(
                                  flex: 5,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Color(0xFFe4f2fc),
                                      borderRadius:
                                          new BorderRadius.circular(10.0),
                                    ),
                                    height: 50,
                                    child: Padding(
                                      padding: EdgeInsets.fromLTRB(8, 14, 0, 0),
                                      child: TextField(
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintStyle: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 34),
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
                          ],
                        ),
                      ),
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
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (context) {
                                              return LinkSpotifyScreen();
                                            },
                                          ),
                                        );
                                      },
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
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: SizedBox(),
                                ),
                                Expanded(
                                  flex: 4,
                                  child: RichText(
                                    text: TextSpan(
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.black,
                                          fontFamily: 'OpenSans'),
                                      children: <TextSpan>[
                                        TextSpan(
                                            text: 'Already have an account? ',
                                            recognizer: TapGestureRecognizer()
                                              ..onTap = () {
                                                print(
                                                    'Pressing Forgot Password');
                                              }),
                                        TextSpan(
                                            text: 'Sign In',
                                            style: TextStyle(
                                                color: Color(0xFF6AABEF),
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'OpenSans'),
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
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ProgressBarButton(
                              colorData: Color(0xFF6AABEF),
                              width: 13,
                              height: 13,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            ProgressBarButton(
                              colorData: Color(0xFFCDCDCD),
                              width: 10,
                              height: 10,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            ProgressBarButton(
                              colorData: Color(0xFFCDCDCD),
                              width: 10,
                              height: 10,
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
            ],
          ),
        ),
      ),
    );
  }
}
