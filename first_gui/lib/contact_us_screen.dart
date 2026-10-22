import 'package:flutter/material.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue,
        title: Text(
          "Contact Us ",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontFamily: "Times New Roman",
          ),
        ),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 400,
              width: 280,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.black, width: 2),
              ),
              padding: EdgeInsets.only(left: 20),

              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Icon(Icons.call, color: Colors.blueAccent, size: 40),

                      SizedBox(width: 10),

                      Text(
                        "Call Us",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                          fontFamily: "Times New Roman",
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Icon(Icons.mail, color: Colors.blueAccent, size: 40),

                      SizedBox(width: 10),

                      Text(
                        "Email Us ",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                          fontFamily: "Times New Roman",
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Icon(
                        Icons.location_pin,
                        color: Colors.blueAccent,
                        size: 40,
                      ),

                      SizedBox(width: 10),

                      Text(
                        "Visit Us ",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                          fontFamily: "Times New Roman",
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Icon(Icons.chat, color: Colors.blueAccent, size: 40),

                      SizedBox(width: 10),

                      Text(
                        "Chat With Us ",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                          fontFamily: "Times New Roman",
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: 50),

            Container(
              height: 50,
              width: 150,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.black, width: 2),
              ),

              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.call, color: Colors.white, size: 20),

                  SizedBox(width: 10),

                  Text(
                    "Contact",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
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
