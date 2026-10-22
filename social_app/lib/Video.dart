// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart' as video_player;

class VideoPlayer extends StatefulWidget {
  const VideoPlayer({super.key});

  @override
  State<VideoPlayer> createState() => _VideoPlayer();
}

class _VideoPlayer extends State<VideoPlayer> {
  late video_player.VideoPlayerController videoController;

  @override
  void initState() {
    super.initState();

    videoController =
        video_player.VideoPlayerController.networkUrl(
            Uri.parse(
              'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
            ),
          )
          ..initialize().then((_) {
            setState(() {});
          });
  }

  @override
  void dispose() {
    videoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Video Screen")),
      body: Center(
        child: videoController.value.isInitialized
            ? AspectRatio(
                aspectRatio: videoController.value.aspectRatio,
                child: video_player.VideoPlayer(videoController),
              )
            : const CircularProgressIndicator(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            videoController.value.isPlaying
                ? videoController.pause()
                : videoController.play();
          });
        },
        child: Icon(
          videoController.value.isPlaying ? Icons.pause : Icons.play_arrow,
        ),
      ),
    );
  }
}
