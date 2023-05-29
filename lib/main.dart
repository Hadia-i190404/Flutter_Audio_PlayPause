import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:untitled/AudioPlayerService.dart';

import 'Systemcheck.dart';

void main() {
  runApp(StartApp());
}

class StartApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'Music Setting',

      home: MyApp(),
    );
  }
}
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isplaying = true;
  @override
  void initState() {
    // TODO: implement initState
    if (SystemCheck.musiccheck) {
      AudioPlayerService.audioPlayer.open(Playlist(audios: [
        Audio("assets/audio/bgmusic.mp3")
      ]),
          loopMode: LoopMode.playlist);
    }

    AudioPlayerService.audioPlayer.isPlaying.listen((bool playing) {
      setState(() {
        isplaying = playing;
      });
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        // margin: const EdgeInsets.only(right: 85),
        height: double.maxFinite,
        width: double.maxFinite,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/desert.jpg"),
              fit: BoxFit.cover),
        ),
        child: Padding(padding: EdgeInsets.fromLTRB(0, 30, 0, 0),

          child: FractionallySizedBox(
          widthFactor: 0.7,
          heightFactor: 0.2,
          alignment: Alignment.center,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.65),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child:
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
            Expanded(child:
            Row(
            mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Music",
                    style: TextStyle(
                      fontFamily: 'Acme',
                      fontWeight: FontWeight.bold,
                      fontSize: 45,
                      color: Colors.black,
                    )),
                // Padding(
                // padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                //child:
                IconButton(
                  icon: Icon(
                    isplaying ? Icons.music_note : Icons.music_off,
                    color: Colors.black,
                    size: 45,
                  ),
                  onPressed: () {
                    if (isplaying) {
                      AudioPlayerService.pause();
                      SystemCheck.setmusic(false);
                    } else {
                      AudioPlayerService.play();
                      SystemCheck.setmusic(true);
                    }
                    setState(() {
                      isplaying = !isplaying;
                    });
                  },
                ),
                //      ),
                // Add any additional settings here...
              ],
            ),
    ),

        ],
      ),
    ),
    ),
    ),
      ),
    );
  }
}



