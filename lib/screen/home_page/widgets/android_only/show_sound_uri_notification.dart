import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_notification/core/widget/padded_elevated_button.dart';
import 'package:flutter_notification/main.dart';

class ShowSoundUriNotification extends StatelessWidget {
  const ShowSoundUriNotification({super.key});

  @override
  Widget build(BuildContext context) {
    return PaddedElevatedButton(
      buttonText: 'Show notification using Android Uri sound',
      onPressed: () async {
        await _showSoundUriNotification();
      },
    );
  }
}

Future<void> _showSoundUriNotification() async {
  /// this calls a method over a platform channel implemented within the
  /// example app to return the Uri for the default alarm sound and uses
  /// as the notification sound
  final String? alarmUri = await platform.invokeMethod<String>('getAlarmUri');

  final UriAndroidNotificationSound uriSound =
      UriAndroidNotificationSound(alarmUri!);

  final AndroidNotificationDetails androidPlatformChannelSpecifics =
      AndroidNotificationDetails(
    'uri channel id',
    'uri channel name',
    channelDescription: 'uri channel description',
    sound: uriSound,
    styleInformation: const DefaultStyleInformation(true, true),
  );

  final NotificationDetails platformChannelSpecifics = NotificationDetails(
    android: androidPlatformChannelSpecifics,
  );

  await flutterLocalNotificationsPlugin.show(
    0,
    'uri sound title',
    'uri sound body',
    platformChannelSpecifics,
  );
}
