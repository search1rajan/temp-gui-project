import 'package:flutter/material.dart';

// ignore: camel_case_types
class courses_screen extends StatelessWidget {
  const courses_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,

        title: Text(
          "Courses ",
          style: TextStyle(
            color: Colors.red,
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
                color: Colors.yellow,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.black, width: 2),
              ),

              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.school, color: Colors.blue, size: 100),

                  Text(
                    "Our Courses",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: "Times New Roman",
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 20),

                  Padding(
                    padding: EdgeInsets.only(left: 20),

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.circle, color: Colors.blue, size: 8),
                            SizedBox(width: 10),
                            Text("Flutter Basic "),
                          ],
                        ),

                        Row(
                          children: [
                            Icon(Icons.circle, color: Colors.blue, size: 8),
                            SizedBox(width: 10),
                            Text("Dart Programming "),
                          ],
                        ),

                        Row(
                          children: [
                            Icon(Icons.circle, color: Colors.blue, size: 8),
                            SizedBox(width: 10),
                            Text("UI Design "),
                          ],
                        ),

                        Row(
                          children: [
                            Icon(Icons.circle, color: Colors.blue, size: 8),
                            SizedBox(width: 10),
                            Text("App Development "),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),

            Container(
              height: 50,
              width: 200,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(10),
              ),

              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.play_arrow, color: Colors.white, size: 30),

                  SizedBox(width: 10),

                  Text(
                    "Start courses",
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
