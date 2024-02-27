import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_notification/core/widget/padded_elevated_button.dart';
import 'package:flutter_notification/main.dart';

class ShowIndeterminateProgressNotification extends StatelessWidget {
  const ShowIndeterminateProgressNotification({super.key});

  @override
  Widget build(BuildContext context) {
    return PaddedElevatedButton(
      buttonText: 'Show indeterminate progress notification',
      onPressed: () async {
        await _showIndeterminateProgressNotification();
      },
    );
  }
}

Future<void> _showIndeterminateProgressNotification() async {
  const AndroidNotificationDetails androidPlatformChannelSpecifics =
      AndroidNotificationDetails(
    'indeterminate progress channel',
    'indeterminate progress channel',
    channelDescription: 'indeterminate progress channel description',
    channelShowBadge: false,
    importance: Importance.max,
    priority: Priority.high,
    onlyAlertOnce: true,
    showProgress: true,
    indeterminate: true,
  );

  const NotificationDetails platformChannelSpecifics = NotificationDetails(
    android: androidPlatformChannelSpecifics,
  );

  await flutterLocalNotificationsPlugin.show(
    0,
    'indeterminate progress notification title',
    'indeterminate progress notification body',
    platformChannelSpecifics,
    payload: 'item x',
  );
}
