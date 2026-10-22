import 'package:alfa/screen/signup.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'firebase_options.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

const AndroidNotificationChannel channel = AndroidNotificationChannel(
  'notification_channel',
  'DefaultNotification',
  description: 'Default Description',
  importance: Importance.max,
);

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  const AndroidInitializationSettings androidSettings =
      AndroidInitializationSettings('@mipmap/ic_launcher');

  const InitializationSettings initializationSettings = InitializationSettings(
    android: androidSettings,
  );

  await flutterLocalNotificationsPlugin.initialize(
    settings: initializationSettings,
  );

  //Create notification channel

  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin
      >()
      ?.createNotificationChannel(channel);

  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    debugPrint('Notification Received');
    debugPrint('Notification Title : ${message.notification?.title}');
    debugPrint('Notification Body : ${message.notification?.body}');

    showNotification(message);
  });

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Signup(),
    );
  }
}

void showNotification(RemoteMessage message) async {
  final String title = message.notification?.title ?? "New Notification";
  final String body =
      message.notification?.body ?? "You have received a new notification.";

  const AndroidNotificationDetails androidDetails = AndroidNotificationDetails(
    'notification_channel',
    'DefaultNotification',
    channelDescription: 'Default Description',
    importance: Importance.max,
    priority: Priority.high,
    ticker: 'ticker',
    icon: '@mipmap/ic_launcher',
  );

  const NotificationDetails notificationDetails = NotificationDetails(
    android: androidDetails,
  );

  flutterLocalNotificationsPlugin.show(
    id: DateTime.now().millisecondsSinceEpoch.remainder(2147483647),
    title: title, 
    body: body, 
    notificationDetails: notificationDetails,
    
    );
}
