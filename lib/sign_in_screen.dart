import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:soar_initial_screens/forgot_pass_screen.dart';
import 'package:soar_initial_screens/create_acc_screen.dart';

class SignInScreen extends StatefulWidget {
  static const String id = 'signIn';

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
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
                image: AssetImage('assets/images/signInBackground.png'),
                fit: BoxFit.cover),
          ),
          alignment: Alignment.bottomCenter,
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: SizedBox(),
              ),
              Expanded(
                flex: 2,
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
                              child: SizedBox(),
                            ),
                            Expanded(
                                flex: 5,
                                child: Text(
                                  "Sign In",
                                  style: TextStyle(
                                      fontSize: 80,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'OpenSans'),
                                )),
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
                                          hintText: '••••••••••••',
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
                            Row(
                              children: [
                                Expanded(
                                  flex: 4,
                                  child: SizedBox(),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: RichText(
                                    text: TextSpan(
                                      children: <TextSpan>[
                                        TextSpan(
                                            text: 'Forgot Password?',
                                            style: TextStyle(color: Color(0xFF6AABEF), fontSize: 12, fontWeight: FontWeight.bold),
                                            recognizer: TapGestureRecognizer()
                                              ..onTap = () {
                                                Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                    builder: (context) {
                                                      return ForgotPassScreen();
                                                    },
                                                  ),
                                                );
                                              }),
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 4,
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
                                  flex: 1,
                                  child: SizedBox(),
                                ),
                                Expanded(
                                  flex: 4,
                                  child: RichText(
                                    text: TextSpan(
                                      style: TextStyle(fontSize: 12, color: Colors.black, fontFamily: 'OpenSans'),
                                      children: <TextSpan>[
                                        TextSpan(
                                            text: 'Don\'t have an account? ',
                                            recognizer: TapGestureRecognizer()
                                              ..onTap = () {
                                                print('Pressing Forgot Password');
                                              }),
                                        TextSpan(
                                            text: 'Create new account',
                                            style: TextStyle(color: Color(0xFF6AABEF), fontSize: 12, fontWeight: FontWeight.bold, fontFamily: 'OpenSans'),
                                            recognizer: TapGestureRecognizer()
                                                ..onTap = () {
                                                Navigator.of(context).push(
                                                MaterialPageRoute(
                                                builder: (context) {
                                                return CreateAccScreen();
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
