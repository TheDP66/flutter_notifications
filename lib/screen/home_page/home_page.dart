import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_notification/main.dart';
import 'package:flutter_notification/model/received_notification.dart';
import 'package:flutter_notification/screen/home_page/widgets/android_only/cancel_notification_with_tag.dart';
import 'package:flutter_notification/screen/home_page/widgets/android_only/create_notification_channel.dart';
import 'package:flutter_notification/screen/home_page/widgets/android_only/create_notification_channel_group.dart';
import 'package:flutter_notification/screen/home_page/widgets/android_only/delete_notification_channel.dart';
import 'package:flutter_notification/screen/home_page/widgets/android_only/delete_notification_channel_group.dart';
import 'package:flutter_notification/screen/home_page/widgets/android_only/get_active_notifications.dart';
import 'package:flutter_notification/screen/home_page/widgets/android_only/get_notification_channels.dart';
import 'package:flutter_notification/screen/home_page/widgets/android_only/show_big_picture_notification.dart';
import 'package:flutter_notification/screen/home_page/widgets/android_only/show_big_picture_notification_hidden_large_icon.dart';
import 'package:flutter_notification/screen/home_page/widgets/android_only/show_big_text_notification.dart';
import 'package:flutter_notification/screen/home_page/widgets/android_only/show_full_screen_notification.dart';
import 'package:flutter_notification/screen/home_page/widgets/android_only/show_grouped_notifications.dart';
import 'package:flutter_notification/screen/home_page/widgets/android_only/show_inbox_notification.dart';
import 'package:flutter_notification/screen/home_page/widgets/android_only/show_indeterminate_progress_notification.dart';
import 'package:flutter_notification/screen/home_page/widgets/android_only/show_insistent_notification.dart';
import 'package:flutter_notification/screen/home_page/widgets/android_only/show_messaging_notification.dart';
import 'package:flutter_notification/screen/home_page/widgets/android_only/show_notification_custom_vibration_icon_led.dart';
import 'package:flutter_notification/screen/home_page/widgets/android_only/show_notification_media_style.dart';
import 'package:flutter_notification/screen/home_page/widgets/android_only/show_notification_update_channel_description.dart';
import 'package:flutter_notification/screen/home_page/widgets/android_only/show_notification_with_chronometer.dart';
import 'package:flutter_notification/screen/home_page/widgets/android_only/show_notification_with_custom_sub_text.dart';
import 'package:flutter_notification/screen/home_page/widgets/android_only/show_notification_with_custom_timestamp.dart';
import 'package:flutter_notification/screen/home_page/widgets/android_only/show_notification_with_no_badge.dart';
import 'package:flutter_notification/screen/home_page/widgets/android_only/show_notification_with_tag.dart';
import 'package:flutter_notification/screen/home_page/widgets/android_only/show_notification_without_timestamp.dart';
import 'package:flutter_notification/screen/home_page/widgets/android_only/show_ongoing_notification.dart';
import 'package:flutter_notification/screen/home_page/widgets/android_only/show_progress_notification.dart';
import 'package:flutter_notification/screen/home_page/widgets/android_only/show_public_notification.dart';
import 'package:flutter_notification/screen/home_page/widgets/android_only/show_sound_uri_notification.dart';
import 'package:flutter_notification/screen/home_page/widgets/android_only/show_timeout_notification.dart';
import 'package:flutter_notification/screen/home_page/widgets/cancel_all_notifications.dart';
import 'package:flutter_notification/screen/home_page/widgets/cancel_notification.dart';
import 'package:flutter_notification/screen/home_page/widgets/check_pending_notification_requests.dart';
import 'package:flutter_notification/screen/home_page/widgets/ios_only/show_notification_with_attachment.dart';
import 'package:flutter_notification/screen/home_page/widgets/ios_only/show_notification_with_icon_badge.dart';
import 'package:flutter_notification/screen/home_page/widgets/ios_only/show_notification_with_subtitle.dart';
import 'package:flutter_notification/screen/home_page/widgets/ios_only/show_notifications_with_thread_identifier.dart';
import 'package:flutter_notification/screen/home_page/widgets/repeat_notification.dart';
import 'package:flutter_notification/screen/home_page/widgets/schedule_daily_ten_am_last_year_notification.dart';
import 'package:flutter_notification/screen/home_page/widgets/schedule_daily_ten_am_notification.dart';
import 'package:flutter_notification/screen/home_page/widgets/schedule_weekly_monday_ten_am_notification.dart';
import 'package:flutter_notification/screen/home_page/widgets/schedule_weekly_ten_am_notification.dart';
import 'package:flutter_notification/screen/home_page/widgets/show_notification.dart';
import 'package:flutter_notification/screen/home_page/widgets/show_notification_custom_sound.dart';
import 'package:flutter_notification/screen/home_page/widgets/show_notification_with_no_body.dart';
import 'package:flutter_notification/screen/home_page/widgets/show_notification_with_no_sound.dart';
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
                    const ShowNotificationWithNoSound(),
                    const CheckPendingNotificationRequests(),
                    const CancelNotification(),
                    const CancelAllNotifications(),
                    if (Platform.isAndroid) ...<Widget>[
                      const Text(
                        'Android-specific examples',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const ShowNotificationUpdateChannelDescription(),
                      const ShowPublicNotification(),
                      const ShowNotificationCustomVibrationIconLed(),
                      const ShowSoundUriNotification(),
                      const ShowTimeoutNotification(),
                      const ShowInsistentNotification(),
                      const ShowBigPictureNotification(),
                      const ShowBigPictureNotificationHiddenLargeIcon(),
                      const ShowNotificationMediaStyle(),
                      const ShowBigTextNotification(),
                      const ShowInboxNotification(),
                      const ShowMessagingNotification(),
                      const ShowGroupedNotifications(),
                      const ShowNotificationWithTag(),
                      const CancelNotificationWithTag(),
                      const ShowOngoingNotification(),
                      const ShowOngoingNotificationWithNoBadge(),
                      const ShowProgressNotification(),
                      const ShowIndeterminateProgressNotification(),
                      const ShowNotificationWithoutTimestamp(),
                      const ShowNotificationWithCustomTimestamp(),
                      const ShowNotificationWithCustomSubText(),
                      const ShowNotificationWithChronometer(),
                      const ShowFullScreenNotification(),
                      const CreateNotificationChannelGroup(),
                      const DeleteNotificationChannelGroup(),
                      const CreateNotificationChannel(),
                      const DeleteNotificationChannel(),
                      const GetNotificationChannels(),
                      const GetActiveNotifications(),
                    ],
                    if (Platform.isIOS || Platform.isMacOS) ...<Widget>[
                      const Text(
                        'iOS and macOS-specific examples',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const ShowNotificationWithSubtitle(),
                      const ShowNotificationWithIconBadge(),
                      const ShowNotificationWithAttachment(),
                      const ShowNotificationsWithThreadIdentifier(),
                    ],
                  ],
                ),
              ),
            ),
          ),
        ),
      );
}
