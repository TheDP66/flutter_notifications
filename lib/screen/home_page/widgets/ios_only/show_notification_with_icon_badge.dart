import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_notification/core/widget/padded_elevated_button.dart';
import 'package:flutter_notification/main.dart';

class ShowNotificationWithIconBadge extends StatelessWidget {
  const ShowNotificationWithIconBadge({super.key});

  @override
  Widget build(BuildContext context) {
    return PaddedElevatedButton(
      buttonText: 'Show notification with icon badge',
      onPressed: () async {
        await _showNotificationWithIconBadge();
      },
    );
  }
}

Future<void> _showNotificationWithIconBadge() async {
  const DarwinNotificationDetails iOSPlatformChannelSpecifics =
      DarwinNotificationDetails(
    badgeNumber: 1,
  );

  const DarwinNotificationDetails macOSPlatformChannelSpecifics =
      DarwinNotificationDetails(
    badgeNumber: 1,
  );

  const NotificationDetails platformChannelSpecifics = NotificationDetails(
    iOS: iOSPlatformChannelSpecifics,
    macOS: macOSPlatformChannelSpecifics,
  );

  await flutterLocalNotificationsPlugin.show(
    0,
    'icon badge title',
    'icon badge body',
    platformChannelSpecifics,
    payload: 'item x',
  );
}
