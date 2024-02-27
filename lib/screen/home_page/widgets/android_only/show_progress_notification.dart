import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_notification/core/widget/padded_elevated_button.dart';
import 'package:flutter_notification/main.dart';

class ShowProgressNotification extends StatelessWidget {
  const ShowProgressNotification({super.key});

  @override
  Widget build(BuildContext context) {
    return PaddedElevatedButton(
      buttonText: 'Show progress notification - updates every second',
      onPressed: () async {
        await _showProgressNotification();
      },
    );
  }
}

Future<void> _showProgressNotification() async {
  const int maxProgress = 5;

  for (int i = 0; i <= maxProgress; i++) {
    await Future<void>.delayed(
      const Duration(seconds: 1),
      () async {
        final AndroidNotificationDetails androidPlatformChannelSpecifics =
            AndroidNotificationDetails(
          'progress channel',
          'progress channel',
          channelDescription: 'progress channel description',
          channelShowBadge: false,
          importance: Importance.max,
          priority: Priority.high,
          onlyAlertOnce: true,
          showProgress: true,
          maxProgress: maxProgress,
          progress: i,
        );

        final NotificationDetails platformChannelSpecifics =
            NotificationDetails(
          android: androidPlatformChannelSpecifics,
        );

        await flutterLocalNotificationsPlugin.show(
          0,
          'progress notification title',
          'progress notification body',
          platformChannelSpecifics,
          payload: 'item x',
        );
      },
    );
  }
}
