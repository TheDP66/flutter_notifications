import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_notification/core/widget/padded_elevated_button.dart';
import 'package:flutter_notification/main.dart';
import 'package:flutter_notification/util/file.dart';

class ShowNotificationMediaStyle extends StatelessWidget {
  const ShowNotificationMediaStyle({super.key});

  @override
  Widget build(BuildContext context) {
    return PaddedElevatedButton(
      buttonText: 'Show media notification',
      onPressed: () async {
        await _showNotificationMediaStyle();
      },
    );
  }
}

Future<void> _showNotificationMediaStyle() async {
  final String largeIconPath = await downloadAndSaveFile(
    'https://via.placeholder.com/128x128/00FF00/000000',
    'largeIcon',
  );

  final AndroidNotificationDetails androidPlatformChannelSpecifics =
      AndroidNotificationDetails(
    'media channel id',
    'media channel name',
    channelDescription: 'media channel description',
    largeIcon: FilePathAndroidBitmap(largeIconPath),
    styleInformation: const MediaStyleInformation(),
  );

  final NotificationDetails platformChannelSpecifics = NotificationDetails(
    android: androidPlatformChannelSpecifics,
  );

  await flutterLocalNotificationsPlugin.show(
    0,
    'notification title',
    'notification body',
    platformChannelSpecifics,
  );
}
