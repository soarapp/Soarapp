import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:soar_initial_screens/CommonWidgets.dart';
import 'package:soar_initial_screens/screens/Registration/CreateAccScreen.dart';
import 'package:soar_initial_screens/screens/Registration/SignInScreen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:soar_initial_screens/ThemeData/SizingUtils.dart';

// the initial register screen where users can login or create an account


// method that serves as a getter for the height of this screen
// for the bouncing animation
double ogHeight = 0;

double getHeight() {
  return ogHeight;
}


class RegisterScreen extends StatefulWidget {
  static const String id = 'register';

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    ogHeight = MediaQuery.of(context).size.height;
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    // getter method for screenHeight
    return ScreenUtilInit(
      designSize: Size(screenWidth, screenHeight),
      builder: () => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          // overarching widget which encompasses all other components on the screen
          body: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  alignment: Alignment(-.2, 0),
                  image: AssetImage('assets/images/backgrounds/splash.png'),
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
                RegisterCard(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class RegisterCard extends StatefulWidget {
  RegisterCard({Key key}) : super(key: key);

  @override
  RegisterCardState createState() => RegisterCardState();
}


class RegisterCardState extends State<RegisterCard>
    with SingleTickerProviderStateMixin {
  double _height = getHeight() - (getHeight() / 10);
  @override
  void initState() {
    //Start the animation
    Future.delayed(Duration(milliseconds: 100)).then((value) => setState(() {
      _height = getHeight();
    }));
    super.initState();
  }

  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Container(
        // in a col, so vertical axis is already defined by expanded
        // need to define cross axis dimensions
        width: double.infinity,
        decoration: BoxDecoration(
          // creating a curved border radius for the card
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(40.0), topLeft: Radius.circular(40.0)),
          color: Colors.white,
        ),
        // adding vertical elements such as the the Synch Logo and buttons
        // within the card
        child: AnimatedContainer(
          //Duration of the animation
          duration: Duration(milliseconds: 600),
          //Animation finish
          curve: Curves.bounceOut,
          width: double.infinity,
          //height pointing to the global variable for the animation
          height: _height,
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
                flex: 2,
                child: Image.asset('assets/images/icons/wavesLogo.png'),
              ),
              Expanded(
                flex: 2,
                child: Text(
                  "Waves",
                  style: TextStyle(
                      fontSize:
                          MediaQuery.of(context).size.height * LARGE_TXT_SCALER,
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
                      child: ReusableButton(buttonText: "LOG IN", buttonHeight: MediaQuery.of(context).size.height * LG_BUTTON_SCALER,
                        textSize: MediaQuery.of(context).size.height * SMALL_TXT_SCALER, textColor: Colors.white,
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) {
                                return SignInScreen();
                              },
                            ),
                          );
                        },),
                    ),
                    Expanded(
                      flex: 2,
                      child: SizedBox(),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * HUNDRETH_SCALER * 2,
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
                      child: ReusableButton(buttonText: "NEW ACCOUNT", buttonHeight: MediaQuery.of(context).size.height * LG_BUTTON_SCALER,
                        textSize: MediaQuery.of(context).size.height * SMALL_TXT_SCALER, textColor: Colors.white,
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) {
                              return CreateAccScreen();
                            },
                          ),
                        );
                      }, buttonColor: Color(0xFFA2BBD5),),
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
                    fontSize:
                        MediaQuery.of(context).size.height * TINY_TXT_SCALER,
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
