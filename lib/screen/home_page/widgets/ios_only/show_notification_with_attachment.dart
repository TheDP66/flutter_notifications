import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_notification/core/widget/padded_elevated_button.dart';
import 'package:flutter_notification/main.dart';
import 'package:flutter_notification/util/file.dart';

class ShowNotificationWithAttachment extends StatelessWidget {
  const ShowNotificationWithAttachment({super.key});

  @override
  Widget build(BuildContext context) {
    return PaddedElevatedButton(
      buttonText: 'Show notification with attachment',
      onPressed: () async {
        await _showNotificationWithAttachment();
      },
    );
  }
}

Future<void> _showNotificationWithAttachment() async {
  final String bigPicturePath = await downloadAndSaveFile(
    'https://via.placeholder.com/600x200',
    'bigPicture.jpg',
  );

  final DarwinNotificationDetails iOSPlatformChannelSpecifics =
      DarwinNotificationDetails(
    attachments: <DarwinNotificationAttachment>[
      DarwinNotificationAttachment(bigPicturePath)
    ],
  );

  final DarwinNotificationDetails macOSPlatformChannelSpecifics =
      DarwinNotificationDetails(
    attachments: <DarwinNotificationAttachment>[
      DarwinNotificationAttachment(bigPicturePath)
    ],
  );

  final NotificationDetails notificationDetails = NotificationDetails(
    iOS: iOSPlatformChannelSpecifics,
    macOS: macOSPlatformChannelSpecifics,
  );

  await flutterLocalNotificationsPlugin.show(
    0,
    'notification with attachment title',
    'notification with attachment body',
    notificationDetails,
  );
}
