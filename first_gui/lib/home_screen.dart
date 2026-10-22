import 'package:flutter/material.dart';

// ignore: camel_case_types
class home_screen extends StatelessWidget {
  const home_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,

        title: Text(
          "Home ",
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
                  Icon(Icons.home, color: Colors.blue, size: 100),

                  Text(
                    "Welcome to flutter",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: "Times New Roman",

                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "learn flutter easily",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: "Times New Roman",

                      fontSize: 15,
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
                  Icon(Icons.home, color: Colors.white, size: 30),
                  SizedBox(width: 10),
                  Text(
                    "Home",
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
