import 'package:flutter/material.dart';

class Dartinfo extends StatelessWidget {
  const Dartinfo({super.key});
  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.yellow,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.info),
            Text(
              ' About Dart Language',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.red,

                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),

      body: Center(
        child: Column(
          children: [
            SizedBox(height: 10),
            Container(
              height: 200,
              width: 400,
              decoration: BoxDecoration(color: Colors.white),
              child: Image.network(
                'https://miro.medium.com/1*-V1vlcgNltXqubTDrPsjew.jpeg',
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 40),
            Container(
              height: 50,
              width: 200,
              decoration: BoxDecoration(
                color: Colors.lightBlue,
                border: Border.all(color: Colors.black, width: 2),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  'About Dart',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Times New Roman',
                    fontSize: 25,
                  ),
                ),
              ),
            ),
            SizedBox(height: 40),
            Container(
              height: 350,
              width: 350,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(0)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Text(
                    'Information -: ',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.deepOrangeAccent,
                      fontSize: 30,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Dart is a modern, client-optimized programming language developed by Google. It is mainly used for building mobile, web, and desktop applications. Dart has a simple and readable syntax and supports object-oriented programming. It is the primary programming language used with the Flutter framework to create cross-platform applications from a single codebase.',
                    style: TextStyle(color: Colors.black, fontSize: 19),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
