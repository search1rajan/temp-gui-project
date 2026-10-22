// ignore_for_file: duplicate_import

import 'package:flutter/material.dart';
import 'package:logogui/NavigatePage.dart';

// import 'VideoPlayer.dart';

// import 'FlutterLogo.dart';

// import 'JavaLogo.dart';
// import 'Rlogo.dart';
// import 'CLogo.dart';
// import 'CSLogo.dart';
// import 'AndroidInfo.dart';
// import 'cssinfo.dart';
// import 'htmlinfo.dart';
// import 'javaScript.dart';
// import 'Python.dart';
// import 'Goinfo.dart';
// import 'Rust.dart';
// import 'PHP.dart';
// import 'Swiftinfo.dart';
// import 'Rubyinfo.dart';
// import 'Kotlininfo.dart';
// import 'DartInfo.dart';
// import 'MATLABinfo.dart';
// import 'Assembly.dart';
// import 'Perlinfo.dart';

void main() {
  runApp(const Gui());
}

class Gui extends StatelessWidget {
  const Gui({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: Navigatepage());
  }
}
