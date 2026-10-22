import 'package:flutter/material.dart';

void main() => runApp(const DemoApp());
const blue = Color(0xff1769ed),
    ink = Color(0xff17223a),
    muted = Color(0xff74819b),
    bg = Color(0xfff5f8fc);

class DemoApp extends StatelessWidget {
  const DemoApp({super.key});
  @override
  Widget build(BuildContext context) => MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter App UI',
      theme: ThemeData(
          useMaterial3: true,
          scaffoldBackgroundColor: bg,
          colorScheme: ColorScheme.fromSeed(seedColor: blue),
          fontFamily: 'Roboto'),
      home: const Welcome());
}

class Welcome extends StatelessWidget {
  const Welcome({super.key});
  @override
  Widget build(BuildContext c) => Scaffold(
      body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color(0xff0879ef), Color(0xff6545ef)])),
          child: SafeArea(
              child: Column(children: [
            const Spacer(),
            Container(
                width: 116,
                height: 116,
                decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: .16),
                    borderRadius: BorderRadius.circular(34)),
                child: const Icon(Icons.flutter_dash,
                    size: 84, color: Colors.white)),
            const SizedBox(height: 24),
            const Text('Flutter App',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 34,
                    fontWeight: FontWeight.bold)),
            const Text('Build Something Amazing',
                style: TextStyle(color: Colors.white70, fontSize: 16)),
            const Spacer(),
            Padding(
                padding: const EdgeInsets.all(26),
                child: Column(children: [
                  SizedBox(
                      width: double.infinity,
                      height: 56,
                      child: FilledButton.icon(
                          style: FilledButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: blue),
                          onPressed: () => Navigator.push(
                              c,
                              MaterialPageRoute(
                                  builder: (_) => const Onboarding())),
                          icon: const Icon(Icons.g_mobiledata, size: 32),
                          label: const Text('Continue with Google'))),
                  const SizedBox(height: 16),
                  const Text('Secure   •   Fast   •   Reliable',
                      style: TextStyle(color: Colors.white70))
                ]))
          ]))));
}

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});
  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  int i = 0;
  final titles = ['Welcome to\nOur App', 'Stay Organized', 'Grow Together'];
  final subs = [
    'Your personal space to manage tasks, track progress and more.',
    'Keep your work, tasks and goals in one place. Get things done more efficiently.',
    'Join a community that helps you learn, build and achieve more.'
  ];
  @override
  Widget build(BuildContext c) => Scaffold(
          body: SafeArea(
              child: Column(children: [
        Align(
            alignment: Alignment.centerRight,
            child: TextButton(
                onPressed: () => Navigator.pushReplacement(
                    c, MaterialPageRoute(builder: (_) => const Shell())),
                child: const Text('Skip'))),
        const Spacer(),
        Icon(
            [
              Icons.person_pin_circle,
              Icons.checklist_rounded,
              Icons.rocket_launch_rounded
            ][i],
            size: 150,
            color: blue),
        const SizedBox(height: 34),
        Text(titles[i],
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontSize: 27, fontWeight: FontWeight.bold, color: ink)),
        Padding(
            padding: const EdgeInsets.all(26),
            child: Text(subs[i],
                textAlign: TextAlign.center,
                style: const TextStyle(color: muted, fontSize: 16))),
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
                4,
                (j) => Container(
                    margin: const EdgeInsets.all(4),
                    width: i == j ? 10 : 7,
                    height: 7,
                    decoration: BoxDecoration(
                        color: i == j ? blue : const Color(0xffd5dce8),
                        shape: BoxShape.circle)))),
        const Spacer(),
        Padding(
            padding: const EdgeInsets.all(24),
            child: SizedBox(
                width: double.infinity,
                height: 52,
                child: FilledButton(
                    onPressed: () => i < 2
                        ? setState(() => i++)
                        : Navigator.pushReplacement(c,
                            MaterialPageRoute(builder: (_) => const Shell())),
                    child: Text(i < 2 ? 'Next' : 'Get Started'))))
      ])));
}

class Shell extends StatefulWidget {
  const Shell({super.key});
  @override
  State<Shell> createState() => _ShellState();
}

class _ShellState extends State<Shell> {
  int tab = 0;
  final pages = [
    const Home(),
    const Tasks(),
    const Notifications(),
    const Profile()
  ];
  @override
  Widget build(BuildContext c) => Scaffold(
      body: pages[tab],
      bottomNavigationBar: NavigationBar(
          selectedIndex: tab,
          onDestinationSelected: (v) => setState(() => tab = v),
          destinations: const [
            NavigationDestination(
                icon: Icon(Icons.home_outlined), label: 'Home'),
            NavigationDestination(
                icon: Icon(Icons.assignment_outlined), label: 'Tasks'),
            NavigationDestination(
                icon: Icon(Icons.notifications_none), label: 'Notifications'),
            NavigationDestination(
                icon: Icon(Icons.person_outline), label: 'Profile')
          ]));
}

class Home extends StatelessWidget {
  const Home({super.key});
  @override
  Widget build(BuildContext c) => Scaffold(
      appBar: AppBar(
          title: const Text('Good Morning,\nRahul Sharma',
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
          actions: [
            IconButton(
                onPressed: () => Navigator.push(
                    c, MaterialPageRoute(builder: (_) => const Settings())),
                icon: const Icon(Icons.settings_outlined)),
            const CircleAvatar(child: Icon(Icons.person))
          ]),
      body: ListView(padding: const EdgeInsets.all(18), children: [
        Row(children: [
          stat('Total Tasks', '12', Icons.assignment, blue),
          stat('Completed', '8', Icons.check_circle, Colors.green),
          stat('Pending', '4', Icons.pending_actions, Colors.red)
        ]),
        const SizedBox(height: 24),
        const Text('Quick Actions',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 14),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          action(c, 'Add Task', Icons.add_box),
          action(c, 'Scan QR', Icons.qr_code_scanner),
          action(c, 'Upload', Icons.upload),
          action(c, 'More', Icons.more_horiz)
        ]),
        const SizedBox(height: 24),
        const Text('Recent Activity',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const Tile(
            icon: Icons.check_circle,
            color: Colors.green,
            title: 'Task Completed',
            subtitle: 'Design UI for login screen',
            time: '2h ago'),
        const Tile(
            icon: Icons.message,
            color: blue,
            title: 'New Message',
            subtitle: 'From Team Leader',
            time: '4h ago')
      ]));
}

Widget stat(String title, String value, IconData icon, Color color) => Expanded(
    child: Card(
        child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 17),
            child: Column(children: [
              Icon(icon, color: color),
              Text(value,
                  style: TextStyle(
                      fontSize: 22, fontWeight: FontWeight.bold, color: color)),
              Text(title, style: const TextStyle(fontSize: 11, color: muted))
            ]))));
Widget action(BuildContext c, String label, IconData icon) => Column(children: [
      IconButton.filledTonal(
          onPressed: () => ScaffoldMessenger.of(c)
              .showSnackBar(const SnackBar(content: Text('UI preview only'))),
          icon: Icon(icon, color: blue)),
      Text(label, style: const TextStyle(fontSize: 11))
    ]);

class Tasks extends StatelessWidget {
  const Tasks({super.key});
  @override
  Widget build(BuildContext c) => Scaffold(
      appBar: AppBar(title: const Text('Tasks'), actions: [
        IconButton(
            onPressed: () => ScaffoldMessenger.of(c)
                .showSnackBar(const SnackBar(content: Text('UI preview only'))),
            icon: const Icon(Icons.add_circle, color: blue))
      ]),
      body: ListView(padding: const EdgeInsets.all(16), children: [
        const Wrap(spacing: 8, children: [
          Chip(label: Text('All (12)')),
          Chip(label: Text('Completed (8)')),
          Chip(label: Text('Pending (4)'))
        ]),
        ...[
          'Design UI for login screen',
          'API Integration',
          'Fix bugs in profile section',
          'Write documentation',
          'Deploy to production',
          'Team meeting'
        ].asMap().entries.map((e) => Tile(
            icon: Icons.check_circle,
            color: [Colors.green, Colors.amber, blue][e.key % 3],
            title: e.value,
            subtitle: [
              'Today  •  High',
              'Today  •  Medium',
              'Tomorrow  •  Medium'
            ][e.key % 3],
            time: '⋮'))
      ]));
}

class Notifications extends StatelessWidget {
  const Notifications({super.key});
  @override
  Widget build(BuildContext c) => Scaffold(
      appBar: AppBar(title: const Text('Notifications')),
      body: ListView(children: const [
        Tile(
            icon: Icons.check_circle,
            color: Colors.green,
            title: 'Task Completed',
            subtitle: 'Design UI for login screen',
            time: '2h ago'),
        Tile(
            icon: Icons.mail,
            color: Colors.deepPurple,
            title: 'New Message',
            subtitle: 'From Team Leader',
            time: '4h ago'),
        Tile(
            icon: Icons.notifications_active,
            color: blue,
            title: 'System Update',
            subtitle: 'New version available (v1.2.0)',
            time: '6h ago'),
        Tile(
            icon: Icons.event,
            color: Colors.orange,
            title: 'Welcome to Flutter App',
            subtitle: 'Thanks for joining us!',
            time: '1d ago'),
        Tile(
            icon: Icons.groups,
            color: Colors.purple,
            title: 'Meeting Reminder',
            subtitle: 'Team meeting at 11:00 AM',
            time: '1d ago')
      ]));
}

class Tile extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String title, subtitle, time;
  const Tile(
      {super.key,
      required this.icon,
      required this.color,
      required this.title,
      required this.subtitle,
      required this.time});
  @override
  Widget build(BuildContext c) => ListTile(
      leading: CircleAvatar(
          backgroundColor: color.withValues(alpha: .12),
          child: Icon(icon, color: color)),
      title: Text(title,
          style: const TextStyle(fontWeight: FontWeight.w600, color: ink)),
      subtitle: Text(subtitle),
      trailing: Text(time, style: const TextStyle(color: muted, fontSize: 11)));
}

class Profile extends StatelessWidget {
  const Profile({super.key});
  @override
  Widget build(BuildContext c) => Scaffold(
      appBar: AppBar(title: const Text('Profile'), actions: [
        IconButton(
            onPressed: () => Navigator.push(
                c, MaterialPageRoute(builder: (_) => const Settings())),
            icon: const Icon(Icons.settings))
      ]),
      body: ListView(padding: const EdgeInsets.all(20), children: [
        Container(
            padding: const EdgeInsets.all(24),
            decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [blue, Color(0xff7042ed)]),
                borderRadius: BorderRadius.all(Radius.circular(24))),
            child: const Column(children: [
              CircleAvatar(radius: 44, child: Icon(Icons.person, size: 50)),
              SizedBox(height: 10),
              Text('Rahul Sharma',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 21)),
              Text('rahul.sharma@gmail.com',
                  style: TextStyle(color: Colors.white70))
            ])),
        const SizedBox(height: 16),
        const Tile(
            icon: Icons.badge,
            color: muted,
            title: 'UID',
            subtitle: '123456789012345678901',
            time: ''),
        const Tile(
            icon: Icons.email,
            color: blue,
            title: 'Email',
            subtitle: 'rahul.sharma@gmail.com',
            time: ''),
        const Tile(
            icon: Icons.g_mobiledata,
            color: Colors.red,
            title: 'Login Provider',
            subtitle: 'Google',
            time: ''),
        FilledButton(
            onPressed: () => Navigator.push(
                c, MaterialPageRoute(builder: (_) => const EditProfile())),
            child: const Text('Edit Profile')),
        const SizedBox(height: 12),
        OutlinedButton(
            onPressed: () => showDialog(
                context: c,
                builder: (d) => AlertDialog(
                        title: const Text('Logout'),
                        content: const Text('Are you sure you want to logout?'),
                        actions: [
                          TextButton(
                              onPressed: () => Navigator.pop(d),
                              child: const Text('Cancel')),
                          FilledButton(
                              onPressed: () => Navigator.pop(d),
                              child: const Text('Logout'))
                        ])),
            child: const Text('Logout'))
      ]));
}

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});
  @override
  Widget build(BuildContext c) => Scaffold(
      appBar: AppBar(title: const Text('Edit Profile')),
      body: ListView(padding: const EdgeInsets.all(22), children: [
        const CircleAvatar(radius: 48, child: Icon(Icons.person, size: 54)),
        const SizedBox(height: 20),
        for (final x in ['Name', 'Email', 'Phone'])
          Padding(
              padding: const EdgeInsets.only(bottom: 14),
              child: TextField(
                  decoration: InputDecoration(
                      labelText: x,
                      border: const OutlineInputBorder(),
                      hintText: x == 'Name'
                          ? 'Rahul Sharma'
                          : x == 'Email'
                              ? 'rahul.sharma@gmail.com'
                              : '+91 98765 43210'))),
        FilledButton(
            onPressed: () => Navigator.pop(c),
            child: const Text('Save Changes'))
      ]));
}

class Settings extends StatelessWidget {
  const Settings({super.key});
  @override
  Widget build(BuildContext c) => Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: ListView(children: const [
        Padding(
            padding: EdgeInsets.all(16),
            child: Text('ACCOUNT', style: TextStyle(color: muted))),
        Tile(
            icon: Icons.person,
            color: muted,
            title: 'Profile Information',
            subtitle: '',
            time: '›'),
        Tile(
            icon: Icons.lock,
            color: muted,
            title: 'Change Password',
            subtitle: '',
            time: '›'),
        Tile(
            icon: Icons.link,
            color: blue,
            title: 'Linked Accounts',
            subtitle: '',
            time: '›'),
        Tile(
            icon: Icons.shield,
            color: muted,
            title: 'Privacy & Security',
            subtitle: '',
            time: '›'),
        Padding(
            padding: EdgeInsets.all(16),
            child: Text('APP SETTINGS', style: TextStyle(color: muted))),
        Tile(
            icon: Icons.notifications,
            color: muted,
            title: 'Notifications',
            subtitle: 'On',
            time: '●'),
        Tile(
            icon: Icons.brightness_6,
            color: muted,
            title: 'Theme',
            subtitle: 'Light',
            time: '›'),
        Tile(
            icon: Icons.language,
            color: muted,
            title: 'Language',
            subtitle: 'English',
            time: '›'),
        Padding(
            padding: EdgeInsets.all(16),
            child: Text('SUPPORT', style: TextStyle(color: muted))),
        Tile(
            icon: Icons.help,
            color: muted,
            title: 'Help & Support',
            subtitle: '',
            time: '›'),
        Tile(
            icon: Icons.info,
            color: muted,
            title: 'About App',
            subtitle: '',
            time: '›')
      ]));
}
