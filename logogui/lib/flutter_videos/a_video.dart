import 'package:flutter/material.dart';

import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Avideo extends StatefulWidget {
  const Avideo({super.key});

  @override
  State<Avideo> createState() => _Avideo();
}

class _Avideo extends State<Avideo> {
  late YoutubePlayerController videoController;

  @override
  void initState() {
    super.initState();

    videoController = YoutubePlayerController.fromVideoId(
      videoId: 'PKDWinlLfAo',
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
          "Fluttr Architecture",
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
                      'Flutter Architecture is the structure that defines how Flutter applications are built and how different components work together. It includes widgets, the Flutter framework, the rendering engine, and the Dart programming language. Flutter uses a widget-based architecture where the user interface is created using different widgets. This architecture helps developers build responsive, fast, and beautiful applications for Android, iOS, Web, and Desktop using a single codebase.',
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
