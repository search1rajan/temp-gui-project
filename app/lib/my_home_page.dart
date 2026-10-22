import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  void clicked() {}

  @override
  Widget build(BuildContext context) {
    // return Container(
    //   child: Text("hello"),
    // );

    return Scaffold(
      appBar: AppBar(title: Text("My Flutter App")),
      body: Center(
        // child: Text("Welcome to Flutter"),
        // child: Text("Welcome to Flutter"),
        // child:Column(
        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //   // crossAxisAlignment: CrossAxisAlignment.center,
        //   children:[
        //     Text("Welcome to Flutter"),
        //     Text("Welcome to Flutter"),
        //     Text("Welcome to Flutter"),
        //   ]
        // )

        // child:Row(
        //   mainAxisAlignment: MainAxisAlignment.end,
        //   // crossAxisAlignment: CrossAxisAlignment.end,
        //   children:[
        //     Text("Welcome to Flutter"),
        //     // Text("Welcome to Flutter"),
        //     // Text("Welcome to Flutter"),
        //   ]
        // )
        child: Column(
          children: [
            Text(
              "Flutter Class",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 30),
            Text("Welcome to flutter class", style: TextStyle(fontSize: 20)),

            // Button Banana
            SizedBox(height: 40),
            Center(
              child: ElevatedButton(
                onPressed: clicked,
                child: Row(
                  mainAxisSize: MainAxisSize.min,

                  children: [
                    Icon(Icons.home, size: 100),
                    SizedBox(width: 10),
                    Text("ghar", style: TextStyle(fontSize: 100)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
