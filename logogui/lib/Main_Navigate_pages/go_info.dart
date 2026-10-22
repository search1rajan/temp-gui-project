import 'package:flutter/material.dart';

class Goinfo extends StatelessWidget {
  const Goinfo({super.key});
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
              'Go Language',
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
                'https://www.reloadly.com/blog/wp-content/uploads/2022/10/Banner-1.jpg',
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
                  'About Golang',
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
                    'Go (Golang) is an open-source programming language developed by Google. It is designed to be simple, fast, and efficient, making it suitable for building web applications, backend systems, APIs, cloud services, and distributed systems. Go supports concurrency, which allows multiple tasks to run efficiently at the same time. It is widely used for modern server-side and cloud-based software development.',
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
