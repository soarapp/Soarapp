import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:soar_initial_screens/ForgotPassScreen.dart';
import 'package:soar_initial_screens/LinkSpScreen.dart';
import 'package:soar_initial_screens/SignInScreen.dart';
import 'package:soar_initial_screens/themeData/ColorUtils.dart';
import 'CommonWidgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// This screen allows the user to customize their profile

class MakeProfileScreen extends StatefulWidget {
  static const String id = 'makeProfile';

  @override
  _MakeProfileScreenState createState() => _MakeProfileScreenState();
}

class _MakeProfileScreenState extends State<MakeProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(MediaQuery.of(context).size.width,
          MediaQuery.of(context).size.height),
      builder: () => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          // SingleChildScrollView widget allows the user to scroll through the screen
          body: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minWidth: MediaQuery.of(context).size.width,
                minHeight: MediaQuery.of(context).size.height,
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
                        image: AssetImage('assets/images/Group1.png'),
                        fit: BoxFit.fill),
                  ),
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    children: [
                      // the top part of the screen where you can see the background
                      Expanded(
                        flex: 1,
                        child: SizedBox(),
                      ),
                      // the top part of the screen with the 'Create Your Profile' text
                      Expanded(
                        flex: 2,
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: SizedBox(),
                            ),
                            Expanded(
                              flex: 6,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "Create",
                                        style: TextStyle(
                                            fontSize: 38.sp,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'OpenSans'),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "Your Profile",
                                        style: TextStyle(
                                            fontSize: 38.sp,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'OpenSans'),
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
                      // the bottom portion of the screen with the white card and all
                      // of the components within the white card
                      Expanded(
                        flex: 13,
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

class CreateProfileCardState extends State<CreateProfileCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(40.0), topLeft: Radius.circular(40.0)),
        color: Colors.white,
      ),
      // column within the white card
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // space right above the photo upload portion of the screen
          Expanded(
            flex: 1,
            child: SizedBox(),
          ),
          // circular widget with camera icon where users can see their
          // current user profile picture and upload a new picture
          Expanded(
            flex: 3,
            child: Column(
              children: [
                Expanded(
                  flex: 1,
                  child: Image.asset(
                    'assets/images/defaultCamPhoto.png',
                    width: 80.w,
                    height: 80.h,
                  ),
                ),
                // space between camera icon logo and the 'Add Photo' text
                SizedBox(
                  height: 10.h,
                ),
                // The 'Add Photo' text
                Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: SizedBox(),
                    ),
                    Expanded(
                      flex: 3,
                      child: AddPhotoText(),
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
          // the part of the screen where users can enter their name in a text input
          Expanded(
            flex: 3,
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
                            fontSize: 14.sp, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: SizedBox(),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: SizedBox(),
                    ),
                    Expanded(
                      flex: 10,
                      // the text field where users can enter their name
                      child: NameTextField(),
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
            flex: 6,
            // the part of the screen where the large card will be placed
            child: UserInfoCard(),
          ),
          Expanded(
            flex: 1,
            child: SizedBox(),
          ),
          // the create account button and skip this step text
          Expanded(
            flex: 2,
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
                      child: Column(
                        children: [
                          Container(
                            height: 50.h,
                            // the actual button
                            child: CreateAcctButton(),
                          ),
                          SizedBox(
                            height: 7.h,
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 3,
                                child: SizedBox(),
                              ),
                              // skip this step hypertext
                              Expanded(
                                flex: 4,
                                child: SkipStepText(),
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
                      child: SizedBox(),
                      flex: 1,
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
              ],
            ),
          ),
          // the progress bar portion of the screen
          Expanded(
            flex: 1,
            child: CircularProgressBar(),
          ),
          Expanded(
            flex: 1,
            child: SizedBox(),
          ),
        ],
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
      height: 50.h,
      child: Padding(
        padding: EdgeInsets.fromLTRB(8, 14, 0, 0),
        child: TextField(
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(
              bottom: 50.h / 2,
            ),
            border: InputBorder.none,
            hintStyle: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 34.sp),
          ),
        ),
      ),
    );
  }
}

class AddPhotoText extends StatelessWidget {
  const AddPhotoText({
    Key key,
  }) : super(key: key);

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
                height: 250.h,
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
                            height: 5.h,
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
                          SizedBox(height: 5.h),
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
          height: 5.h,
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
        SizedBox(height: 5.h),
        Row(
          children: [
            Expanded(
              flex: 1,
              child: SizedBox(),
            ),
            Expanded(
              flex: 15,
              child: Container(
                height: 70.h,
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
          height: 5.h,
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
        SizedBox(height: 5.h),
        Row(
          children: [
            Expanded(
              flex: 1,
              child: SizedBox(),
            ),
            Expanded(
              flex: 15,
              child: Container(
                height: 70.h,
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
      height: 95.h,
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
          Expanded(
            flex: 1,
            child: SizedBox(),
          ),
          // grey box within the grey rectangle
          Expanded(
            flex: 2,
            child: Container(
              height: 60.h,
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
                          fontSize: 9,
                          color: Colors.black,
                          fontFamily: 'OpenSans'),
                      children: <TextSpan>[
                        TextSpan(
                            text: 'Add Your Favorite Song',
                            style: TextStyle(
                                color: Color(0xFF6AABEF),
                                fontSize: 12.sp,
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
              icon: new Image.asset("assets/images/heartIcon.png"),
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
    return RichText(
      text: TextSpan(
        style: TextStyle(
            fontSize: 12.sp, color: Colors.black, fontFamily: 'OpenSans'),
        children: <TextSpan>[
          TextSpan(
              text: 'Skip this step',
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
    );
  }
}

class CreateAcctButton extends StatelessWidget {
  const CreateAcctButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return LinkSpotifyScreen();
            },
          ),
        );
      },
      child: Text("CREATE ACCOUNT",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.white,
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              fontFamily: 'OpenSans')),
      style: ElevatedButton.styleFrom(primary: Color(0xFF6AABEF)),
    );
  }
}

class CircularProgressBar extends StatelessWidget {
  const CircularProgressBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ProgressBarButton(
          colorData: Color(0xFFCDCDCD),
          width: 10.w,
          height: 10.h,
        ),
        SizedBox(
          width: 5.w,
        ),
        ProgressBarButton(
          colorData: Color(0xFFCDCDCD),
          width: 10.w,
          height: 10.h,
        ),
        SizedBox(
          width: 5.w,
        ),
        ProgressBarButton(
          colorData: Color(0xFF6AABEF),
          width: 13.w,
          height: 13.h,
        ),
      ],
    );
  }
}
