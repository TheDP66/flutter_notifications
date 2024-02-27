import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_notification/core/widget/padded_elevated_button.dart';
import 'package:flutter_notification/main.dart';

class ShowTimeoutNotification extends StatelessWidget {
  const ShowTimeoutNotification({super.key});

  @override
  Widget build(BuildContext context) {
    return PaddedElevatedButton(
      buttonText: 'Show notification that times out after 3 seconds',
      onPressed: () async {
        await _showTimeoutNotification();
      },
    );
  }
}

Future<void> _showTimeoutNotification() async {
  const AndroidNotificationDetails androidPlatformChannelSpecifics =
      AndroidNotificationDetails(
    'silent channel id',
    'silent channel name',
    channelDescription: 'silent channel description',
    timeoutAfter: 3000,
    styleInformation: DefaultStyleInformation(true, true),
  );

  const NotificationDetails platformChannelSpecifics = NotificationDetails(
    android: androidPlatformChannelSpecifics,
  );

  await flutterLocalNotificationsPlugin.show(
    0,
    'timeout notification',
    'Times out after 3 seconds',
    platformChannelSpecifics,
  );
}
