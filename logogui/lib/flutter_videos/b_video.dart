import 'package:flutter/material.dart';

import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class BVideo extends StatefulWidget {
  const BVideo({super.key});

  @override
  State<BVideo> createState() => _BVideo();
}

class _BVideo extends State<BVideo> {
  late YoutubePlayerController videoController;

  @override
  void initState() {
    super.initState();

    videoController = YoutubePlayerController.fromVideoId(
      videoId: 'BqHOtlh3Dd4',
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
          "Fluttr Install in window",
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
                      'In this video, you will learn how to install Flutter on Windows. '
                      'The video explains the required setup, Flutter SDK installation, '
                      'environment variable configuration, and how to check whether Flutter '
                      'is installed correctly on your computer.',
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
