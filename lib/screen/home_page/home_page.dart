import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_notification/main.dart';
import 'package:flutter_notification/model/received_notification.dart';
import 'package:flutter_notification/screen/home_page/widgets/repeat_notification.dart';
import 'package:flutter_notification/screen/home_page/widgets/schedule_daily_ten_am_last_year_notification.dart';
import 'package:flutter_notification/screen/home_page/widgets/schedule_daily_ten_am_notification.dart';
import 'package:flutter_notification/screen/home_page/widgets/schedule_weekly_monday_ten_am_notification.dart';
import 'package:flutter_notification/screen/home_page/widgets/schedule_weekly_ten_am_notification.dart';
import 'package:flutter_notification/screen/home_page/widgets/show_notification.dart';
import 'package:flutter_notification/screen/home_page/widgets/show_notification_custom_sound.dart';
import 'package:flutter_notification/screen/home_page/widgets/show_notification_with_no_body.dart';
import 'package:flutter_notification/screen/home_page/widgets/show_notification_with_no_title.dart';
import 'package:flutter_notification/screen/home_page/widgets/zoned_schedule_notification.dart';
import 'package:flutter_notification/screen/second_page/second_page.dart';

class HomePage extends StatefulWidget {
  const HomePage(
    this.notificationAppLaunchDetails, {
    Key? key,
  }) : super(key: key);

  static const String routeName = '/';

  final NotificationAppLaunchDetails? notificationAppLaunchDetails;

  bool get didNotificationLaunchApp =>
      notificationAppLaunchDetails?.didNotificationLaunchApp ?? false;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    _requestPermissions();
    _configureDidReceiveLocalNotificationSubject();
    _configureSelectNotificationSubject();
  }

  void _requestPermissions() {
    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
          alert: true,
          badge: true,
          sound: true,
        );
    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            MacOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
          alert: true,
          badge: true,
          sound: true,
        );
  }

  void _configureDidReceiveLocalNotificationSubject() {
    didReceiveLocalNotificationSubject.stream
        .listen((ReceivedNotification receivedNotification) async {
      await showDialog(
        context: context,
        builder: (BuildContext context) => CupertinoAlertDialog(
          title: receivedNotification.title != null
              ? Text(receivedNotification.title!)
              : null,
          content: receivedNotification.body != null
              ? Text(receivedNotification.body!)
              : null,
          actions: <Widget>[
            CupertinoDialogAction(
              isDefaultAction: true,
              onPressed: () async {
                Navigator.of(context, rootNavigator: true).pop();
                await Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => SecondPage(
                      payload: receivedNotification.payload,
                    ),
                  ),
                );
              },
              child: const Text('Ok'),
            )
          ],
        ),
      );
    });
  }

  void _configureSelectNotificationSubject() {
    selectNotificationSubject.stream.listen((String? payload) async {
      log(payload ?? "blank");
      await Navigator.pushNamed(
        context,
        '/secondPage',
      );
    });
  }

  @override
  void dispose() {
    didReceiveLocalNotificationSubject.close();
    selectNotificationSubject.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Plugin example app'),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Center(
                child: Column(
                  children: <Widget>[
                    const Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 8),
                      child: Text(
                          'Tap on a notification when it appears to trigger'
                          ' navigation'),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 8),
                      child: Text.rich(
                        TextSpan(
                          children: <InlineSpan>[
                            const TextSpan(
                              text: 'Did notification launch app? ',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            TextSpan(
                              text: '${widget.didNotificationLaunchApp}',
                            )
                          ],
                        ),
                      ),
                    ),
                    if (widget.didNotificationLaunchApp)
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 8),
                        child: Text.rich(
                          TextSpan(
                            children: <InlineSpan>[
                              const TextSpan(
                                text: 'Launch notification payload: ',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              TextSpan(
                                text: widget.notificationAppLaunchDetails!
                                    .notificationResponse!.payload,
                              )
                            ],
                          ),
                        ),
                      ),
                    const ShowNotification(),
                    const ShowNotificationWithNoTitle(),
                    const ShowNotificationWithNoBody(),
                    const ShowNotificationCustomSound(),
                    const ZonedScheduleNotification(),
                    const RepeatNotification(),
                    const ScheduleDailyTenAMNotification(),
                    const ScheduleDailyTenAMLastYearNotification(),
                    const ScheduleWeeklyTenAMNotification(),
                    const ScheduleWeeklyMondayTenAMNotification(),
                    // PaddedElevatedButton(
                    //   buttonText: 'Show notification with no sound',
                    //   onPressed: () async {
                    //     await _showNotificationWithNoSound();
                    //   },
                    // ),
                    // PaddedElevatedButton(
                    //   buttonText: 'Check pending notifications',
                    //   onPressed: () async {
                    //     await _checkPendingNotificationRequests();
                    //   },
                    // ),
                    // PaddedElevatedButton(
                    //   buttonText: 'Cancel notification',
                    //   onPressed: () async {
                    //     await _cancelNotification();
                    //   },
                    // ),
                    // PaddedElevatedButton(
                    //   buttonText: 'Cancel all notifications',
                    //   onPressed: () async {
                    //     await _cancelAllNotifications();
                    //   },
                    // ),
                    // if (Platform.isAndroid) ...<Widget>[
                    //   const Text(
                    //     'Android-specific examples',
                    //     style: TextStyle(fontWeight: FontWeight.bold),
                    //   ),
                    //   PaddedElevatedButton(
                    //     buttonText:
                    //         'Show plain notification with payload and update '
                    //         'channel description',
                    //     onPressed: () async {
                    //       await _showNotificationUpdateChannelDescription();
                    //     },
                    //   ),
                    //   PaddedElevatedButton(
                    //     buttonText:
                    //         'Show plain notification as public on every '
                    //         'lockscreen',
                    //     onPressed: () async {
                    //       await _showPublicNotification();
                    //     },
                    //   ),
                    //   PaddedElevatedButton(
                    //     buttonText:
                    //         'Show notification with custom vibration pattern, '
                    //         'red LED and red icon',
                    //     onPressed: () async {
                    //       await _showNotificationCustomVibrationIconLed();
                    //     },
                    //   ),
                    //   PaddedElevatedButton(
                    //     buttonText: 'Show notification using Android Uri sound',
                    //     onPressed: () async {
                    //       await _showSoundUriNotification();
                    //     },
                    //   ),
                    //   PaddedElevatedButton(
                    //     buttonText:
                    //         'Show notification that times out after 3 seconds',
                    //     onPressed: () async {
                    //       await _showTimeoutNotification();
                    //     },
                    //   ),
                    //   PaddedElevatedButton(
                    //     buttonText: 'Show insistent notification',
                    //     onPressed: () async {
                    //       await _showInsistentNotification();
                    //     },
                    //   ),
                    //   PaddedElevatedButton(
                    //     buttonText: 'Show big picture notification',
                    //     onPressed: () async {
                    //       await _showBigPictureNotification();
                    //     },
                    //   ),
                    //   PaddedElevatedButton(
                    //     buttonText:
                    //         'Show big picture notification, hide large icon '
                    //         'on expand',
                    //     onPressed: () async {
                    //       await _showBigPictureNotificationHiddenLargeIcon();
                    //     },
                    //   ),
                    //   PaddedElevatedButton(
                    //     buttonText: 'Show media notification',
                    //     onPressed: () async {
                    //       await _showNotificationMediaStyle();
                    //     },
                    //   ),
                    //   PaddedElevatedButton(
                    //     buttonText: 'Show big text notification',
                    //     onPressed: () async {
                    //       await _showBigTextNotification();
                    //     },
                    //   ),
                    //   PaddedElevatedButton(
                    //     buttonText: 'Show inbox notification',
                    //     onPressed: () async {
                    //       await _showInboxNotification();
                    //     },
                    //   ),
                    //   PaddedElevatedButton(
                    //     buttonText: 'Show messaging notification',
                    //     onPressed: () async {
                    //       await _showMessagingNotification();
                    //     },
                    //   ),
                    //   PaddedElevatedButton(
                    //     buttonText: 'Show grouped notifications',
                    //     onPressed: () async {
                    //       await _showGroupedNotifications();
                    //     },
                    //   ),
                    //   PaddedElevatedButton(
                    //     buttonText: 'Show notification with tag',
                    //     onPressed: () async {
                    //       await _showNotificationWithTag();
                    //     },
                    //   ),
                    //   PaddedElevatedButton(
                    //     buttonText: 'Cancel notification with tag',
                    //     onPressed: () async {
                    //       await _cancelNotificationWithTag();
                    //     },
                    //   ),
                    //   PaddedElevatedButton(
                    //     buttonText: 'Show ongoing notification',
                    //     onPressed: () async {
                    //       await _showOngoingNotification();
                    //     },
                    //   ),
                    //   PaddedElevatedButton(
                    //     buttonText:
                    //         'Show notification with no badge, alert only once',
                    //     onPressed: () async {
                    //       await _showNotificationWithNoBadge();
                    //     },
                    //   ),
                    //   PaddedElevatedButton(
                    //     buttonText:
                    //         'Show progress notification - updates every second',
                    //     onPressed: () async {
                    //       await _showProgressNotification();
                    //     },
                    //   ),
                    //   PaddedElevatedButton(
                    //     buttonText: 'Show indeterminate progress notification',
                    //     onPressed: () async {
                    //       await _showIndeterminateProgressNotification();
                    //     },
                    //   ),
                    //   PaddedElevatedButton(
                    //     buttonText: 'Show notification without timestamp',
                    //     onPressed: () async {
                    //       await _showNotificationWithoutTimestamp();
                    //     },
                    //   ),
                    //   PaddedElevatedButton(
                    //     buttonText: 'Show notification with custom timestamp',
                    //     onPressed: () async {
                    //       await _showNotificationWithCustomTimestamp();
                    //     },
                    //   ),
                    //   PaddedElevatedButton(
                    //     buttonText: 'Show notification with custom sub-text',
                    //     onPressed: () async {
                    //       await _showNotificationWithCustomSubText();
                    //     },
                    //   ),
                    //   PaddedElevatedButton(
                    //     buttonText: 'Show notification with chronometer',
                    //     onPressed: () async {
                    //       await _showNotificationWithChronometer();
                    //     },
                    //   ),
                    //   PaddedElevatedButton(
                    //     buttonText: 'Show full-screen notification',
                    //     onPressed: () async {
                    //       await _showFullScreenNotification();
                    //     },
                    //   ),
                    //   PaddedElevatedButton(
                    //     buttonText: 'Create grouped notification channels',
                    //     onPressed: () async {
                    //       await _createNotificationChannelGroup();
                    //     },
                    //   ),
                    //   PaddedElevatedButton(
                    //     buttonText: 'Delete notification channel group',
                    //     onPressed: () async {
                    //       await _deleteNotificationChannelGroup();
                    //     },
                    //   ),
                    //   PaddedElevatedButton(
                    //     buttonText: 'Create notification channel',
                    //     onPressed: () async {
                    //       await _createNotificationChannel();
                    //     },
                    //   ),
                    //   PaddedElevatedButton(
                    //     buttonText: 'Delete notification channel',
                    //     onPressed: () async {
                    //       await _deleteNotificationChannel();
                    //     },
                    //   ),
                    //   PaddedElevatedButton(
                    //     buttonText: 'Get notification channels',
                    //     onPressed: () async {
                    //       await _getNotificationChannels();
                    //     },
                    //   ),
                    //   PaddedElevatedButton(
                    //     buttonText: 'Get active notifications',
                    //     onPressed: () async {
                    //       await _getActiveNotifications();
                    //     },
                    //   ),
                    // ],
                    // if (Platform.isIOS || Platform.isMacOS) ...<Widget>[
                    //   const Text(
                    //     'iOS and macOS-specific examples',
                    //     style: TextStyle(fontWeight: FontWeight.bold),
                    //   ),
                    //   PaddedElevatedButton(
                    //     buttonText: 'Show notification with subtitle',
                    //     onPressed: () async {
                    //       await _showNotificationWithSubtitle();
                    //     },
                    //   ),
                    //   PaddedElevatedButton(
                    //     buttonText: 'Show notification with icon badge',
                    //     onPressed: () async {
                    //       await _showNotificationWithIconBadge();
                    //     },
                    //   ),
                    //   PaddedElevatedButton(
                    //     buttonText: 'Show notification with attachment',
                    //     onPressed: () async {
                    //       await _showNotificationWithAttachment();
                    //     },
                    //   ),
                    //   PaddedElevatedButton(
                    //     buttonText: 'Show notifications with thread identifier',
                    //     onPressed: () async {
                    //       await _showNotificationsWithThreadIdentifier();
                    //     },
                    //   ),
                    // ],
                  ],
                ),
              ),
            ),
          ),
        ),
      );
}
