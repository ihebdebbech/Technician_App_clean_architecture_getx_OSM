import 'package:firebase_messaging/firebase_messaging.dart';
import 'local_notification_service.dart';

// Background message handler
// Background message handler
Future<void> _backgroundMsgHandler(RemoteMessage? message) async {
  if (message?.notification != null) {
    // Show a local notification as a pop-up when the app is in the background
    LocalNotificationService.showNotification(
      title: message?.notification?.title ?? '',
      body: message?.notification?.body ?? '',
    );
  }
}

class FirebaseMessagingService {
  static final firebaseInstance = FirebaseMessaging.instance;
   
  static Future<void> init() async {
    print("Initializing Firebase Messaging");

    // Handle notifications when the app is in the background
    FirebaseMessaging.onBackgroundMessage(_backgroundMsgHandler);

    // Handle notifications when the app is in the foreground
    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      print('Message received in the foreground');
      print('Message data: ${message.data}');

      if (message.notification != null) {
        print('Notification title: ${message.notification!.title}');
        print('Notification body: ${message.notification!.body}');
        
        // Show a local notification as a pop-up
        LocalNotificationService.showNotification(
          title: message.notification!.title,
          body: message.notification!.body,
        );
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
    });

    String? fcmToken = await firebaseInstance.getToken();
    if (fcmToken != null) {
      print("FCM Token: $fcmToken");
    } else {
      print("Failed to get FCM token");
    }

    firebaseInstance.onTokenRefresh.listen((newToken) {
      print("New FCM Token: $newToken");
    });
  }

  // Handle app permissions
  Future<void> grantAppPermission() async {
    NotificationSettings settings = await firebaseInstance.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('User granted permission');
    } else if (settings.authorizationStatus == AuthorizationStatus.provisional) {
      print('User granted provisional permission');
    } else {
      print('User declined or has not accepted permission');
    }
  }
}
