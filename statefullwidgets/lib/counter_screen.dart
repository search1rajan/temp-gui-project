import 'package:flutter/material.dart';

class Counterscreen extends StatefulWidget {
  const Counterscreen({super.key});

  //create state karta kya hai -> create state jo  function hai wo kya karta ----
  // state ko create karne ka kam karta hai
  //state ku create karte hai --- kisi ek state se dusre state me jane ke liye , screen me changes karne ke liye , ek state dusre dtate se alag hai naye stste banaye jate haai
  // need ku hai

  @override
  State<Counterscreen> createState() {
    return _CounterScreenState();
  }
}

class _CounterScreenState extends State<Counterscreen> {
  int counter = 9;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Counter Screen")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("$counter", style: TextStyle(color: Colors.red, fontSize: 50)),
            SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                setState(() {
                  counter++;
                });
              },

              child: Text("+"),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  counter--;
                });
              },

              child: Text("-"),
            ),
          ],
        ),
      ),
    );
  }
}
