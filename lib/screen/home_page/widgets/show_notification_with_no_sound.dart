import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_notification/core/widget/padded_elevated_button.dart';
import 'package:flutter_notification/main.dart';

class ShowNotificationWithNoSound extends StatelessWidget {
  const ShowNotificationWithNoSound({super.key});

  @override
  Widget build(BuildContext context) {
    return PaddedElevatedButton(
      buttonText: 'Show notification with no sound',
      onPressed: () async {
        await _showNotificationWithNoSound();
      },
    );
  }
}

Future<void> _showNotificationWithNoSound() async {
  const AndroidNotificationDetails androidPlatformChannelSpecifics =
      AndroidNotificationDetails(
    'silent channel id',
    'silent channel name',
    channelDescription: 'silent channel description',
    playSound: false,
    styleInformation: DefaultStyleInformation(
      true,
      true,
    ),
  );

  const DarwinNotificationDetails darwinPlatformChannelSpecifics =
      DarwinNotificationDetails(
    presentSound: false,
  );

  const NotificationDetails platformChannelSpecifics = NotificationDetails(
    android: androidPlatformChannelSpecifics,
    iOS: darwinPlatformChannelSpecifics,
    macOS: darwinPlatformChannelSpecifics,
  );

  await flutterLocalNotificationsPlugin.show(
    0,
    '<b>silent</b> title',
    '<b>silent</b> body',
    platformChannelSpecifics,
  );
}
