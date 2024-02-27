import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_notification/core/widget/padded_elevated_button.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationplugin =
    FlutterLocalNotificationsPlugin();

class ShowGroupedNotifications extends StatefulWidget {
  const ShowGroupedNotifications({super.key});

  @override
  State<ShowGroupedNotifications> createState() =>
      _ShowGroupedNotificationsState();
}

class _ShowGroupedNotificationsState extends State<ShowGroupedNotifications> {
  int id = 1;

  @override
  Widget build(BuildContext context) {
    return PaddedElevatedButton(
      buttonText: 'Show grouped notifications',
      onPressed: () async {
        await _showGroupedNotifications(id);

        setState(() {
          id = id + 1;
        });
      },
    );
  }
}

Future<void> _showGroupedNotifications(int id) async {
  const String groupKey = 'com.android.example.WORK_EMAIL';
  const String groupChannelId = 'grouped channel id';
  const String groupChannelName = 'grouped channel name';
  const String groupChannelDescription = 'grouped channel description';

  const AndroidNotificationChannel channel = AndroidNotificationChannel(
    groupChannelId,
    groupChannelName,
    description: groupChannelDescription,
    groupId: groupKey,
  );

  // example based on https://developer.android.com/training/notify-user/group.html
  AndroidNotificationDetails notificationDetails = AndroidNotificationDetails(
    channel.id,
    channel.name,
    channelDescription: channel.description,
    importance: Importance.max,
    priority: Priority.high,
    groupKey: channel.groupId,
  );

  NotificationDetails notificationDetailsPlatformSpefics = NotificationDetails(
    android: notificationDetails,
  );

  flutterLocalNotificationplugin.show(
    id,
    'Alex Faarborg $id',
    'You will not believe...',
    notificationDetailsPlatformSpefics,
  );

  List<ActiveNotification>? activeNotifications =
      await flutterLocalNotificationplugin
          .resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin>()
          ?.getActiveNotifications();

  if (activeNotifications!.isNotEmpty) {
    List<String> lines =
        activeNotifications.map((e) => e.title.toString()).toList();

    InboxStyleInformation inboxStyleInformation = InboxStyleInformation(
      lines,
      contentTitle: "${activeNotifications.length - 1} messages",
      summaryText: "${activeNotifications.length - 1} messages",
    );

    AndroidNotificationDetails groupNotificationDetails =
        AndroidNotificationDetails(
      channel.id,
      channel.name,
      channelDescription: channel.description,
      styleInformation: inboxStyleInformation,
      setAsGroupSummary: true,
      groupKey: channel.groupId,
    );

    NotificationDetails groupNotificationDetailsPlatformSpefics =
        NotificationDetails(
      android: groupNotificationDetails,
    );

    await flutterLocalNotificationplugin.show(
      0,
      '',
      '',
      groupNotificationDetailsPlatformSpefics,
    );
  }
}
