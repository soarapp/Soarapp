// import 'package:flutter/material.dart';
//
// import 'dart:async';
//
// import 'package:flutter/services.dart';
// import 'package:flutter_dotenv/flutter_dotenv.dart';
// import 'package:logger/logger.dart';
// import 'package:spotify_sdk/models/crossfade_state.dart';
// import 'package:spotify_sdk/spotify_sdk.dart';
// import 'package:soar/screens/MyMusic/playlist.dart';
// import 'package:soar/screens/MyProfile/ResourcesPage.dart';
//
// import 'package:crypto/crypto.dart';
// import 'dart:convert'; // for the utf8.encode method
//
// import 'package:url_launcher/url_launcher.dart';
//
// class SpotifyLoginScreen extends StatefulWidget {
//   static const String id = 'spotifylogin';
//   final Widget redirectScreen;
//
//   SpotifyLoginScreen({this.redirectScreen});
//   @override
//   SpotifyUtils createState() => SpotifyUtils();
// }
//
// class SpotifyUtils extends State<SpotifyLoginScreen> {
//   bool _loading = false;
//   bool _connected = false;
//   final Logger _logger = Logger();
//
//   CrossfadeState crossfadeState;
//
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: "Flutter Demo",
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text("Spotify Tester"),
//         ),
//         body: Center(
//           child: Column(
//             children: [
//               ElevatedButton(
//                 child: Text("Login with Spotify"),
//                 onPressed: () async => {
//                   getAuthenticationToken(),
//                   await connectToSpotifyRemote(),
//                 },
//               ),
//               ElevatedButton(
//                 child: Text("Logout from Spotify"),
//                 onPressed: disconnect,
//               ),
//               ElevatedButton(
//                 child: Text("Go to Home Page"),
//                 onPressed: () => {
//                   Navigator.of(context).push(
//                     MaterialPageRoute(
//                       builder: (context) {
//                         return ResourcesScreen();
//                       },
//                     ),
//                   )
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Future<void> disconnect() async {
//     try {
//       setState(() {
//         _loading = true;
//       });
//       var result = await SpotifySdk.disconnect();
//       setStatus(result ? 'disconnect successful' : 'disconnect failed');
//       setState(() {
//         _loading = false;
//       });
//     } on PlatformException catch (e) {
//       setState(() {
//         _loading = false;
//       });
//       setStatus(e.code, message: e.message);
//     } on MissingPluginException {
//       setState(() {
//         _loading = false;
//       });
//       setStatus('not implemented');
//     }
//   }
//
//   Future<void> connectToSpotifyRemote() async {
//     try {
//       setState(() {
//         _loading = true;
//       });
//       var result = await SpotifySdk.connectToSpotifyRemote(
//           clientId: env['CLIENT_ID'].toString(),
//           redirectUrl: env['REDIRECT_URI'].toString());
//       setStatus(result
//           ? 'connect to spotify successful'
//           : 'connect to spotify failed');
//       setState(() {
//         _loading = false;
//       });
//     } on PlatformException catch (e) {
//       setState(() {
//         _loading = false;
//       });
//       setStatus(e.code, message: e.message);
//     } on MissingPluginException {
//       setState(() {
//         _loading = false;
//       });
//       setStatus('not implemented');
//     }
//   }
//
//   String generateCodeChallenge() {
//     var bytes = utf8.encode(
//         'ABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZ'); // data being hashed
//
//     var digest = sha256.convert(bytes).toString();
//     var stringToBase64Url = utf8.fuse(base64Url);
//     var codeVerifier = stringToBase64Url.encode(digest);
//     return codeVerifier;
//   }
//
//   Future<String> getAuthenticationToken() async {
//     /*
//     try {
//       var authenticationToken = await SpotifySdk.getAuthenticationToken(
//           clientId: env['CLIENT_ID'].toString(),
//           redirectUrl: env['REDIRECT_URI'].toString(),
//           scope: 'app-remote-control, '
//               'user-modify-playback-state, '
//               'playlist-read-private, '
//               'playlist-modify-public,user-read-currently-playing');
//       setStatus('Got a token: $authenticationToken');
//       Navigator.of(context).push(
//         MaterialPageRoute(
//           builder: (context) {
//             return widget.redirectScreen;
//           },
//         ),
//       );
//       return authenticationToken;
//     } on PlatformException catch (e) {
//       setStatus(e.code, message: e.message);
//       return Future.error('$e.code: $e.message');
//     } on MissingPluginException {
//       setStatus('not implemented');
//       return Future.error('not implemented');
//     }
//     */
//     Uri url = Uri.https(
//       "accounts.spotify.com",
//       "authorize",
//       {
//         'client_id': env['CLIENT_ID'].toString(),
//         'response_type': 'code',
//         'redirect_uri': env['REDIRECT_URI'].toString(),
//         'code_challenge_method': 'S256',
//         'code_challenge': generateCodeChallenge(),
//       },
//     );
//
//     await launch(url.toString());
//     Navigator.of(context).push(
//       MaterialPageRoute(
//         builder: (context) {
//           return widget.redirectScreen;
//         },
//       ),
//     );
//   }
//
//   Future getPlayerState() async {
//     try {
//       return await SpotifySdk.getPlayerState();
//     } on PlatformException catch (e) {
//       setStatus(e.code, message: e.message);
//     } on MissingPluginException {
//       setStatus('not implemented');
//     }
//   }
//
//   Future getCrossfadeState() async {
//     try {
//       var crossfadeStateValue = await SpotifySdk.getCrossFadeState();
//       setState(() {
//         crossfadeState = crossfadeStateValue;
//       });
//     } on PlatformException catch (e) {
//       setStatus(e.code, message: e.message);
//     } on MissingPluginException {
//       setStatus('not implemented');
//     }
//   }
//
//   Future<void> queue() async {
//     try {
//       await SpotifySdk.queue(
//           spotifyUri: 'spotify:track:58kNJana4w5BIjlZE2wq5m');
//     } on PlatformException catch (e) {
//       setStatus(e.code, message: e.message);
//     } on MissingPluginException {
//       setStatus('not implemented');
//     }
//   }
//
//   Future<void> toggleRepeat() async {
//     try {
//       await SpotifySdk.toggleRepeat();
//     } on PlatformException catch (e) {
//       setStatus(e.code, message: e.message);
//     } on MissingPluginException {
//       setStatus('not implemented');
//     }
//   }
//
//   Future<void> setRepeatMode(RepeatMode repeatMode) async {
//     try {
//       await SpotifySdk.setRepeatMode(
//         repeatMode: repeatMode,
//       );
//     } on PlatformException catch (e) {
//       setStatus(e.code, message: e.message);
//     } on MissingPluginException {
//       setStatus('not implemented');
//     }
//   }
//
//   Future<void> setShuffle({bool shuffle}) async {
//     try {
//       await SpotifySdk.setShuffle(
//         shuffle: shuffle,
//       );
//     } on PlatformException catch (e) {
//       setStatus(e.code, message: e.message);
//     } on MissingPluginException {
//       setStatus('not implemented');
//     }
//   }
//
//   Future<void> toggleShuffle() async {
//     try {
//       await SpotifySdk.toggleShuffle();
//     } on PlatformException catch (e) {
//       setStatus(e.code, message: e.message);
//     } on MissingPluginException {
//       setStatus('not implemented');
//     }
//   }
//
//   Future<void> play() async {
//     try {
//       await SpotifySdk.play(spotifyUri: 'spotify:track:58kNJana4w5BIjlZE2wq5m');
//     } on PlatformException catch (e) {
//       setStatus(e.code, message: e.message);
//     } on MissingPluginException {
//       setStatus('not implemented');
//     }
//   }
//
//   Future<void> pause() async {
//     try {
//       await SpotifySdk.pause();
//     } on PlatformException catch (e) {
//       setStatus(e.code, message: e.message);
//     } on MissingPluginException {
//       setStatus('not implemented');
//     }
//   }
//
//   Future<void> resume() async {
//     try {
//       await SpotifySdk.resume();
//     } on PlatformException catch (e) {
//       setStatus(e.code, message: e.message);
//     } on MissingPluginException {
//       setStatus('not implemented');
//     }
//   }
//
//   Future<void> skipNext() async {
//     try {
//       await SpotifySdk.skipNext();
//     } on PlatformException catch (e) {
//       setStatus(e.code, message: e.message);
//     } on MissingPluginException {
//       setStatus('not implemented');
//     }
//   }
//
//   Future<void> skipPrevious() async {
//     try {
//       await SpotifySdk.skipPrevious();
//     } on PlatformException catch (e) {
//       setStatus(e.code, message: e.message);
//     } on MissingPluginException {
//       setStatus('not implemented');
//     }
//   }
//
//   Future<void> seekTo() async {
//     try {
//       await SpotifySdk.seekTo(positionedMilliseconds: 20000);
//     } on PlatformException catch (e) {
//       setStatus(e.code, message: e.message);
//     } on MissingPluginException {
//       setStatus('not implemented');
//     }
//   }
//
//   Future<void> seekToRelative() async {
//     try {
//       await SpotifySdk.seekToRelativePosition(relativeMilliseconds: 20000);
//     } on PlatformException catch (e) {
//       setStatus(e.code, message: e.message);
//     } on MissingPluginException {
//       setStatus('not implemented');
//     }
//   }
//
//   Future<void> addToLibrary() async {
//     try {
//       await SpotifySdk.addToLibrary(
//           spotifyUri: 'spotify:track:58kNJana4w5BIjlZE2wq5m');
//     } on PlatformException catch (e) {
//       setStatus(e.code, message: e.message);
//     } on MissingPluginException {
//       setStatus('not implemented');
//     }
//   }
//
//   void setStatus(String code, {String message = ''}) {
//     var text = message.isEmpty ? '' : ' : $message';
//     _logger.d('$code$text');
//   }
// }
