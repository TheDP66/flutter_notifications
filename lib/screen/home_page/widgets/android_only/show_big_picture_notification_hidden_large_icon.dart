import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_notification/core/widget/padded_elevated_button.dart';
import 'package:flutter_notification/main.dart';
import 'package:flutter_notification/util/file.dart';

class ShowBigPictureNotificationHiddenLargeIcon extends StatelessWidget {
  const ShowBigPictureNotificationHiddenLargeIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return PaddedElevatedButton(
      buttonText: 'Show big picture notification, hide large icon '
          'on expand',
      onPressed: () async {
        await _showBigPictureNotificationHiddenLargeIcon();
      },
    );
  }
}

Future<void> _showBigPictureNotificationHiddenLargeIcon() async {
  final String largeIconPath = await downloadAndSaveFile(
    'https://via.placeholder.com/48x48',
    'largeIcon',
  );

  final String bigPicturePath = await downloadAndSaveFile(
    'https://via.placeholder.com/400x800',
    'bigPicture',
  );

  final BigPictureStyleInformation bigPictureStyleInformation =
      BigPictureStyleInformation(
    FilePathAndroidBitmap(bigPicturePath),
    hideExpandedLargeIcon: true,
    contentTitle: 'overridden <b>big</b> content title',
    htmlFormatContentTitle: true,
    summaryText: 'summary <i>text</i>',
    htmlFormatSummaryText: true,
  );

  final AndroidNotificationDetails androidPlatformChannelSpecifics =
      AndroidNotificationDetails(
    'big text channel id',
    'big text channel name',
    channelDescription: 'big text channel description',
    largeIcon: FilePathAndroidBitmap(largeIconPath),
    styleInformation: bigPictureStyleInformation,
  );

  final NotificationDetails platformChannelSpecifics = NotificationDetails(
    android: androidPlatformChannelSpecifics,
  );

  await flutterLocalNotificationsPlugin.show(
    0,
    'big text title',
    'silent body',
    platformChannelSpecifics,
  );
}
