import 'package:flutter/material.dart';

class Song {
  Song(String title, String artist, Image cover, double length) {
    this.title = title;
    this.artist = artist;
    this.cover = cover;
    this.length = length;
  }

  String title;
  String artist;
  Image cover;
  double length;
}

class SongWidget extends StatelessWidget {
  const SongWidget({
    @required this.title,
    @required this.artist,
    @required this.cover,
  });

  final String title;
  final String artist;
  final Image cover;

  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(),
        Padding(
          padding: const EdgeInsets.only(left: 40.0),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 15.0, bottom: 10.0),
                child: Image(
                  image: cover.image,
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(fontSize: 15),
                    ),
                    Text(
                      artist,
                      style: TextStyle(fontSize: 8),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
