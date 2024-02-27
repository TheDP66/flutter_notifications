import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_notification/core/widget/padded_elevated_button.dart';
import 'package:flutter_notification/main.dart';

class ShowNotificationWithSubtitle extends StatelessWidget {
  const ShowNotificationWithSubtitle({super.key});

  @override
  Widget build(BuildContext context) {
    return PaddedElevatedButton(
      buttonText: 'Show notification with subtitle',
      onPressed: () async {
        await _showNotificationWithSubtitle();
      },
    );
  }
}

Future<void> _showNotificationWithSubtitle() async {
  const DarwinNotificationDetails iOSPlatformChannelSpecifics =
      DarwinNotificationDetails(
    subtitle: 'the subtitle',
  );

  const DarwinNotificationDetails macOSPlatformChannelSpecifics =
      DarwinNotificationDetails(
    subtitle: 'the subtitle',
  );

  const NotificationDetails platformChannelSpecifics = NotificationDetails(
    iOS: iOSPlatformChannelSpecifics,
    macOS: macOSPlatformChannelSpecifics,
  );

  await flutterLocalNotificationsPlugin.show(
    0,
    'title of notification with a subtitle',
    'body of notification with a subtitle',
    platformChannelSpecifics,
    payload: 'item x',
  );
}
