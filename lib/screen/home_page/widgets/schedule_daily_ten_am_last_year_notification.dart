import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_notification/core/widget/padded_elevated_button.dart';
import 'package:flutter_notification/main.dart';
import 'package:flutter_notification/util/date.dart';

class ScheduleDailyTenAMLastYearNotification extends StatelessWidget {
  const ScheduleDailyTenAMLastYearNotification({super.key});

  @override
  Widget build(BuildContext context) {
    return PaddedElevatedButton(
      buttonText: 'Schedule daily 10:00:00 am notification in your '
          "local time zone using last year's date",
      onPressed: () async {
        await _scheduleDailyTenAMLastYearNotification();
      },
    );
  }
}

Future<void> _scheduleDailyTenAMLastYearNotification() async {
  await flutterLocalNotificationsPlugin.zonedSchedule(
    0,
    'daily scheduled notification title',
    'daily scheduled notification body',
    nextInstanceOfTenAMLastYear(),
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
