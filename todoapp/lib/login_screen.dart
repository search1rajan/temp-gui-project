import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'profile_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
@override
  State<LoginScreen> createState() {
    return _LoginScreen();
  }
}

class _LoginScreen extends State<LoginScreen> {
  Future<void> googlesignin() async {
    try {
      await GoogleSignIn.instance.initialize();
      //Google Account ko open karne ke liye
      final GoogleSignInAccount googleuser = await GoogleSignIn.instance
          .authenticate();

      final GoogleSignInAuthentication googleAuth = googleuser.authentication;

      // print("${googleAuth}");

      if (googleAuth.idToken == null) {
        throw Exception("Google Id Token Is  Null");
      }

      final credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken!,
      );



      final UserCredential userCredential = await FirebaseAuth.instance
          .signInWithCredential(credential);

      final User? user = userCredential.user;
      if (user != null) {
        debugPrint('Login Successfully');
        debugPrint('Name : ${user.displayName}');
        debugPrint('Email : ${user.email}');

        if (!mounted) return;

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => ProfileScreen(
              name: user.displayName,
              email: user.email,
              imageurl: user.photoURL,
            ),
          ),
        );
      }
    } catch (e) {
      debugPrint('Google SIgn In Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Google Login')),
      body: Center(
        child: ElevatedButton.icon(
          onPressed: googlesignin,
          icon: const Icon(Icons.login),
          label: const Text("Continue with google"),
        ),
      ),
    );
  }
}
