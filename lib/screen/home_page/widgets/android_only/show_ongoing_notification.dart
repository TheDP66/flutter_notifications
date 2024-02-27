import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_notification/core/widget/padded_elevated_button.dart';
import 'package:flutter_notification/main.dart';

class ShowOngoingNotification extends StatelessWidget {
  const ShowOngoingNotification({super.key});

  @override
  Widget build(BuildContext context) {
    return PaddedElevatedButton(
      buttonText: 'Show ongoing notification',
      onPressed: () async {
        await _showOngoingNotification();
      },
    );
  }
}

Future<void> _showOngoingNotification() async {
  const AndroidNotificationDetails androidPlatformChannelSpecifics =
      AndroidNotificationDetails(
    'your channel id',
    'your channel name',
    channelDescription: 'your channel description',
    importance: Importance.max,
    priority: Priority.high,
    ongoing: true,
    autoCancel: false,
  );

  const NotificationDetails platformChannelSpecifics = NotificationDetails(
    android: androidPlatformChannelSpecifics,
  );

  await flutterLocalNotificationsPlugin.show(
    0,
    'ongoing notification title',
    'ongoing notification body',
    platformChannelSpecifics,
  );
}
