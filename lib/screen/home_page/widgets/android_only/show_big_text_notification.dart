import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_notification/core/widget/padded_elevated_button.dart';
import 'package:flutter_notification/main.dart';

class ShowBigTextNotification extends StatelessWidget {
  const ShowBigTextNotification({super.key});

  @override
  Widget build(BuildContext context) {
    return PaddedElevatedButton(
      buttonText: 'Show big text notification',
      onPressed: () async {
        await _showBigTextNotification();
      },
    );
  }
}

Future<void> _showBigTextNotification() async {
  const BigTextStyleInformation bigTextStyleInformation =
      BigTextStyleInformation(
    'Lorem <i>ipsum dolor sit</i> amet, consectetur <b>adipiscing elit</b>, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
    htmlFormatBigText: true,
    contentTitle: 'overridden <b>big</b> content title',
    htmlFormatContentTitle: true,
    summaryText: 'summary <i>text</i>',
    htmlFormatSummaryText: true,
  );

  const AndroidNotificationDetails androidPlatformChannelSpecifics =
      AndroidNotificationDetails(
    'big text channel id',
    'big text channel name',
    channelDescription: 'big text channel description',
    styleInformation: bigTextStyleInformation,
  );

  const NotificationDetails platformChannelSpecifics = NotificationDetails(
    android: androidPlatformChannelSpecifics,
  );

  await flutterLocalNotificationsPlugin.show(
    0,
    'big text title',
    'silent body',
    platformChannelSpecifics,
  );
}
