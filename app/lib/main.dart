// import 'my_home_page.dart';
import 'package:app/first_homepage.dart';
import 'package:flutter/material.dart';

// import 'home_screen.dart';

void main() {
  runApp(const MyClass());
}

class MyClass extends StatelessWidget {
  const MyClass({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FirstHomepage(),
    );
  }
}
