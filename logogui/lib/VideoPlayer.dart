// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPlayerTest extends StatefulWidget {
  const VideoPlayerTest({super.key});

  @override
  State<VideoPlayerTest> createState() => _VideoPlayerTest();
}

class _VideoPlayerTest extends State<VideoPlayerTest> {
  late YoutubePlayerController videoController;
  late VideoPlayerController videoplayertest;

  @override
  void initState() {
    super.initState();

    videoplayertest =
        VideoPlayerController.networkUrl(
            Uri.parse('https://samplelib.com/mp4/sample-5s.mp4'),
          )
          ..initialize().then((_) {
            setState(() {});
          });

    // videoController = YoutubePlayerController.fromVideoId(
    //   videoId: 'fc8Mab9zGkg',
    //   autoPlay: false,
    //   params: const YoutubePlayerParams(
    //     showControls: true,
    //     showFullscreenButton: true,
    //   ),
    // );
  }


  @override
  void dispose() {
    videoplayertest.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Video Screen")),

      body: Center(
        // child: YoutubePlayer(controller: videoController, aspectRatio: 16 / 9),

        child: videoplayertest.value.isInitialized?
        Column(
          children: [
            AspectRatio(
          aspectRatio: videoplayertest.value.aspectRatio,
          child: VideoPlayer(videoplayertest),
        ) ,

        VideoProgressIndicator(videoplayertest, allowScrubbing: true , padding: const EdgeInsets.all(8),)

        ],
        ) : CircularProgressIndicator(), 
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            videoplayertest.value.isPlaying 
                ? videoplayertest.pause()
                : videoplayertest.play();
          });
        },
        child: Icon(
          videoplayertest.value.isPlaying 
              ? Icons.pause
              : Icons.play_arrow,
        ),
      ),
    );
  }

}
