import 'dart:async';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:soar_initial_screens/Backend%20Functions/Functions.dart';
import 'package:soar_initial_screens/HomePgLanding.dart';
import 'package:soar_initial_screens/screens/Registration/SignInScreen.dart';
import 'package:soar_initial_screens/ThemeData/SizingUtils.dart';
import 'package:soar_initial_screens/CommonWidgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// This screen allows the user to customize their profile

// method that serves as a getter for the height of this screen
// for the bouncing animation
bool status = true;
String path;
double ogHeight = 0;
// global variables for user preferences
String _name;
String _socialMedia;
String _favSong;
String _bio;
// Get from gallery
_getFromGallery() async {
  PickedFile pickedFile = await ImagePicker().getImage(
    source: ImageSource.gallery,
    maxWidth: 1800,
    maxHeight: 1800,
  );
  if (pickedFile != null) {
    path = pickedFile.path;
    uploadFile(pickedFile.path, profilePicture);
  }
}

double getHeight() {
  return ogHeight;
}

class MakeProfileScreen extends StatefulWidget {
  static const String id = 'makeProfile';

  @override
  _MakeProfileScreenState createState() => _MakeProfileScreenState();
}

class _MakeProfileScreenState extends State<MakeProfileScreen>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    ogHeight = MediaQuery.of(context).size.height;
    return ScreenUtilInit(
      designSize: Size(MediaQuery.of(context).size.width,
          MediaQuery.of(context).size.height),
      builder: () => MaterialApp(
        debugShowCheckedModeBanner: false,
        // SingleChildScrollView widget allows the user to scroll through the screen
        home: Scaffold(
          body: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minWidth: MediaQuery.of(context).size.width,
                minHeight: MediaQuery.of(context).size.height * 1.7,
              ),
              // the overarching container that contains the entirety of the components
              // on the screen
              child: IntrinsicHeight(
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        alignment: Alignment(-.2, 0),
                        image:
                            AssetImage('assets/images/backgrounds/Group1.png'),
                        fit: BoxFit.fill),
                  ),
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    children: [
                      // the top part of the screen where you can see the background
                      // the top part of the screen with the 'Create Your Profile' text
                      SizedBox(
                          height: MediaQuery.of(context).size.height *
                              HUNDRETH_SCALER *
                              3),
                      Expanded(
                        flex: 1,
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: SizedBox(),
                            ),
                            Expanded(
                              flex: 9,
                              child: Row(
                                children: [
                                  Text(
                                    "Create Your \nProfile",
                                    style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.height *
                                                MED_TXT_SCALER,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'OpenSans'),
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
                      // the bottom portion of the screen with the white card and all
                      // of the components within the white card
                      Expanded(
                        flex: 8,
                        child: CreateProfileCard(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CreateProfileCard extends StatefulWidget {
  CreateProfileCard({Key key}) : super(key: key);

  @override
  CreateProfileCardState createState() => CreateProfileCardState();
}

class CreateProfileCardState extends State<CreateProfileCard>
    with SingleTickerProviderStateMixin {
  double _height = getHeight() * 1.7 - (getHeight() * 1.7 / 10);

  @override
  void initState() {
    //Start the animation
    Future.delayed(Duration(milliseconds: 100)).then((value) => setState(() {
          _height = getHeight() * 1.7;
        }));
    super.initState();
  }

  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(40.0), topLeft: Radius.circular(40.0)),
        color: Colors.white,
      ),
      // column within the white card
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
              topRight: Radius.circular(40.0), topLeft: Radius.circular(40.0)),
          color: Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // space right above the photo upload portion of the screen
            SizedBox(
              height: MediaQuery.of(context).size.height * HUNDRETH_SCALER * 3,
            ),
            // circular widget with camera icon where users can see their
            // current user profile picture and upload a new picture
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  CircleAvatar(
                      radius: 38.0,
                      backgroundImage: (status)
                          ? AssetImage(
                              'assets/images/other/defaultCamPhoto.png')
                          : FileImage((File(path)))
                      // backgroundColor: Colors.transparent,
                      ),
                  SizedBox(
                    height:
                        MediaQuery.of(context).size.height * HUNDRETH_SCALER,
                  ),
                  // The 'Add Photo' text
                  AddPhotoText(),
                ],
              ),
            ),
            // the part of the screen where users can enter their name in a text input
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: SizedBox(),
                      ),
                      // 'Name' text
                      Expanded(
                        flex: 10,
                        child: Text(
                          "Name",
                          style: TextStyle(
                              fontSize: MediaQuery.of(context).size.height *
                                  SMALL_TXT_SCALER,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: SizedBox(),
                      ),
                    ],
                  ),
                  SizedBox(
                    height:
                        MediaQuery.of(context).size.height * HUNDRETH_SCALER,
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: SizedBox(),
                      ),
                      Expanded(
                        flex: 12,
                        // the text field where users can enter their name
                        child: TextField(onChanged: (value) {
                          _name = value.trim();
                        }),
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
              flex: 8,
              // the part of the screen where the large card will be placed
              child: Column(
                children: [
                  UserInfoCard(),
                  SizedBox(
                    height: MediaQuery.of(context).size.height *
                        HUNDRETH_SCALER *
                        5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ReusableButton(
                        buttonHeight: MediaQuery.of(context).size.height *
                            LG_BUTTON_SCALER,
                        buttonText: "CREATE ACCOUNT",
                        textSize: MediaQuery.of(context).size.height *
                            SMALL_TXT_SCALER,
                        textColor: Colors.white,
                        onPressed: () {
                          addData(_name, _bio, _favSong, _socialMedia);
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) {
                                return HomePageScreen();
                              },
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height *
                        HUNDRETH_SCALER *
                        2,
                  ),
                  SkipStepText(),
                  SizedBox(
                    height: MediaQuery.of(context).size.height *
                        HUNDRETH_SCALER *
                        5,
                  ),
                  CircularProgressBar(numPages: 3, currPage: 3),
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
    );
  }
}

class NameTextField extends StatelessWidget {
  const NameTextField({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFF4F6F9),
        borderRadius: new BorderRadius.circular(10.0),
      ),
      height: MediaQuery.of(context).size.height * FIELD_SIZE_SCALER,
      child: Padding(
        padding: EdgeInsets.fromLTRB(
            MediaQuery.of(context).size.height * HUNDRETH_SCALER,
            MediaQuery.of(context).size.height * HUNDRETH_SCALER / 3,
            0,
            0),
        child: TextField(
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(
              bottom: MediaQuery.of(context).size.height * HUNDRETH_SCALER * 2,
            ),
            border: InputBorder.none,
            hintStyle:
                TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}

class AddPhotoText extends StatefulWidget {
  const AddPhotoText({
    Key key,
  }) : super(key: key);

  @override
  _AddPhotoTextState createState() => _AddPhotoTextState();
}

class _AddPhotoTextState extends State<AddPhotoText> {
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: TextStyle(
            fontSize: 12.sp, color: Colors.black, fontFamily: 'OpenSans'),
        children: <TextSpan>[
          TextSpan(
              text: 'Add Photo',
              style: TextStyle(
                  color: Color(0xFF6AABEF),
                  fontSize: 12.sp,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'OpenSans'),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  _getFromGallery();
                  setState(() {
                    status = false;
                  });
                }),
        ],
      ),
    );
  }
}

class UserInfoCard extends StatelessWidget {
  const UserInfoCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        // using a row to horizontally space out the card
        Row(
          children: [
            Expanded(
              child: SizedBox(),
              flex: 1,
            ),
            // the large card
            Expanded(
              flex: 15,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.01 * 50,
                decoration: BoxDecoration(
                  color: Color(0xFFFEFAFA),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child:
                    // will contain all of the widgets inside the large card
                    Column(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height *
                                HUNDRETH_SCALER,
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: SizedBox(),
                              ),
                              Expanded(
                                flex: 10,
                                child: Text(
                                  "What's your favorite song?",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: SizedBox(),
                              ),
                            ],
                          ),
                          SizedBox(
                              height: MediaQuery.of(context).size.height *
                                  HUNDRETH_SCALER),
                          Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: SizedBox(),
                              ),
                              // grey container which contains one of the songs,
                              // a hypertext link to add their favorite song,
                              // and a heart button to like the current song they are listening to
                              Expanded(
                                flex: 15,
                                child: FavSongBox(),
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
                    // the part of the screen where the user can enter their bio
                    Expanded(
                      flex: 1,
                      child: Row(
                        children: [
                          Expanded(
                            flex: 3,
                            child: BioBox(),
                          ),
                          // the part of the screen where users can enter their social media information
                          Expanded(
                            flex: 2,
                            child: SocialMediaBox(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: SizedBox(),
              flex: 1,
            ),
          ],
        ),
      ],
    );
  }
}

class SocialMediaBox extends StatelessWidget {
  const SocialMediaBox({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * HUNDRETH_SCALER,
        ),
        Row(
          children: [
            Expanded(
              flex: 1,
              child: SizedBox(),
            ),
            Expanded(
              flex: 10,
              child: Text(
                "Social Media",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              flex: 1,
              child: SizedBox(),
            ),
          ],
        ),
        SizedBox(height: MediaQuery.of(context).size.height * HUNDRETH_SCALER),
        Row(
          children: [
            Expanded(
              flex: 1,
              child: SizedBox(),
            ),
            Expanded(
              flex: 15,
              child: Container(
                height:
                    MediaQuery.of(context).size.width * HUNDRETH_SCALER * 28,
                decoration: BoxDecoration(
                  color: Color(0xFFF4F6F9),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: SizedBox(),
                    ),
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
    );
  }
}

class BioBox extends StatelessWidget {
  const BioBox({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * HUNDRETH_SCALER,
        ),
        Row(
          children: [
            Expanded(
              flex: 1,
              child: SizedBox(),
            ),
            Expanded(
              flex: 10,
              child: Text(
                "Bio",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              flex: 1,
              child: SizedBox(),
            ),
          ],
        ),
        SizedBox(height: MediaQuery.of(context).size.height * HUNDRETH_SCALER),
        Row(
          children: [
            Expanded(
              flex: 1,
              child: SizedBox(),
            ),
            Expanded(
              flex: 15,
              child: Container(
                height:
                    MediaQuery.of(context).size.width * HUNDRETH_SCALER * 28,
                decoration: BoxDecoration(
                  color: Color(0xFFF4F6F9),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: SizedBox(),
                    ),
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
    );
  }
}

class FavSongBox extends StatelessWidget {
  const FavSongBox({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.width * HUNDRETH_SCALER * 30,
      decoration: BoxDecoration(
        color: Color(0xFFE1E4EB),
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10)),
      ),
      child: Row(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.height * HUNDRETH_SCALER * 2,
          ),
          // grey box within the grey rectangle
          Expanded(
            flex: 3,
            child: Container(
              height: MediaQuery.of(context).size.width * HUNDRETH_SCALER * 20,
              decoration: BoxDecoration(
                color: Color(0xFFC7CAD0),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
              ),
            ),
          ),
          // Hypertext that will allow the user to add their favorite song
          Expanded(
            flex: 6,
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: SizedBox(),
                ),
                Expanded(
                  flex: 6,
                  child: RichText(
                    text: TextSpan(
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height *
                              SMALL_TXT_SCALER,
                          color: Colors.black,
                          fontFamily: 'OpenSans'),
                      children: <TextSpan>[
                        TextSpan(
                            text: 'Add Your \nFavorite Song',
                            style: TextStyle(
                                color: Color(0xFF6AABEF),
                                fontSize: MediaQuery.of(context).size.height *
                                    SMALL_TXT_SCALER,
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
              ],
            ),
          ),
          // Heart icon that user can click to like a song
          Expanded(
            flex: 2,
            child: new Tab(
              icon: new Image.asset("assets/images/icons/heartIcon.png"),
            ),
          ),
        ],
      ),
    );
  }
}

class SkipStepText extends StatelessWidget {
  const SkipStepText({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
        text: TextSpan(
          style: TextStyle(
              fontSize: MediaQuery.of(context).size.height * TINY_TXT_SCALER,
              color: Colors.black,
              fontFamily: 'OpenSans'),
          children: <TextSpan>[
            TextSpan(
                text: 'Skip this step',
                style: TextStyle(
                    color: Color(0xFF6AABEF),
                    fontSize:
                        MediaQuery.of(context).size.height * TINY_TXT_SCALER,
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
    );
  }
}
