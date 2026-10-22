import 'package:flutter/material.dart';

import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class EVideo extends StatefulWidget {
  const EVideo({super.key});

  @override
  State<EVideo> createState() => _EVideo();
}

class _EVideo extends State<EVideo> {
  late YoutubePlayerController videoController;

  @override
  void initState() {
    super.initState();

    videoController = YoutubePlayerController.fromVideoId(
      videoId: 'B3MoTP3veBk',
      autoPlay: true,
      params: const YoutubePlayerParams(
        showControls: true,
        showFullscreenButton: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        centerTitle: true,
        title: Text(
          "How to Create New Project in Flutter",
          style: TextStyle(color: Colors.red, fontSize: 35),
        ),
      ),

      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              YoutubePlayer(controller: videoController, aspectRatio: 16 / 9),

              SizedBox(height: 20),

              Container(
                padding: EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Video Description :-',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: 10),

                    Text(
                      'In this video, you will learn how to run an Android application on an emulator. The process includes starting the Android Virtual Device, opening the Flutter project in Visual Studio Code, selecting the connected emulator, and running the Flutter application. You will also learn how the app launches on the emulator and how to test its features without using a physical Android device.',
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            videoController.value.playerState == PlayerState.playing
                ? videoController.pauseVideo()
                : videoController.playVideo();
          });
        },

        child: Icon(
          videoController.value.playerState == PlayerState.playing
              ? Icons.pause
              : Icons.play_arrow,
        ),
      ),
    );
  }

  @override
  void dispose() {
    videoController.close();
    super.dispose();
  }
}
