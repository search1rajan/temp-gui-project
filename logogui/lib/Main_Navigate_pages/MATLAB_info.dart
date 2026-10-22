// ignore_for_file: file_names

import 'package:flutter/material.dart';

class Matlabinfo extends StatelessWidget {
  const Matlabinfo({super.key});
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
              'MATLAB Language',
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
                'https://www.shutterstock.com/image-vector/matlab-programming-language-learning-concept-600w-1311316400.jpg',
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
                  'About MATLAB',
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
                    'MATLAB is a high-level programming language and numerical computing environment developed by MathWorks. It is mainly used for mathematical calculations, data analysis, scientific computing, simulations, and engineering applications. MATLAB provides powerful tools for working with matrices, creating graphs, and developing algorithms. It is widely used in engineering, research, education, and scientific fields.',
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
