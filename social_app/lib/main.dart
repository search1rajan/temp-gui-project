import 'package:flutter/material.dart';
import 'package:social_app/homepage.dart';

// import 'package:social_app/homepage.dart';
// import 'Video.dart';

void main() {
  runApp(const Social());
}

class Social extends StatelessWidget {
  const Social({super.key});

  @override
  Widget build(BuildContext context) {
    return (MaterialApp(debugShowCheckedModeBanner: false, home: Homepage()));
  }
}
