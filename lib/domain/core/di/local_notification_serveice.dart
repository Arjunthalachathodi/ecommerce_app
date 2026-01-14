import 'package:ecommerce_app/application/core/utils/logger.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotification {
  static final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  static bool isFlutterLocalNotificationsInitialized = false;
  static int _notificationId = 0;

  static const AndroidNotificationChannel _channel = AndroidNotificationChannel(
    'high_importance_channel', 
    'High Importance Notifications', 
    importance: Importance.high,
  );


  LocalNotification._();


  static final LocalNotification _instance = LocalNotification._();

  factory LocalNotification() {
    return _instance;
  }

  static Future<LocalNotification> init() async {
    if (isFlutterLocalNotificationsInitialized) {
      return LocalNotification();
    }

    try {
      await flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin>()
          ?.createNotificationChannel(_channel);

      const AndroidInitializationSettings initializationSettingsAndroid =
          AndroidInitializationSettings('@mipmap/ic_launcher');

      const DarwinInitializationSettings initializationSettingsIOS =
          DarwinInitializationSettings(
        requestAlertPermission: true,
        requestBadgePermission: true,
        requestSoundPermission: true,

      );

      const InitializationSettings initializationSettings =
          InitializationSettings(
        android: initializationSettingsAndroid,
        iOS: initializationSettingsIOS,
      );

      await flutterLocalNotificationsPlugin.initialize(initializationSettings);
      isFlutterLocalNotificationsInitialized = true;
    } catch (e) {

      Logger.logError('Error initializing notifications: $e');
    }

    return LocalNotification();
  }

  static void onDidReceiveLocalNotification(
    int id,
    String? title,
    String? body,
    String? payload,
  ) {

  }

  static Future<void> showNotification({
    required String title,
    required String body,
  }) async {
    const AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
      'simple-notification',
      'Simple Notification',
      importance: Importance.max,
      priority: Priority.high,
      ticker: 'ticker',
    );

    const NotificationDetails notificationDetails =
        NotificationDetails(android: androidNotificationDetails);

    try {
      await flutterLocalNotificationsPlugin.show(
        _notificationId++,
        title,
        body,
        notificationDetails,
      );
    } catch (e) {

      Logger.logError('Error showing notification: $e');
    }
  }


  static Future<void> showProgressNotification({
    required String title,
    required String body,
    required int progress,
    required int total,
  }) async {
    AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
            'download_progress_channel', 
            'Download Progress Notifications',
            importance: Importance.max,
            priority: Priority.high,
            showProgress: true,
            maxProgress: total,
            channelDescription: 'Notifications for download progress',
            progress: progress);

    final NotificationDetails notificationDetails =
        NotificationDetails(android: androidNotificationDetails);

    try {
      await flutterLocalNotificationsPlugin.show(
        _notificationId,
        title,
        body,
        notificationDetails,
        payload: 'progress_payload',
      );


      await flutterLocalNotificationsPlugin.show(
        _notificationId,
        title,
        body,
        notificationDetails,
      );
    } catch (e) {

      Logger.logError('Error showing progress notification: $e');
    }
  }
}
