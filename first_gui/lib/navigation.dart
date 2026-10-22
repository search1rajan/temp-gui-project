import 'package:first_gui/home_screen.dart';
import 'package:flutter/material.dart';
import 'contact_us_screen.dart';
import 'courses_screen.dart';
import 'flutter_image.dart';
import 'image_assests.dart';
import 'profile_screen.dart';
import 'settings_screen.dart';

class Navigation extends StatelessWidget {
  const Navigation({super.key});

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.yellowAccent,
        title: Text(
          'Courses',
          style: TextStyle(color: Colors.deepPurple, fontSize: 30),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: GridView.count(
          crossAxisCount: 2,
          childAspectRatio: 0.6,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          children: [
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ContactUsScreen()),
                );
              },
              child: Card(
                elevation: 5,
                child: Column(
                  children: [
                    Image.asset("assests/asd.jpeg", fit: BoxFit.cover),

                    SizedBox(height: 20),
                    Text('ContactUsScreen'),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => courses_screen()),
                );
              },
              child: Card(
                elevation: 5,
                child: Column(
                  children: [
                    Image.asset("assests/asd.jpeg", fit: BoxFit.cover),

                    SizedBox(height: 20),
                    Text('courses_screen'),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FlutterImage()),
                );
              },
              child: Card(
                elevation: 5,
                child: Column(
                  children: [
                    Image.asset("assests/asd.jpeg", fit: BoxFit.cover),

                    SizedBox(height: 20),
                    Text('FlutterImage'),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => home_screen()),
                );
              },
              child: Card(
                elevation: 5,
                child: Column(
                  children: [
                    Image.asset("assests/asd.jpeg", fit: BoxFit.cover),

                    SizedBox(height: 20),
                    Text('Home'),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ImageAssets()),
                );
              },
              child: Card(
                elevation: 5,
                child: Column(
                  children: [
                    Image.asset("assests/asd.jpeg", fit: BoxFit.cover),

                    SizedBox(height: 20),
                    Text('ImageAssets'),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => profile_screen()),
                );
              },
              child: Card(
                elevation: 5,
                child: Column(
                  children: [
                    Image.asset("assests/asd.jpeg", fit: BoxFit.cover),

                    SizedBox(height: 20),
                    Text('profile_screen'),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SettingsScreen()),
                );
              },
              child: Card(
                elevation: 5,
                child: Column(
                  children: [
                    Image.asset("assests/asd.jpeg", fit: BoxFit.cover),

                    SizedBox(height: 20),
                    Text('SettingsScreen'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
