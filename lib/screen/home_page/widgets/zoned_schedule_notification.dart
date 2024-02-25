import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_notification/core/widget/padded_elevated_button.dart';
import 'package:flutter_notification/main.dart';
import 'package:timezone/timezone.dart' as tz;

class ZonedScheduleNotification extends StatelessWidget {
  const ZonedScheduleNotification({super.key});

  @override
  Widget build(BuildContext context) {
    return PaddedElevatedButton(
      buttonText: 'Schedule notification to appear in 5 seconds based '
          'on local time zone',
      onPressed: () async {
        await _zonedScheduleNotification();
      },
    );
  }
}

Future<void> _zonedScheduleNotification() async {
  await flutterLocalNotificationsPlugin.zonedSchedule(
    0,
    'scheduled title',
    'scheduled body',
    tz.TZDateTime.now(tz.local).add(
      const Duration(seconds: 5),
    ),
    const NotificationDetails(
      android: AndroidNotificationDetails(
        'your channel id',
        'your channel name',
        channelDescription: 'your channel description',
      ),
    ),
    androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
    uiLocalNotificationDateInterpretation:
        UILocalNotificationDateInterpretation.absoluteTime,
  );
}
