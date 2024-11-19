import 'dart:typed_data';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotificationService {
  static final FlutterLocalNotificationsPlugin localNotification =
      FlutterLocalNotificationsPlugin();

  static Future<void> initialize() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    final DarwinInitializationSettings initializationSettingsDarwin =
        DarwinInitializationSettings(
      requestSoundPermission: true,
      requestBadgePermission: true,
      requestAlertPermission: true,
      onDidReceiveLocalNotification: (int? id, String? title, String? body, String? payload) async {
        print('Local Notification Received');
      },
    );

    final InitializationSettings settings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsDarwin,
    );

    await localNotification.initialize(settings);
  }

  // Method to show a local notification
  static Future<void> showNotification({
    required String? title,
    required String? body,
  }) async {
    AndroidNotificationDetails androidDetails = AndroidNotificationDetails(
      'your_channel_id', // Channel ID
      'your_channel_name', // Channel name
      importance: Importance.max,
      priority: Priority.high,
      playSound: true,
      enableVibration: true,
       vibrationPattern: Int64List.fromList([0, 500, 1000]),
        visibility: NotificationVisibility.public, 

    );

    NotificationDetails notificationDetails = NotificationDetails(
      android: androidDetails,
      iOS: const DarwinNotificationDetails(),
    );

    await localNotification.show(
      0, // Notification ID (can be any value)
      title, // Notification title
      body, // Notification body
      notificationDetails,
    );
  }
}
