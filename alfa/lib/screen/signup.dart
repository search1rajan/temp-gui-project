import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:alfa/screen/profile.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});
  @override
  State<Signup> createState() => _Signup();
}

class _Signup extends State<Signup> {
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

        //User se Notification Ka Permission Lene ke liye
        await FirebaseMessaging.instance.requestPermission();

        //Get FCM Token

        final String? fcmToken = await FirebaseMessaging.instance.getToken();
        debugPrint('FCM TOKEN');
        debugPrint('FCM TOKEN : $fcmToken');

        if (!mounted) return;

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Profile(
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
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue,
        title: Text(
          'Registration page',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight(20),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Text(
                    "fill in blank's",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontFamily: "times new  roman",
                    ),
                  ),
                  SizedBox(height: 40),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Name',
                      hintText: 'Enter your name',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          width: 2,
                          color: Colors.blueGrey,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Email',
                      hintText: 'Enter your Email',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          width: 2,
                          color: Colors.blueGrey,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 100),
            ElevatedButton.icon(
              onPressed: googlesignin,
              icon: Icon(Icons.no_encryption_gmailerrorred_outlined, size: 30),
              label: Text('Signup with Gmail'),
            ),
          ],
        ),
      ),
    );
  }
}
