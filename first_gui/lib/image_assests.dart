import 'package:flutter/material.dart';

class ImageAssets extends StatelessWidget {
  const ImageAssets({super.key});
  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue,
        title: Text(
          "Image add karna ",
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
              height: 180,
              width: 180,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 2),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image.network(
                'https://randomuser.me/api/portraits/men/32.jpg',
              ),
            ),
            SizedBox(height: 20),
            Container(
              height: 180,
              width: 180,
              decoration: BoxDecoration(
                color: Colors.blue,
                border: Border.all(color: Colors.black, width: 2),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image.network(
                'https://randomuser.me/api/portraits/men/32.jpg',
              ),
            ),
            SizedBox(height: 20),
            Container(
              height: 180,
              width: 180,
              decoration: BoxDecoration(
                color: Colors.blue,
                border: Border.all(color: Colors.black, width: 2),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image.asset('assests/asd.jpeg'),
            ),
          ],
        ),
      ),
    ));
  }
}
