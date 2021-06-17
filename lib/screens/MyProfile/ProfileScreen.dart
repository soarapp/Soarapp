import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:soar_initial_screens/models/Util/ProfileUtils.dart';
import 'package:soar_initial_screens/models/Util/SongUtils.dart';
import 'package:soar_initial_screens/CommonWidgetsAndMethods.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfileScreen extends StatefulWidget {
  static const String id = 'playlists';
  static const String description =
      'I’m from Milwaukee, WI, and I love art and design. I am also a freshman at Washington University in St. Louis.';

  final Profile profile = new Profile(
    'Audrey Engman',
    Image.asset(
      'assets/images/other/profileAvatar.png',
      height: 10,
      width: 10,
      fit: BoxFit.fitWidth,
    ),
    new Song(
      'For the Team',
      'Prelowe',
      Image.asset('assets/images/songs/favSong.jpg'),
      0,
    ),
    description,
    '@audreyengman',
    'Audrey Engman',
    '123-456-7890',
  );

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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
                alignment: Alignment(0, 0),
                image: AssetImage(
                    'assets/images/backgrounds/profileBackground.png'),
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
                flex: 4,
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(40.0),
                      topLeft: Radius.circular(40.0),
                    ),
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      // top edit and more icons
                      Padding(
                        padding: const EdgeInsets.only(top: 20, bottom: 10),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 30.0),
                              child: Icon(
                                Icons.edit_outlined,
                                size: 30.0,
                                semanticLabel: 'Back',
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: SizedBox(),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 30.0),
                              child: Icon(
                                Icons.more_horiz,
                                size: 30.0,
                                semanticLabel: 'Add Playlist',
                              ),
                            ),
                          ],
                        ),
                      ),
                      // profile picture
                      Expanded(
                        flex: 3,
                        child: CircleAvatar(
                          radius: 100,
                          backgroundImage: widget.profile.avatar.image,
                        ),
                      ),
                      // name

                      Text(
                        widget.profile.name,
                        style: TextStyle(fontSize: 30),
                      ),
                      Expanded(
                        flex: 1,
                        child: SizedBox(),
                      ),
                      // description and contact info
                      Expanded(
                        flex: 5,
                        child: ProfileDescription(
                          favoriteSong: widget.profile.favoriteSong,
                          description: widget.profile.description,
                          instagram: widget.profile.instagram,
                          facebook: widget.profile.facebook,
                          phoneNumber: widget.profile.phoneNumber,
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: SizedBox(),
                      ),
                      //bottom icon bar
                      Expanded(
                        flex: 1,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                          ),
                          child: bottomIconBar(context, 5),
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

class ProfileDescription extends StatelessWidget {
  const ProfileDescription({
    @required this.favoriteSong,
    @required this.description,
    @required this.instagram,
    @required this.facebook,
    @required this.phoneNumber,
  });

  final Song favoriteSong;
  final String description;
  final String instagram;
  final String facebook;
  final String phoneNumber;

  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Color(0xF7F7F7FF),
              borderRadius: BorderRadius.all(Radius.circular(10)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                )
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  // favoriteSong Widget
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Color(0xE1E4EBFF),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              child: Image(
                                image: favoriteSong.cover.image,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Column(
                            children: [
                              Container(
                                  alignment: Alignment.topLeft,
                                  child: Text(favoriteSong.title,
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ))),
                              Container(
                                  alignment: Alignment.bottomLeft,
                                  child: Text(favoriteSong.artist)),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Icon(Icons.favorite_border),
                        ),
                      ],
                    ),
                  ),
                  // description and contact
                  Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 12),
                          child: Text(description),
                        ),
                      ),
                      // Spacer
                      Padding(padding: EdgeInsets.all(15), child: SizedBox()),
                      // contact information
                      Expanded(
                        flex: 3,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 10, bottom: 10, right: 8),
                                  child: FaIcon(FontAwesomeIcons.instagram),
                                ),
                                Text(instagram),
                              ],
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 10, bottom: 10, right: 8),
                                  child: FaIcon(FontAwesomeIcons.facebookF),
                                ),
                                Text(facebook),
                              ],
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 10, bottom: 10, right: 8),
                                  child: Icon(Icons.chat_bubble_outline),
                                ),
                                Text(phoneNumber),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(child: SizedBox()),
        ],
      ),
    );
  }
}
