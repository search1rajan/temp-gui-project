import 'package:flutter/material.dart';

// import 'bottom_navigation_bar.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ProfileScreen();
  }
}

class _ProfileScreen extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile',
          style: TextStyle(
            color: Colors.black,
            fontSize: 30,
            fontFamily: "Times new roman",
          ),
        ),
      ),

      body: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            // Profile
            Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.grey.shade300,
                  child: Icon(Icons.person, size: 40, color: Colors.blueGrey),
                ),

                SizedBox(width: 15),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Student',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: 5),

                    Text(
                      'student@gmail.com',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),

            SizedBox(height: 20),

            // Menu Card
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade200,
                    blurRadius: 5,
                    spreadRadius: 1,
                  ),
                ],
              ),

              child: Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.person),
                    title: Text('My Profile'),
                    trailing: Icon(Icons.chevron_right),
                    onTap: () {},
                  ),

                  Divider(height: 1),

                  ListTile(
                    leading: Icon(Icons.pie_chart),
                    title: Text('Budget Overview'),
                    trailing: Icon(Icons.chevron_right),
                    onTap: () {},
                  ),

                  Divider(height: 1),

                  ListTile(
                    leading: Icon(Icons.settings),
                    title: Text('Settings'),
                    trailing: Icon(Icons.chevron_right),
                    onTap: () {},
                  ),

                  Divider(height: 1),

                  ListTile(
                    leading: Icon(Icons.help),
                    title: Text('Help & Support'),
                    trailing: Icon(Icons.chevron_right),
                    onTap: () {},
                  ),

                  Divider(height: 1),

                  ListTile(
                    leading: Icon(Icons.info),
                    title: Text('About App'),
                    trailing: Icon(Icons.chevron_right),
                    onTap: () {},
                  ),
                ],
              ),
            ),

            SizedBox(height: 110),

            // Logout
            SizedBox(
              width: double.infinity,
              height: 50,
              child: OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: Colors.green),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.logout, color: Colors.green),

                    SizedBox(width: 10),

                    Text(
                      'Logout',
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
