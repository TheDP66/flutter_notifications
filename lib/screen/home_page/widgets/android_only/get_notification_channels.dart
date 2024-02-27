import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_notification/core/widget/padded_elevated_button.dart';
import 'package:flutter_notification/main.dart';

class GetNotificationChannels extends StatelessWidget {
  const GetNotificationChannels({super.key});

  @override
  Widget build(BuildContext context) {
    return PaddedElevatedButton(
      buttonText: 'Get notification channels',
      onPressed: () async {
        await _getNotificationChannels(context);
      },
    );
  }
}

Future<void> _getNotificationChannels(BuildContext context) async {
  final Widget notificationChannelsDialogContent =
      await _getNotificationChannelsDialogContent();
  await showDialog<void>(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      content: notificationChannelsDialogContent,
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

Future<Widget> _getNotificationChannelsDialogContent() async {
  try {
    final List<AndroidNotificationChannel>? channels =
        await flutterLocalNotificationsPlugin
            .resolvePlatformSpecificImplementation<
                AndroidFlutterLocalNotificationsPlugin>()!
            .getNotificationChannels();

    return Container(
      width: double.maxFinite,
      child: ListView(
        children: <Widget>[
          const Text(
            'Notifications Channels',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const Divider(color: Colors.black),
          if (channels?.isEmpty ?? true)
            const Text('No notification channels')
          else
            for (AndroidNotificationChannel channel in channels!)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('id: ${channel.id}\n'
                      'name: ${channel.name}\n'
                      'description: ${channel.description}\n'
                      'groupId: ${channel.groupId}\n'
                      'importance: ${channel.importance.value}\n'
                      'playSound: ${channel.playSound}\n'
                      'sound: ${channel.sound?.sound}\n'
                      'enableVibration: ${channel.enableVibration}\n'
                      'vibrationPattern: ${channel.vibrationPattern}\n'
                      'showBadge: ${channel.showBadge}\n'
                      'enableLights: ${channel.enableLights}\n'
                      'ledColor: ${channel.ledColor}\n'),
                  const Divider(color: Colors.black),
                ],
              ),
        ],
      ),
    );
  } on PlatformException catch (error) {
    return Text(
      'Error calling "getNotificationChannels"\n'
      'code: ${error.code}\n'
      'message: ${error.message}',
    );
  }
}
