import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LogInScreen extends StatefulWidget {
  static const String id = 'logIn';

  @override
  _LogInScreenState createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
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
                        "Log In",
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
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 2),
                        ),
                        height: 50,
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(8, 0, 0, 0),
                          child: TextField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Email',
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
                              hintText: '••••••••••••••',
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
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text("LOG IN",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
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
