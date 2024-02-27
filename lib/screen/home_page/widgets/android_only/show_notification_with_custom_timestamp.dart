import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_notification/core/widget/padded_elevated_button.dart';
import 'package:flutter_notification/main.dart';

class ShowNotificationWithCustomTimestamp extends StatelessWidget {
  const ShowNotificationWithCustomTimestamp({super.key});

  @override
  Widget build(BuildContext context) {
    return PaddedElevatedButton(
      buttonText: 'Show notification with custom timestamp',
      onPressed: () async {
        await _showNotificationWithCustomTimestamp();
      },
    );
  }
}

Future<void> _showNotificationWithCustomTimestamp() async {
  final AndroidNotificationDetails androidPlatformChannelSpecifics =
      AndroidNotificationDetails(
    'your channel id',
    'your channel name',
    channelDescription: 'your channel description',
    importance: Importance.max,
    priority: Priority.high,
    when: DateTime.now().millisecondsSinceEpoch - 120 * 1000,
  );

  final NotificationDetails platformChannelSpecifics = NotificationDetails(
    android: androidPlatformChannelSpecifics,
  );

  await flutterLocalNotificationsPlugin.show(
    0,
    'plain title',
    'plain body',
    platformChannelSpecifics,
    payload: 'item x',
  );
}
