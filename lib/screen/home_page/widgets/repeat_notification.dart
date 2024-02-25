import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_notification/core/widget/padded_elevated_button.dart';
import 'package:flutter_notification/main.dart';

class RepeatNotification extends StatelessWidget {
  const RepeatNotification({super.key});

  @override
  Widget build(BuildContext context) {
    return PaddedElevatedButton(
      buttonText: 'Repeat notification every minute',
      onPressed: () async {
        await _repeatNotification();
      },
    );
  }
}

Future<void> _repeatNotification() async {
  const AndroidNotificationDetails androidPlatformChannelSpecifics =
      AndroidNotificationDetails(
    'repeating channel id',
    'repeating channel name',
    channelDescription: 'repeating description',
  );

  const NotificationDetails platformChannelSpecifics = NotificationDetails(
    android: androidPlatformChannelSpecifics,
  );

  await flutterLocalNotificationsPlugin.periodicallyShow(
    0,
    'repeating title',
    'repeating body',
    RepeatInterval.everyMinute,
    platformChannelSpecifics,
    androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
  );
}
