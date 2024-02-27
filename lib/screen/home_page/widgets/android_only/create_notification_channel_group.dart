import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_notification/core/widget/padded_elevated_button.dart';
import 'package:flutter_notification/main.dart';

class CreateNotificationChannelGroup extends StatelessWidget {
  const CreateNotificationChannelGroup({super.key});

  @override
  Widget build(BuildContext context) {
    return PaddedElevatedButton(
      buttonText: 'Create grouped notification channels',
      onPressed: () async {
        await _createNotificationChannelGroup(context);
      },
    );
  }
}

Future<void> _createNotificationChannelGroup(BuildContext context) async {
  const String channelGroupId = 'your channel group id';

  // create the group first
  const AndroidNotificationChannelGroup androidNotificationChannelGroup =
      AndroidNotificationChannelGroup(
    channelGroupId,
    'your channel group name',
    description: 'your channel group description',
  );

  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()!
      .createNotificationChannelGroup(
        androidNotificationChannelGroup,
      );

  // create channels associated with the group
  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()!
      .createNotificationChannel(
        const AndroidNotificationChannel(
          'grouped channel id 1',
          'grouped channel name 1',
          description: 'grouped channel description 1',
          groupId: channelGroupId,
        ),
      );

  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()!
      .createNotificationChannel(
        const AndroidNotificationChannel(
          'grouped channel id 2',
          'grouped channel name 2',
          description: 'grouped channel description 2',
          groupId: channelGroupId,
        ),
      );

  await showDialog<void>(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      content: Text(
        'Channel group with name '
        '${androidNotificationChannelGroup.name} created',
      ),
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
