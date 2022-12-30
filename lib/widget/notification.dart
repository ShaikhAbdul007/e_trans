import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class CustomNotification {
  static final notification = FlutterLocalNotificationsPlugin();
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  AndroidInitializationSettings initializationSettingsAndroid =
      const AndroidInitializationSettings('mipmap-mdpi/ic_launcher.png');
// final DarwinInitializationSettings initializationSettingsDarwin =
//     DarwinInitializationSettings(
//         onDidReceiveLocalNotification: onDidReceiveLocalNotification);

// flutterLocalNotificationsPlugin.re

// final flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<
//     AndroidFlutterLocalNotificationsPlugin>().requestPermission();

  static Future<NotificationDetails> notificationDetails() async {
    return const NotificationDetails(
      android: AndroidNotificationDetails("channel Id", "channel Name",
          channelDescription: "channelDescription", importance: Importance.max),
      iOS: DarwinNotificationDetails(),
    );
  }

  void initialize() async {
    notificationDetails();
  }

  static Future showCustomNotification(
      {var id = 0, String? title, String? body, String? payLoad}) async {
    return notification.show(
        id, title, body, payload: payLoad, await notificationDetails());
  }
}
