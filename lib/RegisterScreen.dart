import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:soar_initial_screens/CreateAccScreen.dart';
import 'package:soar_initial_screens/SignInScreen.dart';

// the initial register screen where users can login or create an account

class RegisterScreen extends StatefulWidget {
  static const String id = 'register';

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> with SingleTickerProviderStateMixin {
  @override
  AnimationController _animationController;

  @override
  void initState() {
    _animationController= AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 150)
    );
    Timer(Duration(milliseconds: 100), () => _animationController.forward());

    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();

  }

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        // overarching widget which encompasses all other components on the screen
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
              // expanded with SizedBox in a col helps create a gap between
              // the top of the screen and the curved white card
              Expanded(
                flex: 1,
                child: SizedBox(),
              ),
              // Container acts as curved white card which contains elements
              RegisterCard(
                animationController: _animationController,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RegisterCard extends StatelessWidget {

  final AnimationController animationController;

  const RegisterCard({
    Key key, @required this.animationController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: SlideTransition(
        position: Tween<Offset>(
          begin: Offset(0,1),
          end: Offset.zero,
        ).animate(animationController),
        child: Container(
          // in a col, so vertical axis is already defined by expanded
          // need to define cross axis dimensions
          width: double.infinity,
          decoration: BoxDecoration(
            // creating a curved border radius for the card
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(40.0),
                topLeft: Radius.circular(40.0)),
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
              // LOG IN Button
              Expanded(
                // creating a row within a vertical expanded element helps optimize
                // the cross axis (the row) for effective resizing with different
                // screen sizes
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
              // NEW ACCOUNT button
              Expanded(
                flex: 2,
                // creating a row within a vertical expanded element helps optimize
                // the cross axis (the row) for effective resizing with different
                // screen sizes
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
              // space between NEW ACCOUNT button and the 'Powered by SOAR' text
              Expanded(
                flex: 2,
                child: SizedBox(),
              ),
              // text at the bottom of the screen
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
    );
  }
}

