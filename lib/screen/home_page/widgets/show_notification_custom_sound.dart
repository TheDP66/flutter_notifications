import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_notification/core/widget/padded_elevated_button.dart';
import 'package:flutter_notification/main.dart';

class ShowNotificationCustomSound extends StatelessWidget {
  const ShowNotificationCustomSound({super.key});

  @override
  Widget build(BuildContext context) {
    return PaddedElevatedButton(
      buttonText: 'Show notification with custom sound',
      onPressed: () async {
        await _showNotificationCustomSound();
      },
    );
  }
}

Future<void> _showNotificationCustomSound() async {
  const AndroidNotificationDetails androidPlatformChannelSpecifics =
      AndroidNotificationDetails(
    'your other channel id',
    'your other channel name',
    channelDescription: 'your other channel description',
    sound: RawResourceAndroidNotificationSound('slow_spring_board'),
  );

  const DarwinNotificationDetails iOSPlatformChannelSpecifics =
      DarwinNotificationDetails(sound: 'slow_spring_board.aiff');

  const DarwinNotificationDetails macOSPlatformChannelSpecifics =
      DarwinNotificationDetails(sound: 'slow_spring_board.aiff');

  const NotificationDetails platformChannelSpecifics = NotificationDetails(
    android: androidPlatformChannelSpecifics,
    iOS: iOSPlatformChannelSpecifics,
    macOS: macOSPlatformChannelSpecifics,
  );

  await flutterLocalNotificationsPlugin.show(
    0,
    'custom sound notification title',
    'custom sound notification body',
    platformChannelSpecifics,
  );
}
