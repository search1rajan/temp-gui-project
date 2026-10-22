// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Youtubevideo extends StatefulWidget {
  const Youtubevideo({super.key});

  @override
  State<Youtubevideo> createState() => _Youtubevideo();
}

class _Youtubevideo extends State<Youtubevideo> {
  late YoutubePlayerController videoController;

  @override
  void initState() {
    super.initState();

    videoController = YoutubePlayerController.fromVideoId(
      videoId: 'fc8Mab9zGkg',
      autoPlay: false,
      params: const YoutubePlayerParams(
        showControls: true,
        showFullscreenButton: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Video Screen")),

      body: Center(
        child: YoutubePlayer(controller: videoController, aspectRatio: 16 / 9),
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
