import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_notification/core/widget/padded_elevated_button.dart';
import 'package:flutter_notification/main.dart';

class ShowInsistentNotification extends StatelessWidget {
  const ShowInsistentNotification({super.key});

  @override
  Widget build(BuildContext context) {
    return PaddedElevatedButton(
      buttonText: 'Show insistent notification',
      onPressed: () async {
        await _showInsistentNotification();
      },
    );
  }
}

Future<void> _showInsistentNotification() async {
  // This value is from: https://developer.android.com/reference/android/app/Notification.html#FLAG_INSISTENT
  const int insistentFlag = 4;

  final AndroidNotificationDetails androidPlatformChannelSpecifics =
      AndroidNotificationDetails(
    'your channel id',
    'your channel name',
    channelDescription: 'your channel description',
    importance: Importance.max,
    priority: Priority.high,
    ticker: 'ticker',
    additionalFlags: Int32List.fromList(
      <int>[insistentFlag],
    ),
  );

  final NotificationDetails platformChannelSpecifics = NotificationDetails(
    android: androidPlatformChannelSpecifics,
  );

  await flutterLocalNotificationsPlugin.show(
    0,
    'insistent title',
    'insistent body',
    platformChannelSpecifics,
    payload: 'item x',
  );
}
