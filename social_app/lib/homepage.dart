import 'package:flutter/material.dart';
import 'package:social_app/Video.dart';
import 'package:social_app/local_media.dart';
import 'package:social_app/youtubeVideo.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});
  @override
  State<Homepage> createState() => _Homepage();
}

class _Homepage extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.amber,
        title: Text(
          'Main menu',
          style: TextStyle(
            color: Colors.blue,
            fontFamily: "Times New Roman",
            fontSize: 30,
          ),
        ),
      ),
      body: Center(
        child: GridView.count(
          crossAxisCount: 2,
          childAspectRatio: 0.9,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          children: [
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => VideoPlayer()),
                );
              },
              child: Card(
                elevation: 5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(width: 20),
                    Icon(Icons.videocam, size: 150.0, color: Colors.blue),

                    Text('online Videos', style: TextStyle(fontSize: 20)),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LocalMedia()),
                );
              },
              child: Card(
                elevation: 5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(width: 20),
                    Icon(Icons.videocam, size: 150.0, color: Colors.blue),

                    Text('Local Video', style: TextStyle(fontSize: 20)),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Youtubevideo()),
                );
              },
              child: Card(
                elevation: 5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(width: 20),

                    Icon(Icons.yard_outlined, color: Colors.red, size: 150.0),

                    Text('Youtube Video', style: TextStyle(fontSize: 20)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
