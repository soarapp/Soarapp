import 'package:flutter/material.dart';
//this is the homepage for the app: it contains the playlists which
// the user can play as well as profile settings
//TODO: Make the widget for the playlists a method which can be called to add a new playlist
//TODO: Connect my real spotify playlists to the page as a proof of concept
//TODO: Finish the UI design of app including play button bar in the bottom

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xFFFFFFFF),
        //Top bar with text and profile icon/button
        appBar: AppBar(
          title: Row(
            children: [
              Text(
                'Listen to Specially Curated Playlists',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontFamily: 'Comfortaa',
                ),
              ),
              RawMaterialButton(
                onPressed: null,
                shape: CircleBorder(),
                child: Image(
                  image: AssetImage('images/Profile.png'),
                ),
              ),
            ],
          ),
          backgroundColor: Colors.white,
        ),
        //box containing the playlists which the user can choose
        body: Column(
          children: [
            Center(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Color(0xFFF0F0F0),
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(16),
                      //playlist 1
                      child: RawMaterialButton(
                        onPressed: null,
                        child: Image(
                          image: AssetImage('images/Groups.jpg'),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(16),
                      //playlist 2
                      child: RawMaterialButton(
                          onPressed: null,
                          child: Image(
                              image: AssetImage('images/MadeForYou.jpg'))),
                    )
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
