import 'package:flutter/material.dart';

// ignore: camel_case_types
class profile_screen extends StatelessWidget {
  const profile_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue,

        title: Text(
          "Profile",
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontFamily: "Times New Roman",
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 350,
              width: 250,
              decoration: BoxDecoration(
                color: Colors.blue[50],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.blue,
                    child: Icon(Icons.person, color: Colors.white, size: 80),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Student Name",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: "Times New Roman",

                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    " Flutter Student",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: "Times New Roman",

                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 80),
            Container(
              height: 50,
              width: 200,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.person, color: Colors.white, size: 30),
                  SizedBox(width: 10),
                  Text(
                    "Profile",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
