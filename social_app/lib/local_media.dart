import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class LocalMedia extends StatefulWidget {
  const LocalMedia({super.key});

  @override
  State<LocalMedia> createState() => _LocalMedia();
}

class _LocalMedia extends State<LocalMedia> {
  late VideoPlayerController videoPlayerController;

  @override
  void initState() {
    super.initState();

    videoPlayerController = VideoPlayerController.asset(
      "assets/videos/mahadev.mp4",
    );

    videoPlayerController.initialize().then((_) {
      setState(() {});
      videoPlayerController.play();
    });
  }

  @override
  void dispose() {
    videoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Local Video")),
      body: Center(
        child: videoPlayerController.value.isInitialized
            ? AspectRatio(
                aspectRatio: videoPlayerController.value.aspectRatio,
                child: VideoPlayer(videoPlayerController),
              )
            : CircularProgressIndicator(),
      ),
    );
  }
}
