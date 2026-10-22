import 'package:flutter/material.dart';
import 'package:logogui/flutter_videos/b_video.dart';
import 'package:logogui/flutter_videos/c_video.dart';
import 'package:logogui/flutter_videos/d_video.dart';
import 'package:logogui/flutter_videos/e_video.dart';
import 'package:logogui/flutter_videos/f_video.dart';
import 'package:logogui/flutter_videos/g_video.dart';
import 'package:logogui/flutter_videos/h_video.dart';
import 'package:logogui/flutter_videos/i_video.dart';
import 'package:logogui/flutter_videos/j_video.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:logogui/flutter_videos/a_video.dart';

class FlutterCourse extends StatefulWidget {
  const FlutterCourse({super.key});

  @override
  State<FlutterCourse> createState() => _FlutterCourse();
}

class _FlutterCourse extends State<FlutterCourse> {
  late YoutubePlayerController videoController;

  @override
  void initState() {
    super.initState();

    videoController = YoutubePlayerController.fromVideoId(
      videoId: 'jqxz7QvdWk8',
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
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
        title: Text(
          "About Fluttr and why",
          style: TextStyle(color: Colors.white, fontSize: 35),
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
                      'Flutter is an open-source UI framework developed by Google that allows developers to build beautiful and responsive applications for Android, iOS, Web, and Desktop using a single codebase. This video introduces Flutter and explains why it is popular among developers, highlighting its fast development, cross-platform support, rich widgets, and use of the Dart programming language.',
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                  ],
                ),
              ),

              Container(
                padding: EdgeInsets.all(10),
                child: GridView.count(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  childAspectRatio: 0.9,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Avideo()),
                        );
                      },

                      child: Card(
                        elevation: 5,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(height: 0),

                            Icon(Icons.video_file, size: 100),

                            SizedBox(height: 10),

                            Text(
                              'Flutter Architecture',
                              style: TextStyle(fontSize: 18),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => BVideo()),
                        );
                      },

                      child: Card(
                        elevation: 5,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(height: 0),

                            Icon(Icons.video_file, size: 100),

                            SizedBox(height: 10),

                            Text(
                              'Flutter install in Windows',
                              style: TextStyle(fontSize: 18),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => CVideo()),
                        );
                      },

                      child: Card(
                        elevation: 5,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(height: 0),

                            Icon(Icons.video_file, size: 100),

                            SizedBox(height: 10),

                            Text(
                              'Android Studio Setup in 15 minut',
                              style: TextStyle(fontSize: 18),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => DVideo()),
                        );
                      },

                      child: Card(
                        elevation: 5,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(height: 0),

                            Icon(Icons.video_file, size: 100),

                            SizedBox(height: 10),

                            Text(
                              'VS Code Installation',
                              style: TextStyle(fontSize: 18),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => EVideo()),
                        );
                      },

                      child: Card(
                        elevation: 5,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(height: 0),

                            Icon(Icons.video_file, size: 100),

                            SizedBox(height: 10),

                            Text(
                              'How to Create New Project in Flutter',
                              style: TextStyle(fontSize: 18),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => FVideo()),
                        );
                      },

                      child: Card(
                        elevation: 5,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(height: 0),

                            Icon(Icons.video_file, size: 100),

                            SizedBox(height: 10),

                            Text(
                              'Create an Android Virtual Device for Flutter Application',
                              style: TextStyle(fontSize: 18),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => GVideo()),
                        );
                      },

                      child: Card(
                        elevation: 5,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(height: 0),

                            Icon(Icons.video_file, size: 100),

                            SizedBox(height: 10),

                            Text(
                              'How to Run an Android App on an Emulator',
                              style: TextStyle(fontSize: 18),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HVideo()),
                        );
                      },

                      child: Card(
                        elevation: 5,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(height: 0),

                            Icon(Icons.video_file, size: 100),

                            SizedBox(height: 10),

                            Text(
                              'How to Run and Test Flutter App on a Real Android Device',
                              style: TextStyle(fontSize: 18),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => IVideo()),
                        );
                      },

                      child: Card(
                        elevation: 5,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(height: 0),

                            Icon(Icons.video_file, size: 100),

                            SizedBox(height: 10),

                            Text(
                              'Running the App on an iOS Emulator',
                              style: TextStyle(fontSize: 18),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => JVideo()),
                        );
                      },

                      child: Card(
                        elevation: 5,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(height: 0),

                            Icon(Icons.video_file, size: 100),

                            SizedBox(height: 10),

                            Text(
                              'Step-by-Step Guide to Running a Flutter App on Windows',
                              style: TextStyle(fontSize: 18),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
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
