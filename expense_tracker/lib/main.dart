import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'splash_screen.dart';

// import 'home_screen.dart';

// import 'add_transaction.dart';
// import 'transaction_details.dart';
// import 'profile_or_settings.dart';

// ignore: camel_case_types
class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: SplashScreen());
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    await Firebase.initializeApp();
    debugPrint('Connection Successfully');
  } catch (e) {
    debugPrint('$e');
  }

  runApp(const Main());
}
