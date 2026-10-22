import 'package:flutter/material.dart';

class FlutterImage extends StatelessWidget {
  const FlutterImage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.red,
        title: Text(
          'Figure',
          style: TextStyle(
            color: Colors.blue,
            fontFamily: "Times New Roman",
            fontSize: 20,
          ),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.only(bottom: 5),
              height: 220,
              width: 350,

              decoration: BoxDecoration(
                color: Colors.black,
                border: Border.all(color: Colors.black, width: 3),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image.asset('assests/logo.jpg', fit: BoxFit.cover),
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.only(bottom: 20),
              child: Column(
                children: [
                  Text(
                    "Flutter Course",
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 20,
                      fontFamily: "Times New Roman",
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                      decorationColor: Colors.yellow,
                      decorationThickness: 5,
                    ),
                  ),

                  Text(
                    "Learn Flutter from Basic to Advanced",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 50,
                      fontWeight: FontWeight.bold,

                      decoration: TextDecoration.underline,
                      decorationColor: Colors.yellow,
                      decorationThickness: 5,
                    ),
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
