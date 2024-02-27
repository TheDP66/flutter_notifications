import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_notification/core/widget/padded_elevated_button.dart';
import 'package:flutter_notification/main.dart';

class ShowOngoingNotificationWithNoBadge extends StatelessWidget {
  const ShowOngoingNotificationWithNoBadge({super.key});

  @override
  Widget build(BuildContext context) {
    return PaddedElevatedButton(
      buttonText: 'Show notification with no badge, alert only once',
      onPressed: () async {
        await _showNotificationWithNoBadge();
      },
    );
  }
}

Future<void> _showNotificationWithNoBadge() async {
  const AndroidNotificationDetails androidPlatformChannelSpecifics =
      AndroidNotificationDetails(
    'no badge channel',
    'no badge name',
    channelDescription: 'no badge description',
    channelShowBadge: false,
    importance: Importance.max,
    priority: Priority.high,
    onlyAlertOnce: true,
  );

  const NotificationDetails platformChannelSpecifics = NotificationDetails(
    android: androidPlatformChannelSpecifics,
  );

  await flutterLocalNotificationsPlugin.show(
    0,
    'no badge title',
    'no badge body',
    platformChannelSpecifics,
    payload: 'item x',
  );
}
