import 'dart:io';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotificationService {
  static final FlutterLocalNotificationsPlugin
      _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  static void initialize(BuildContext context) {
    InitializationSettings initializationSettings = InitializationSettings(
        android: const AndroidInitializationSettings('@mipmap/ic_launcher'),
        iOS: IOSInitializationSettings(
            requestSoundPermission: true,
            requestBadgePermission: true,
            requestAlertPermission: true,
            onDidReceiveLocalNotification: (int? id, String? title,
                String? body, String? payload) async {}));
    _flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: (String? route) async {});
  }

  static void display(RemoteMessage message) {
    if (Platform.isIOS) {
      final NotificationDetails _details = NotificationDetails(
          iOS: message.data['sound'] == null
              ? const IOSNotificationDetails(
                  presentAlert: true,
                  presentSound: true,
                  presentBadge: true,
                )
              : IOSNotificationDetails(
                  presentAlert: true,
                  presentSound: true,
                  presentBadge: true,
                  sound: '${message.data['sound']}.wav',
                ),
          android: const AndroidNotificationDetails(
            "easyApproach",
            "easyApproach channel",
            importance: Importance.max,
            playSound: true,
            priority: Priority.high,
          ));
      final id = DateTime.now().millisecondsSinceEpoch ~/ 1000;
      _flutterLocalNotificationsPlugin.show(
          id, message.notification!.title, message.notification!.body, _details,
          payload: message.data['routeApp']);
    } else {
      final NotificationDetails _details = NotificationDetails(
          iOS: const IOSNotificationDetails(),
          android: message.notification!.android!.sound == null
              ? const AndroidNotificationDetails(
                  "easyApproach",
                  "easyApproach channel",
                  importance: Importance.max,
                  playSound: true,
                  priority: Priority.high,
                  sound: RawResourceAndroidNotificationSound("ring_ring"),
                )
              : const AndroidNotificationDetails(
                  "easyApproach",
                  "easyApproach channel",
                  importance: Importance.max,
                  playSound: true,
                  sound: RawResourceAndroidNotificationSound("ring_ring"),
                  priority: Priority.high,
                ));
      final id = DateTime.now().millisecondsSinceEpoch ~/ 1000;
      _flutterLocalNotificationsPlugin.show(
          id, message.notification!.title, message.notification!.body, _details,
          payload: message.data['routeApp']);
    }
  }

  static cancelAllNotifications() {
    _flutterLocalNotificationsPlugin.cancelAll();
  }
}
