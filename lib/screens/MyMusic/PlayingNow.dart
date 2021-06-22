import 'package:flutter/material.dart';
import 'package:soar_initial_screens/models/Util/SongUtils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:soar_initial_screens/CommonWidgets.dart';

class PlayingNowScreen extends StatefulWidget {
  PlayingNowScreen({Key key}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  static const String id = 'playingNow';
  final Song currentSong = new Song(
    'Take Care',
    'Beach House',
    Image(image: AssetImage('assets/images/songs/takeCare.png')),
    180,
  );

  @override
  _PlayingNowScreenState createState() => _PlayingNowScreenState();
}

class _PlayingNowScreenState extends State<PlayingNowScreen>
    with SingleTickerProviderStateMixin {
  Widget build(BuildContext context) {
    return Background(
        AssetImage('assets/images/backgrounds/playingNowBackground.png'),
        PlayingNow(widget.currentSong));
  }
}

class PlayingNow extends StatelessWidget {
  PlayingNow(this.currentSong);

  final Song currentSong;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Header
        Row(
          children: [
            InkWell(
              onTap: () {
                Navigator.of(context, rootNavigator: true).pop(context);
              },
              child: Icon(Icons.arrow_back_ios),
            ),
            Expanded(
                child: Text(
              "Playing Now",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            )),
            Icon(Icons.more_horiz),
          ],
        ),
        // Padding
        Expanded(child: SizedBox()),
        // Song Image
        Padding(
          padding: const EdgeInsets.only(bottom: 15),
          child: currentSong.cover,
        ),
        // Song Title
        Text(
          currentSong.title,
          style: TextStyle(fontSize: 25),
        ),
        // Artist
        Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Text(
            currentSong.artist,
            style: TextStyle(fontSize: 15),
          ),
        ),
        // Track Control Widget
        TrackControls(currentSong),
        // Padding
        Expanded(child: SizedBox()),
      ],
    );
  }
}

class TrackControls extends StatefulWidget {
  TrackControls(this.song);

  final Song song;

  _TrackControlsState createState() => _TrackControlsState();
}

class _TrackControlsState extends State<TrackControls> {
  double playbackTime = 0;

  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: Color(0x880E192E),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            // Playback Slider
            Padding(
              padding: const EdgeInsets.only(
                top: 12,
                bottom: 7,
                left: 5,
                right: 5,
              ),
              child: SliderTheme(
                child: Slider(
                  value: playbackTime,
                  min: 0,
                  max: widget.song.length,
                  divisions: widget.song.length.toInt(),
                  onChanged: (double value) {
                    setState(() {
                      playbackTime = value;
                    });
                  },
                  activeColor: Colors.white,
                  inactiveColor: Color(0x88D6D6D6),
                ),
                data: SliderThemeData(
                  trackHeight: 0.5,
                  thumbShape: RoundSliderThumbShape(enabledThumbRadius: 5),
                  overlayShape: RoundSliderOverlayShape(overlayRadius: 12),
                ),
              ),
            ),
            // Control Buttons
            Row(
              children: [
                Expanded(child: SizedBox()),
                Icon(
                  Icons.skip_previous_outlined,
                  color: Colors.white,
                  size: 40,
                ),
                Expanded(child: SizedBox()),
                Icon(
                  Icons.pause_outlined,
                  color: Colors.white,
                  size: 40,
                ),
                Expanded(child: SizedBox()),
                Icon(
                  Icons.skip_next_outlined,
                  color: Colors.white,
                  size: 40,
                ),
                Expanded(child: SizedBox()),
              ],
            )
          ],
        ),
      ),
    );
  }
}
