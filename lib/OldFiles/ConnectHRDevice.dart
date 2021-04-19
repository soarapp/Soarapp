import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:soar_initial_screens/OldFiles/AppleMusicLogin.dart';
import 'package:soar_initial_screens/OldFiles/OtherSignUp.dart';
import 'package:soar_initial_screens/OldFiles/SpotifyLogin.dart';

// This is the connect Heart Screen which is no longer being used in this implementation
// of the application

class ConnectHRScreen extends StatefulWidget {
  static const String id = 'connectHR';

  @override
  _ConnectHRScreenState createState() => _ConnectHRScreenState();
}

class _ConnectHRScreenState extends State<ConnectHRScreen> {
  TextStyle defaultStyle = TextStyle(color: Colors.grey, fontSize: 20.0);
  TextStyle linkStyle = TextStyle(color: Colors.blue);

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
                flex: 1,
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
                    Expanded(flex: 12, child: SizedBox()),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Row(
                  children: [
                    Expanded(flex: 1, child: SizedBox()),
                    Expanded(
                      flex: 8,
                      child: Text(
                        "Connect Device for Heart Rate",
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
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text("APPLE WATCH",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xFFFF00D6),
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
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text("GOOGLE FIT",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xFF0ACF83),
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
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: InkWell(
                              child: Text("SKIP",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold))),
                          style:
                              ElevatedButton.styleFrom(primary: Colors.black),
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
                  children: [
                    Expanded(flex: 1, child: SizedBox()),
                    Expanded(
                      flex: 7,
                      child: RichText(
                        text: TextSpan(
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                          children: <TextSpan>[
                            TextSpan(
                                text: 'By clicking Sign Up, you agree to our '),
                            TextSpan(
                                text: 'Terms of Service',
                                style: linkStyle,
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    print('Terms of Service"');
                                  }),
                            TextSpan(text: ' and that you have read our '),
                            TextSpan(
                                text: 'Privacy Policy',
                                style: linkStyle,
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            scrollable: true,
                                            title: Text('Login'),
                                            content: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Form(
                                                child: Column(
                                                  children: <Widget>[
                                                    TextFormField(
                                                      decoration:
                                                          InputDecoration(
                                                        labelText: 'Name',
                                                        icon: Icon(
                                                            Icons.account_box),
                                                      ),
                                                    ),
                                                    TextFormField(
                                                      decoration:
                                                          InputDecoration(
                                                        labelText: 'Email',
                                                        icon: Icon(Icons.email),
                                                      ),
                                                    ),
                                                    TextFormField(
                                                      decoration:
                                                          InputDecoration(
                                                        labelText: 'Message',
                                                        icon:
                                                            Icon(Icons.message),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            actions: [
                                              ElevatedButton(
                                                  child: Text("Submit"),
                                                  onPressed: () {
                                                    // your code
                                                  })
                                            ],
                                          );
                                        });
                                  }),
                          ],
                        ),
                      ),
                    ),
                    Expanded(flex: 1, child: SizedBox()),
                  ],
                ),
              ),
              Expanded(
                flex: 6,
                child: SizedBox(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
