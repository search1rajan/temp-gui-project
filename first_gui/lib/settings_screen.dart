import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue,
        title: Text("Setting"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 50,
              width: 300,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 223, 218, 180),
                borderRadius: BorderRadius.circular(10),

                border: Border.all(color: Colors.black, width: 2),
              ),

              child: Padding(
                padding: EdgeInsets.only(left: 20),

                child: Row(
                  children: [
                    Icon(Icons.settings, color: Colors.blue, size: 30),
                    SizedBox(width: 10),
                    Text(
                      "Account Setting",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontFamily: "Time new Roman",
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              height: 50,
              width: 300,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 223, 218, 180),
                borderRadius: BorderRadius.circular(10),

                border: Border.all(color: Colors.black, width: 2),
              ),

              child: Padding(
                padding: EdgeInsets.only(left: 20),

                child: Row(
                  children: [
                    Icon(Icons.notifications, color: Colors.blue, size: 30),
                    SizedBox(width: 10),
                    Text(
                      "Notification",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontFamily: "Time new Roman",
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              height: 50,
              width: 300,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 223, 218, 180),
                borderRadius: BorderRadius.circular(10),

                border: Border.all(color: Colors.black, width: 2),
              ),

              child: Padding(
                padding: EdgeInsets.only(left: 20),

                child: Row(
                  children: [
                    Icon(Icons.lock, color: Colors.blue, size: 30),
                    SizedBox(width: 10),
                    Text(
                      "Privacy",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontFamily: "Time new Roman",
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              height: 50,
              width: 300,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 223, 218, 180),
                borderRadius: BorderRadius.circular(10),

                border: Border.all(color: Colors.black, width: 2),
              ),

              child: Padding(
                padding: EdgeInsets.only(left: 20),

                child: Row(
                  children: [
                    Icon(Icons.info, color: Colors.blue, size: 30),
                    SizedBox(width: 10),
                    Text(
                      " About Us",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontFamily: "Time new Roman",
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 110),
            Container(
              height: 50,
              width: 150,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(10),

                border: Border.all(color: Colors.black, width: 2),
              ),

              child: Padding(
                padding: EdgeInsets.only(left: 20),

                child: Row(
                  children: [
                    Icon(Icons.save, color: Colors.white, size: 30),

                    Text(
                      " Save",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontFamily: "Time new Roman",
                      ),
                    ),
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
