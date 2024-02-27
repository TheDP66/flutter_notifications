import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_notification/core/widget/padded_elevated_button.dart';
import 'package:flutter_notification/main.dart';

class DeleteNotificationChannel extends StatelessWidget {
  const DeleteNotificationChannel({super.key});

  @override
  Widget build(BuildContext context) {
    return PaddedElevatedButton(
      buttonText: 'Delete notification channel',
      onPressed: () async {
        await _deleteNotificationChannel(context);
      },
    );
  }
}

Future<void> _deleteNotificationChannel(BuildContext context) async {
  const String channelId = 'your channel id 2';
  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.deleteNotificationChannel(
        channelId,
      );

  await showDialog<void>(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      content: const Text('Channel with id $channelId deleted'),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('OK'),
        ),
      ],
    ),
  );
}
