import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_notification/core/widget/padded_elevated_button.dart';
import 'package:flutter_notification/main.dart';

class ShowNotificationsWithThreadIdentifier extends StatelessWidget {
  const ShowNotificationsWithThreadIdentifier({super.key});

  @override
  Widget build(BuildContext context) {
    return PaddedElevatedButton(
      buttonText: 'Show notifications with thread identifier',
      onPressed: () async {
        await _showNotificationsWithThreadIdentifier();
      },
    );
  }
}

Future<void> _showNotificationsWithThreadIdentifier() async {
  NotificationDetails buildNotificationDetailsForThread(
    String threadIdentifier,
  ) {
    final DarwinNotificationDetails iOSPlatformChannelSpecifics =
        DarwinNotificationDetails(
      threadIdentifier: threadIdentifier,
    );
    final DarwinNotificationDetails macOSPlatformChannelSpecifics =
        DarwinNotificationDetails(
      threadIdentifier: threadIdentifier,
    );
    return NotificationDetails(
      iOS: iOSPlatformChannelSpecifics,
      macOS: macOSPlatformChannelSpecifics,
    );
  }

  final NotificationDetails thread1PlatformChannelSpecifics =
      buildNotificationDetailsForThread(
    'thread1',
  );
  final NotificationDetails thread2PlatformChannelSpecifics =
      buildNotificationDetailsForThread(
    'thread2',
  );

  await flutterLocalNotificationsPlugin.show(
    0,
    'thread 1',
    'first notification',
    thread1PlatformChannelSpecifics,
  );
  await flutterLocalNotificationsPlugin.show(
    1,
    'thread 1',
    'second notification',
    thread1PlatformChannelSpecifics,
  );
  await flutterLocalNotificationsPlugin.show(
    2,
    'thread 1',
    'third notification',
    thread1PlatformChannelSpecifics,
  );

  await flutterLocalNotificationsPlugin.show(
    3,
    'thread 2',
    'first notification',
    thread2PlatformChannelSpecifics,
  );
  await flutterLocalNotificationsPlugin.show(
    4,
    'thread 2',
    'second notification',
    thread2PlatformChannelSpecifics,
  );
  await flutterLocalNotificationsPlugin.show(
    5,
    'thread 2',
    'third notification',
    thread2PlatformChannelSpecifics,
  );
}
