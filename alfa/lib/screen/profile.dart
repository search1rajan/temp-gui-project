import 'package:alfa/screen/signup.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Profile extends StatefulWidget {
  final String? name;
  final String? email;
  final String? imageurl;

  const Profile({
    super.key,
    required this.name,
    required this.email,
    required this.imageurl,
  });

  @override
  State<Profile> createState() {
    return _Profile();
  }
}

class _Profile extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
        title: Text('Profile', style: TextStyle(color: Colors.white)),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 80),
            CircleAvatar(
              radius: 105,
              backgroundImage:
                  widget.imageurl != null ? NetworkImage(widget.imageurl!) : null,
              child: widget.imageurl == null ? const Icon(Icons.person, size: 80) : null,
            ),
            SizedBox(height: 40),
            Text(
              widget.name ?? 'User',
              style: TextStyle(color: Colors.black54, fontSize: 30),
            ),

            SizedBox(height: 30),
            Text(
              widget.email ?? 'No email',
              style: TextStyle(color: Colors.blue, fontSize: 30),
            ),
            SizedBox(height: 200),
            Padding(
              padding: EdgeInsets.all(10),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () async {
                  if (!mounted) return;

                  final dialogContext = context;
                  final scaffoldMessenger = ScaffoldMessenger.maybeOf(dialogContext);
                  final navigator = Navigator.of(dialogContext);

                  final bool? confirmLogout = await showDialog<bool>(
                    context: dialogContext,
                    builder: (dialogContext) {
                      return AlertDialog(
                        title: const Text("Logout Confirmation"),
                        content: const Text("Are you sure want to logout"),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(dialogContext, false);
                            },
                            child: const Text("No"),
                          ),

                          TextButton(
                            onPressed: () {
                              Navigator.pop(dialogContext, true);
                            },
                            child: const Text("Yes"),
                          ),
                        ],
                      );
                    },
                  );

                  if (confirmLogout != true) {
                    return;
                  }

                  await FirebaseAuth.instance.signOut();
                  if (!mounted) return;

                  scaffoldMessenger?.showSnackBar(
                    const SnackBar(content: Text("Logout Successfull")),
                  );

                  navigator.pushReplacement(
                    MaterialPageRoute(builder: (context) => const Signup()),
                  );
                },
                child: Text(
                  "Logout",
                  style: TextStyle(color: Colors.black, fontSize: 30),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
