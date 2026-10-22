// import 'package:first_gui/courses_screen.dart';
// import 'package:first_gui/ImageAssets.dart';
import 'package:flutter/material.dart';
// import 'package:first_gui/home_screen.dart';
// import 'settings_screen.dart';
// import 'contact_us_screen.dart';
// import 'flutter_image.dart';
import 'navigation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: Navigation());
  }
}
