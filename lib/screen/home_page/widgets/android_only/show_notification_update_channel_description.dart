import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_notification/core/widget/padded_elevated_button.dart';
import 'package:flutter_notification/main.dart';

class ShowNotificationUpdateChannelDescription extends StatelessWidget {
  const ShowNotificationUpdateChannelDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return PaddedElevatedButton(
      buttonText: 'Show plain notification with payload and update '
          'channel description',
      onPressed: () async {
        await _showNotificationUpdateChannelDescription();
      },
    );
  }
}

Future<void> _showNotificationUpdateChannelDescription() async {
  const AndroidNotificationDetails androidPlatformChannelSpecifics =
      AndroidNotificationDetails(
    'your channel id',
    'your channel name',
    channelDescription: 'your updated channel description',
    importance: Importance.max,
    priority: Priority.high,
    channelAction: AndroidNotificationChannelAction.update,
  );

  const NotificationDetails platformChannelSpecifics =
      NotificationDetails(android: androidPlatformChannelSpecifics);

  await flutterLocalNotificationsPlugin.show(
    0,
    'updated notification channel',
    'check settings to see updated channel description',
    platformChannelSpecifics,
    payload: 'item x',
  );
}
