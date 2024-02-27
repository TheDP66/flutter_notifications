import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_notification/core/widget/padded_elevated_button.dart';
import 'package:flutter_notification/main.dart';

class ShowNotificationWithCustomSubText extends StatelessWidget {
  const ShowNotificationWithCustomSubText({super.key});

  @override
  Widget build(BuildContext context) {
    return PaddedElevatedButton(
      buttonText: 'Show notification with custom sub-text',
      onPressed: () async {
        await _showNotificationWithCustomSubText();
      },
    );
  }
}

Future<void> _showNotificationWithCustomSubText() async {
  const AndroidNotificationDetails androidPlatformChannelSpecifics =
      AndroidNotificationDetails(
    'your channel id',
    'your channel name',
    channelDescription: 'your channel description',
    importance: Importance.max,
    priority: Priority.high,
    showWhen: false,
    subText: 'custom subtext',
  );

  const NotificationDetails platformChannelSpecifics = NotificationDetails(
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
