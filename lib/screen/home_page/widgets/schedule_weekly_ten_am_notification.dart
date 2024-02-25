import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_notification/core/widget/padded_elevated_button.dart';
import 'package:flutter_notification/main.dart';
import 'package:flutter_notification/util/date.dart';

class ScheduleWeeklyTenAMNotification extends StatelessWidget {
  const ScheduleWeeklyTenAMNotification({super.key});

  @override
  Widget build(BuildContext context) {
    return PaddedElevatedButton(
      buttonText: 'Schedule weekly 10:00:00 am notification in your '
          'local time zone',
      onPressed: () async {
        await _scheduleWeeklyTenAMNotification();
      },
    );
  }
}

Future<void> _scheduleWeeklyTenAMNotification() async {
  await flutterLocalNotificationsPlugin.zonedSchedule(
    0,
    'weekly scheduled notification title',
    'weekly scheduled notification body',
    nextInstanceOfTenAM(),
    const NotificationDetails(
      android: AndroidNotificationDetails(
        'weekly notification channel id',
        'weekly notification channel name',
        channelDescription: 'weekly notificationdescription',
      ),
    ),
    androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
    uiLocalNotificationDateInterpretation:
        UILocalNotificationDateInterpretation.absoluteTime,
    matchDateTimeComponents: DateTimeComponents.dayOfWeekAndTime,
  );
}
