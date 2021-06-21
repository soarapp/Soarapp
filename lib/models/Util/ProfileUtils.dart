import 'package:flutter/material.dart';
import 'package:soar_initial_screens/models/Util/SongUtils.dart';

class Profile {
  Profile(
    String name,
    Image avatar,
    Song favoriteSong,
    String description,
    String instagram,
    String facebook,
    String phoneNumber,
  ) {
    this.name = name;
    this.avatar = avatar;
    this.favoriteSong = favoriteSong;
    this.description = description;
    this.instagram = instagram;
    this.facebook = facebook;
    this.phoneNumber = phoneNumber;
  }

  String name;
  Image avatar;
  Song favoriteSong;
  String description;
  String instagram;
  String facebook;
  String phoneNumber;
}
