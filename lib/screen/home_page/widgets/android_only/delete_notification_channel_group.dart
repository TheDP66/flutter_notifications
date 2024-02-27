import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_notification/core/widget/padded_elevated_button.dart';
import 'package:flutter_notification/main.dart';

class DeleteNotificationChannelGroup extends StatelessWidget {
  const DeleteNotificationChannelGroup({super.key});

  @override
  Widget build(BuildContext context) {
    return PaddedElevatedButton(
      buttonText: 'Delete notification channel group',
      onPressed: () async {
        await _deleteNotificationChannelGroup(context);
      },
    );
  }
}

Future<void> _deleteNotificationChannelGroup(BuildContext context) async {
  const String channelGroupId = 'your channel group id';

  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.deleteNotificationChannelGroup(
        channelGroupId,
      );

  await showDialog<void>(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      content: const Text('Channel group with id $channelGroupId deleted'),
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
