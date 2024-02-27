import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_notification/core/widget/padded_elevated_button.dart';
import 'package:flutter_notification/main.dart';

class CreateNotificationChannel extends StatelessWidget {
  const CreateNotificationChannel({super.key});

  @override
  Widget build(BuildContext context) {
    return PaddedElevatedButton(
      buttonText: 'Create notification channel',
      onPressed: () async {
        await _createNotificationChannel(context);
      },
    );
  }
}

Future<void> _createNotificationChannel(BuildContext context) async {
  const AndroidNotificationChannel androidNotificationChannel =
      AndroidNotificationChannel(
    'your channel id 2',
    'your channel name 2',
    description: 'your channel description 2',
  );

  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(
        androidNotificationChannel,
      );

  await showDialog<void>(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      content: Text('Channel with name ${androidNotificationChannel.name} '
          'created'),
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
