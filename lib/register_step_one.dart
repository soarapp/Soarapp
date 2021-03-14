import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:soar_initial_screens/apple_music_login.dart';
import 'package:soar_initial_screens/other_sign_up.dart';
import 'package:soar_initial_screens/spotify_login.dart';

class RegisterOneScreen extends StatefulWidget {
  static const String id = 'registerOne';
  @override
  _RegisterOneScreenState createState() => _RegisterOneScreenState();
}

class _RegisterOneScreenState extends State<RegisterOneScreen> {
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
                child: Row(children: [
                  Expanded(
                    flex: 1,
                    child: SizedBox(),
                  ),
                  Expanded(flex: 1, child: InkWell(onTap: () { Navigator.pop(context);},child: Tab(icon: Image.asset('assets/images/backArrow.png', width: 25, height: 25,),))),
                  Expanded(flex: 12, child: SizedBox()),
                ],),
              ),
              Expanded(
                flex: 2,
                child:Row(
                  children: [
                    Expanded(flex: 1, child: SizedBox()),
                    Expanded(flex: 8, child: Text("Sign Up With The Following Services", style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Comfortaa', fontSize: 35.0),),),
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
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) {
                                  return SpotifyLogInScreen();
                                },
                              ),
                            );
                          },
                          child: Text("SPOTIFY", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                          style: ElevatedButton.styleFrom(primary: Color(0xFF0ACF83),),
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
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) {
                                  return AppMusicLogInScreen();
                                },
                              ),
                            );
                          },
                          child: Text("APPLE MUSIC", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                          style: ElevatedButton.styleFrom(primary: Color(0xFFFF00D6),),
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
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) {
                                  return OtherSignUpScreen();
                                },
                              ),
                            );
                          },
                          child: Text("OPT OUT OF MUSIC FUNCTIONALITIES OR ADD ACCOUNT LATER", textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                          style: ElevatedButton.styleFrom(primary: Colors.black),
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