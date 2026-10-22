// ignore_for_file: file_names

import 'package:flutter/material.dart';

class Php extends StatelessWidget {
  const Php({super.key});
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
              'PHP Language',
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
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRQZsMdtNQgbwaPT1Cz_CN_1DeRYd9st69FGLTcR2Kh4w&s=10',
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
                  'About PHP',
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
                    'PHP (Hypertext Preprocessor) is a popular server-side scripting language used to develop dynamic and interactive websites. It is mainly used for web development, backend development, database-driven applications, and web applications. PHP can work with databases such as MySQL and is commonly used with HTML and CSS to create dynamic web pages.',
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
