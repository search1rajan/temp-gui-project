import 'package:flutter/material.dart';

import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class FVideo extends StatefulWidget {
  const FVideo({super.key});

  @override
  State<FVideo> createState() => _FVideo();
}

class _FVideo extends State<FVideo> {
  late YoutubePlayerController videoController;

  @override
  void initState() {
    super.initState();

    videoController = YoutubePlayerController.fromVideoId(
      videoId: 'tB1sjfijupU',
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
          "Create an Android Virtual Device for Flutter Application",
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
                      'In this video, you will learn how to create an Android Virtual Device (AVD) for running Flutter applications. The process includes opening Android Studio, accessing the Device Manager, creating a new virtual device, selecting a suitable Android phone model, choosing and downloading the required Android system image, and completing the AVD setup. After creating the virtual device, you will learn how to start the emulator and use it to run and test Flutter applications.',
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
