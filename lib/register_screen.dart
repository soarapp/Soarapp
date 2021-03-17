import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:soar_initial_screens/create_acc_screen.dart';
import 'package:soar_initial_screens/sign_in_screen.dart';

class RegisterScreen extends StatefulWidget {
  static const String id = 'register';

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
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
                image: AssetImage('assets/images/splash.png'),
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
                        flex: 1,
                        child: SizedBox(),
                      ),
                      Expanded(
                        flex: 3,
                        child: Image.asset('assets/images/synchLogo.png'),
                      ),
                      Expanded(
                        flex: 3,
                        child: Text(
                          "Synch",
                          style: TextStyle(
                              fontSize: 80,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'OpenSans'),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: SizedBox(),
                            ),
                            Expanded(
                              flex: 3,
                              child: Container(
                                height: 55,
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
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    primary: Color(0xFF80B7EF),
                                    elevation: 10.0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                          new BorderRadius.circular(10.0),
                                    ),
                                  ),
                                ),
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
                        child: Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: SizedBox(),
                            ),
                            Expanded(
                              flex: 3,
                              child: Container(
                                height: 55,
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
                                      fontSize: 16,
                                    ),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    primary: Color(0xFFA2BBD5),
                                    elevation: 10.0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                          new BorderRadius.circular(10.0),
                                    ),
                                  ),
                                ),
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
                        child: SizedBox(),
                      ),
                      Expanded(
                        flex: 1,
                        child: Text(
                          "Powered by SOAR",
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'OpenSans',
                          ),
                        ),
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
