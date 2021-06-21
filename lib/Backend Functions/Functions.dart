import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:soar_initial_screens/screens/Registration/LinkSpScreen.dart';
import 'package:soar_initial_screens/screens/Registration/SignInScreen.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_core/firebase_core.dart' as firebase_core;

String profilePicture = "profilePicture";
// need to reauthenticate users before doing any operation such as
// changing password, email, deleting acc etc.
void reauthenticateUser(String _email, String _password) async {
  EmailAuthCredential credential =
      EmailAuthProvider.credential(email: _email, password: _password);

// Reauthenticate
  await FirebaseAuth.instance.currentUser
      .reauthenticateWithCredential(credential);
}

// delete user

Future<void> deleteUser(_email, _password) async {
  reauthenticateUser(_email, _password);
  try {
    await FirebaseAuth.instance.currentUser.delete();
  } on FirebaseAuthException catch (e) {
    if (e.code == 'requires-recent-login') {
      print(
          'The user must reauthenticate before this operation can be executed.');
    }
  }
}

// reset Password
Future<void> resetPassword(String email) async {
  await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
}

// reset Email
Future<void> resetEmail(
    String _oldEmail, String _password, String newEmail) async {
  // need to reauthenticate user first prior to changing email
  reauthenticateUser(_oldEmail, _password);
// Then use the newly re-authenticated user
  var user = FirebaseAuth.instance.currentUser;

  user.updateEmail(newEmail);
}

// update data

// Ex: if you want to update Genre, type in Genre as the _data parameter and
// genre the user types as _dataValue parameter
void updateData(String _data, String _dataValue) {
  final String _uid = FirebaseAuth.instance.currentUser.uid;
  final CollectionReference db = FirebaseFirestore.instance.collection('users');
  db
      // choose the document you want to update
      .doc(_uid)
      // choose the data you want to update
      .update({_data: _dataValue})
      .then((value) => print("Updated Successfully"))
      .catchError((error) => print(error));
}

// Add data to database

void addData(String _name, String _bio, String _favSong, String _socialMedia) {
  // obtain the uid of the user
  final String _uid = FirebaseAuth.instance.currentUser.uid;
  final CollectionReference db = FirebaseFirestore.instance.collection('users');
  db
      // choose the document you want to add to
      .doc(_uid)
      // add whatever fields you want
      .set({
        "Name": _name,
        "Bio": _bio,
        "Favorite Song": _favSong,
        "Social Media": _socialMedia
      })
      .then((value) => print("Added Successfully"))
      .catchError((error) => print(error));
}

// confirm acc

confirmEmail(String _email, String _password) async {
  UserCredential user = await FirebaseAuth.instance
      .signInWithEmailAndPassword(email: _email, password: _password);

  // get the current user instance
  User userr = FirebaseAuth.instance.currentUser;
  await userr.sendEmailVerification();
}

// create acc

createAcc(String _email, String _password) async {
  // create the account
  try {
    UserCredential userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: _email, password: _password);
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      print('The password provided is too weak.');
    } else if (e.code == 'email-already-in-use') {
      print('The account already exists for that email.');
    }
  } catch (e) {
    print(e);
  }
}

// Sign in

void signIn(String _email, String _password, BuildContext context) async {
  // verify credentials
  try {
    UserCredential user = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: _email, password: _password);
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      print('user not found');
    } else if (e.code == 'wrong-password') {
      print('Wrong password provided for that user.');
    }
  }
  // push to the next screen
  FirebaseAuth.instance.authStateChanges().listen((User user) {
    if (user != null && user.emailVerified) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) {
            return LinkSpotifyScreen();
          },
        ),
      );
      ;
    } else {}
  });
}

// sample popup
void _showDialog(BuildContext context) {
  String _email;
  String _password;
  // flutter defined function
  showDialog(
    context: context,
    builder: (BuildContext context) {
      // return object of type Dialog
      return AlertDialog(
        title: new Text("Error"),
        content: new Text("Please verify your email!"),
        actions: <Widget>[
          // usually buttons at the bottom of the dialog
          new FlatButton(
            child: new Text("Close"),
            onPressed: () {
              confirmEmail(_email, _password);
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

// add Image to cloud
// Enter the file path and image name as parameters and it will add it
// within the user's directory set up by their uid
Future<void> uploadFile(String filePath, String imageName) async {
  final String uid = FirebaseAuth.instance.currentUser.uid;
  File file = File(filePath);

  print('File Uploaded');
  try {
    await firebase_storage.FirebaseStorage.instance
        .ref(uid + '/' + imageName + '.png')
        .putFile(file);
  } on firebase_core.FirebaseException catch (e) {
    print(e);
  }
}

// get the URL of image from cloud

downloadURL(String imageName) async {
  final String uid = FirebaseAuth.instance.currentUser.uid;
  String downloadURL = await firebase_storage.FirebaseStorage.instance
      .ref(uid + '/' + imageName + '.png')
      .getDownloadURL();

  return downloadURL;
  // Within your widgets:
  // Image.network(downloadURL);
}

Future<void> listExample() async {
  firebase_storage.ListResult result =
      await firebase_storage.FirebaseStorage.instance.ref().listAll();

  result.items.forEach((firebase_storage.Reference ref) {
    print('Found file: $ref');
  });

  result.prefixes.forEach((firebase_storage.Reference ref) {
    print('Found directory: $ref');
  });
}
