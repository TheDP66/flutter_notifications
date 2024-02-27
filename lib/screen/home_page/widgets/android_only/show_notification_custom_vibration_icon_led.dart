import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_notification/core/widget/padded_elevated_button.dart';
import 'package:flutter_notification/main.dart';

class ShowNotificationCustomVibrationIconLed extends StatelessWidget {
  const ShowNotificationCustomVibrationIconLed({super.key});

  @override
  Widget build(BuildContext context) {
    return PaddedElevatedButton(
      buttonText: 'Show notification with custom vibration pattern, '
          'red LED and red icon',
      onPressed: () async {
        await _showNotificationCustomVibrationIconLed();
      },
    );
  }
}

Future<void> _showNotificationCustomVibrationIconLed() async {
  final Int64List vibrationPattern = Int64List(4);
  vibrationPattern[0] = 0;
  vibrationPattern[1] = 1000;
  vibrationPattern[2] = 5000;
  vibrationPattern[3] = 2000;

  final AndroidNotificationDetails androidPlatformChannelSpecifics =
      AndroidNotificationDetails(
    'other custom channel id',
    'other custom channel name',
    channelDescription: 'other custom channel description',
    icon: 'secondary_icon',
    largeIcon: const DrawableResourceAndroidBitmap('sample_large_icon'),
    vibrationPattern: vibrationPattern,
    enableLights: true,
    color: const Color.fromARGB(255, 255, 0, 0),
    ledColor: const Color.fromARGB(255, 255, 0, 0),
    ledOnMs: 1000,
    ledOffMs: 500,
  );

  final NotificationDetails platformChannelSpecifics =
      NotificationDetails(android: androidPlatformChannelSpecifics);

  await flutterLocalNotificationsPlugin.show(
    0,
    'title of notification with custom vibration pattern, LED and icon',
    'body of notification with custom vibration pattern, LED and icon',
    platformChannelSpecifics,
  );
}
