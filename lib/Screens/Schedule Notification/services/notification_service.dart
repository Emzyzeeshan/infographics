import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:integraphics/main.dart';

import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

import '../details_page.dart';

class NotificationService {
  // Singleton pattern
  static final NotificationService _notificationService =
      NotificationService._internal();
  factory NotificationService() {
    return _notificationService;
  }

  NotificationService._internal();

  static const channelId = "1";

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static final AndroidNotificationDetails _androidNotificationDetails =
      AndroidNotificationDetails(
    channelId,
    "Pilog",
    channelDescription:
        "This channel is responsible for all the local notifications",
    playSound: true,
    priority: Priority.high,
    importance: Importance.high,
  );

  // final NotificationDetails notificationDetails = NotificationDetails(
  //   android: _androidNotificationDetails,
  // );

  Future<void> init() async {
    final android = AndroidInitializationSettings('mipmap/ic_launcher');
    final initSettings = InitializationSettings(android: android);

    await flutterLocalNotificationsPlugin.initialize(initSettings,
        onDidReceiveNotificationResponse: onSelectNotification);

    // *** Initialize timezone here ***
    tz.initializeTimeZones();

    // await flutterLocalNotificationsPlugin.initialize(
    //   initSettings,
    //   onDidReceiveNotificationResponse: onSelectNotification,
    // );
  }

  Future<void> requestIOSPermissions() async {
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
          alert: true,
          badge: true,
          sound: true,
        );
  }

  Future<void> showNotification(
      int id, String title, String body, String payload) async {
    final android = AndroidNotificationDetails('channel id', 'channel name',
        icon: 'smartlogo', priority: Priority.high, importance: Importance.max);

    final platform = NotificationDetails(android: android);
    await flutterLocalNotificationsPlugin.show(
      id,
      title,
      body,
      platform,
      payload: payload,
    );
  }

  Future<void> scheduleNotification(int id, String title, String body,
      DateTime eventDate, TimeOfDay eventTime, String payload,
      [DateTimeComponents? dateTimeComponents]) async {
    final android = AndroidNotificationDetails('channel id', 'channel name',
        icon: 'smartlogo', priority: Priority.high, importance: Importance.max);

    final platform = NotificationDetails(android: android);
    final scheduledTime = eventDate.add(Duration(
      hours: eventTime.hour,
      minutes: eventTime.minute,
    ));
    await flutterLocalNotificationsPlugin.zonedSchedule(
      id,
      title,
      body,
      tz.TZDateTime.from(scheduledTime, tz.local),
      platform,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      androidAllowWhileIdle: true,
      payload: payload,
      matchDateTimeComponents: dateTimeComponents,
    );
  }

  Future<void> cancelNotification(int id) async {
    await flutterLocalNotificationsPlugin.cancel(id);
  }

  Future<void> cancelAllNotifications() async {
    await flutterLocalNotificationsPlugin.cancelAll();
  }
}

Future<void> onSelectNotification(NotificationResponse? payload) async {
  // var details = await NotificationService()
  //     .flutterLocalNotificationsPlugin
  //     .getNotificationAppLaunchDetails();
  // if (details!.didNotificationLaunchApp) {
  //   print(details.notificationResponse);
  // }
  await Get.to(DetailsPage(payload: payload!.payload));
}
