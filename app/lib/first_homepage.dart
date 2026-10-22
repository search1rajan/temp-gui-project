import 'package:flutter/material.dart';

class FirstHomepage extends StatelessWidget {
  const FirstHomepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Home',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: EdgeInsetsGeometry.all(15.78),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 350,
              width: 350,
              padding: const EdgeInsets.all(32.0),
              decoration: BoxDecoration(color: Colors.blue),
            ),
          ],
        ),
      ),
    );
  }
}
