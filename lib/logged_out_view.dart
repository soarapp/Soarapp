import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:soar_initial_screens/log_in_screen.dart';
import 'package:soar_initial_screens/register_step_one.dart';

class LoggedOutScreen extends StatefulWidget {
  static const String id = 'loggedOut';
  @override
  _LoggedOutScreenState createState() => _LoggedOutScreenState();
}

class _LoggedOutScreenState extends State<LoggedOutScreen> {
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
                flex: 4,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/images/soarStar.png'),
                      Text(
                        "SOAR", style: TextStyle(
                        fontSize: 35, fontWeight: FontWeight.bold, fontFamily: 'Comfortaa',
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
                      flex: 3,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) {
                                return LogInScreen();
                              },
                            ),
                          );
                        },
                         child: Text("LOG IN", style: TextStyle(color: Colors.black)),
                          style: ElevatedButton.styleFrom(primary: Colors.white, elevation: 10.0, side: BorderSide(),),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: SizedBox(),
                    ),
                    Expanded(
                      flex: 3,
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) {
                                  return RegisterOneScreen();
                                },
                              ),
                            );
                          }, child: Text("REGISTER", style: TextStyle(color: Colors.white)),
                        style: ElevatedButton.styleFrom(primary: Colors.black, elevation: 10.0),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: SizedBox(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}