import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_notification/core/widget/padded_elevated_button.dart';
import 'package:flutter_notification/main.dart';

class ShowInboxNotification extends StatelessWidget {
  const ShowInboxNotification({super.key});

  @override
  Widget build(BuildContext context) {
    return PaddedElevatedButton(
      buttonText: 'Show inbox notification',
      onPressed: () async {
        await _showInboxNotification();
      },
    );
  }
}

Future<void> _showInboxNotification() async {
  final List<String> lines = <String>['line <b>1</b>', 'line <i>2</i>'];

  final InboxStyleInformation inboxStyleInformation = InboxStyleInformation(
    lines,
    htmlFormatLines: true,
    contentTitle: 'overridden <b>inbox</b> context title',
    htmlFormatContentTitle: true,
    summaryText: 'summary <i>text</i>',
    htmlFormatSummaryText: true,
  );

  final AndroidNotificationDetails androidPlatformChannelSpecifics =
      AndroidNotificationDetails(
    'inbox channel id',
    'inboxchannel name',
    channelDescription: 'inbox channel description',
    styleInformation: inboxStyleInformation,
  );

  final NotificationDetails platformChannelSpecifics = NotificationDetails(
    android: androidPlatformChannelSpecifics,
  );

  await flutterLocalNotificationsPlugin.show(
    0,
    'inbox title',
    'inbox body',
    platformChannelSpecifics,
  );
}
