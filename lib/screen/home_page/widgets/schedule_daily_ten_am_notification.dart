import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_notification/core/widget/padded_elevated_button.dart';
import 'package:flutter_notification/main.dart';
import 'package:flutter_notification/util/date.dart';

class ScheduleDailyTenAMNotification extends StatelessWidget {
  const ScheduleDailyTenAMNotification({super.key});

  @override
  Widget build(BuildContext context) {
    return PaddedElevatedButton(
      buttonText: 'Schedule daily 10:00:00 am notification in your '
          'local time zone',
      onPressed: () async {
        await _scheduleDailyTenAMNotification();
      },
    );
  }
}

Future<void> _scheduleDailyTenAMNotification() async {
  await flutterLocalNotificationsPlugin.zonedSchedule(
    0,
    'daily scheduled notification title',
    'daily scheduled notification body',
    nextInstanceOfTenAM(),
    const NotificationDetails(
      android: AndroidNotificationDetails(
        'daily notification channel id',
        'daily notification channel name',
        channelDescription: 'daily notification description',
      ),
    ),
    androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
    uiLocalNotificationDateInterpretation:
        UILocalNotificationDateInterpretation.absoluteTime,
    matchDateTimeComponents: DateTimeComponents.time,
  );
}
