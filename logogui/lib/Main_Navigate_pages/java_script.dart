import 'package:flutter/material.dart';

class Javascript extends StatelessWidget {
  const Javascript({super.key});
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
              'About JavaScript',
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
                'https://img.magnific.com/free-vector/programmers-using-javascript-programming-language-computer-tiny-people-javascript-language-javascript-engine-js-web-development-concept-bright-vibrant-violet-isolated-illustration_335657-986.jpg?semt=ais_hybrid&w=740&q=80',
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
                  ' javaScript',
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
                    'JavaScript is a popular programming language used to make web pages interactive and dynamic. It can be used to handle buttons, forms, animations, events, and user interactions. JavaScript works with HTML and CSS to create modern and responsive websites. It is also used for web applications, server-side development, and mobile applications.',
                    style: TextStyle(color: Colors.black, fontSize: 20),
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
