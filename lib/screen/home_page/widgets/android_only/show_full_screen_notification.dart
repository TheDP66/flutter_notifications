import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_notification/core/widget/padded_elevated_button.dart';
import 'package:flutter_notification/main.dart';
import 'package:timezone/timezone.dart' as tz;

class ShowFullScreenNotification extends StatelessWidget {
  const ShowFullScreenNotification({super.key});

  @override
  Widget build(BuildContext context) {
    return PaddedElevatedButton(
      buttonText: 'Show full-screen notification',
      onPressed: () async {
        await _showFullScreenNotification(context);
      },
    );
  }
}

Future<void> _showFullScreenNotification(BuildContext context) async {
  await showDialog(
    context: context,
    builder: (_) => AlertDialog(
      title: const Text('Turn off your screen'),
      content: const Text(
          'to see the full-screen intent in 5 seconds, press OK and TURN '
          'OFF your screen'),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () async {
            await flutterLocalNotificationsPlugin.zonedSchedule(
              0,
              'scheduled title',
              'scheduled body',
              tz.TZDateTime.now(tz.local).add(
                const Duration(seconds: 5),
              ),
              const NotificationDetails(
                  android: AndroidNotificationDetails(
                      'full screen channel id', 'full screen channel name',
                      channelDescription: 'full screen channel description',
                      priority: Priority.high,
                      importance: Importance.high,
                      fullScreenIntent: true)),
              androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
              uiLocalNotificationDateInterpretation:
                  UILocalNotificationDateInterpretation.absoluteTime,
            );

            Navigator.pop(context);
          },
          child: const Text('OK'),
        )
      ],
    ),
  );
}
