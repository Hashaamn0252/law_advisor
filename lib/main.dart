import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:lawyer_consultant_for_lawyers/src/config/app_configs.dart';
import 'package:lawyer_consultant_for_lawyers/src/controllers/general_controller.dart';
import 'package:pusher_beams/pusher_beams.dart';
import 'package:resize/resize.dart';

import 'src/api_services/get_service.dart';
import 'src/api_services/logic.dart';
import 'src/api_services/urls.dart';
import 'src/controllers/all_settings_controller.dart';
import 'src/controllers/logged_in_user_controller.dart';
import 'src/controllers/pusher_beams_controller.dart';
import 'src/repositories/all_settings_repo.dart';
import 'src/routes.dart';
import 'src/screens/agora_call/agora_logic.dart';

const AndroidNotificationChannel channel = AndroidNotificationChannel(
    'private-make-agora-call', // id
    'High Importance Notifications', // title
    // 'This channel is used for important notifications.', // description
    importance: Importance.high,
    playSound: true);

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print('A bg message just showed up :  ${message.messageId}');
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MainApp());
  Get.put(GeneralController());
  Get.put(GetAllSettingsController());
  Get.put(AgoraLogic());
  Get.put(ApiController());
  Get.put(LoggedInUserController());
  Get.put(PusherBeamsController());
  PusherBeams.instance.start("41feeeff-28a1-4aca-8e1f-367d292906ec");
  //-----load-configurations-from-local-json
  try {
    await GlobalConfiguration().loadFromUrl(getAllSettingUrl);
    log("Working");
  } catch (e) {
    log("Error");
    // something went wrong while fetching the config from the url ... do something
  }

  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );

  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    RemoteNotification? notification = message.notification;
    AndroidNotification? android = message.notification?.android;

    if (notification != null && android != null) {
      flutterLocalNotificationsPlugin.show(
        notification.hashCode,
        notification.title,
        notification.body,
        NotificationDetails(
          android: AndroidNotificationDetails(channel.id, channel.name,
              importance: Importance.high,
              priority: Priority.high,
              playSound: true,
              icon: '@mipmap/ic_launcher'),
        ),
      );
    }
  });
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Resize(
      allowtextScaling: true,
      size: const Size(375, 812),
      builder: () {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Legal Care - Lawyer',
          initialBinding: BindingsBuilder(() {
            // Get All Settings
            getMethod(
                context, getAllSettingUrl, null, true, getAllSettingsRepo);
          }),
          theme: ThemeData(),
          initialRoute: PageRoutes.splashScreen,
          getPages: appRoutes(),
        );
      },
    );
  }
}
