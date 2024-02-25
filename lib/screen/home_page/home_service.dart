

// Future<void> _showNotificationWithNoTitle(BuildContext context) async {
//   await showDialog(
//     context: context,
//     builder: (_) => AlertDialog(
//       title: const Text('Turn off your screen'),
//       content: const Text(
//           'to see the full-screen intent in 5 seconds, press OK and TURN '
//           'OFF your screen'),
//       actions: <Widget>[
//         TextButton(
//           onPressed: () {
//             Navigator.pop(context);
//           },
//           child: const Text('Cancel'),
//         ),
//         TextButton(
//           onPressed: () async {
//             await flutterLocalNotificationsPlugin.zonedSchedule(
//               0,
//               'scheduled title',
//               'scheduled body',
//               tz.TZDateTime.now(tz.local).add(const Duration(seconds: 5)),
//               const NotificationDetails(
//                   android: AndroidNotificationDetails(
//                       'full screen channel id', 'full screen channel name',
//                       channelDescription: 'full screen channel description',
//                       priority: Priority.high,
//                       importance: Importance.high,
//                       fullScreenIntent: true)),
//               androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
//               uiLocalNotificationDateInterpretation:
//                   UILocalNotificationDateInterpretation.absoluteTime,
//             );

//             Navigator.pop(context);
//           },
//           child: const Text('OK'),
//         )
//       ],
//     ),
//   );
// }


  // Future<void> _cancelNotification() async {
  //   await flutterLocalNotificationsPlugin.cancel(0);
  // }

  // Future<void> _cancelNotificationWithTag() async {
  //   await flutterLocalNotificationsPlugin.cancel(0, tag: 'tag');
  // }


  // Future<void> _showNotificationCustomVibrationIconLed() async {
  //   final Int64List vibrationPattern = Int64List(4);
  //   vibrationPattern[0] = 0;
  //   vibrationPattern[1] = 1000;
  //   vibrationPattern[2] = 5000;
  //   vibrationPattern[3] = 2000;

  //   final AndroidNotificationDetails androidPlatformChannelSpecifics =
  //       AndroidNotificationDetails('other custom channel id',
  //           'other custom channel name', 'other custom channel description',
  //           icon: 'secondary_icon',
  //           largeIcon: const DrawableResourceAndroidBitmap('sample_large_icon'),
  //           vibrationPattern: vibrationPattern,
  //           enableLights: true,
  //           color: const Color.fromARGB(255, 255, 0, 0),
  //           ledColor: const Color.fromARGB(255, 255, 0, 0),
  //           ledOnMs: 1000,
  //           ledOffMs: 500);

  //   final NotificationDetails platformChannelSpecifics =
  //       NotificationDetails(android: androidPlatformChannelSpecifics);
  //   await flutterLocalNotificationsPlugin.show(
  //       0,
  //       'title of notification with custom vibration pattern, LED and icon',
  //       'body of notification with custom vibration pattern, LED and icon',
  //       platformChannelSpecifics);
  // }


  // Future<void> _showNotificationWithNoSound() async {
  //   const AndroidNotificationDetails androidPlatformChannelSpecifics =
  //       AndroidNotificationDetails('silent channel id', 'silent channel name',
  //           'silent channel description',
  //           playSound: false,
  //           styleInformation: DefaultStyleInformation(true, true));
  //   const IOSNotificationDetails iOSPlatformChannelSpecifics =
  //       IOSNotificationDetails(presentSound: false);
  //   const MacOSNotificationDetails macOSPlatformChannelSpecifics =
  //       MacOSNotificationDetails(presentSound: false);
  //   const NotificationDetails platformChannelSpecifics = NotificationDetails(
  //       android: androidPlatformChannelSpecifics,
  //       iOS: iOSPlatformChannelSpecifics,
  //       macOS: macOSPlatformChannelSpecifics);
  //   await flutterLocalNotificationsPlugin.show(0, '<b>silent</b> title',
  //       '<b>silent</b> body', platformChannelSpecifics);
  // }

  // Future<void> _showSoundUriNotification() async {
  //   /// this calls a method over a platform channel implemented within the
  //   /// example app to return the Uri for the default alarm sound and uses
  //   /// as the notification sound
  //   final String? alarmUri = await platform.invokeMethod<String>('getAlarmUri');
  //   final UriAndroidNotificationSound uriSound =
  //       UriAndroidNotificationSound(alarmUri!);
  //   final AndroidNotificationDetails androidPlatformChannelSpecifics =
  //       AndroidNotificationDetails(
  //           'uri channel id', 'uri channel name', 'uri channel description',
  //           sound: uriSound,
  //           styleInformation: const DefaultStyleInformation(true, true));
  //   final NotificationDetails platformChannelSpecifics =
  //       NotificationDetails(android: androidPlatformChannelSpecifics);
  //   await flutterLocalNotificationsPlugin.show(
  //       0, 'uri sound title', 'uri sound body', platformChannelSpecifics);
  // }

  // Future<void> _showTimeoutNotification() async {
  //   const AndroidNotificationDetails androidPlatformChannelSpecifics =
  //       AndroidNotificationDetails('silent channel id', 'silent channel name',
  //           'silent channel description',
  //           timeoutAfter: 3000,
  //           styleInformation: DefaultStyleInformation(true, true));
  //   const NotificationDetails platformChannelSpecifics =
  //       NotificationDetails(android: androidPlatformChannelSpecifics);
  //   await flutterLocalNotificationsPlugin.show(0, 'timeout notification',
  //       'Times out after 3 seconds', platformChannelSpecifics);
  // }

  // Future<void> _showInsistentNotification() async {
  //   // This value is from: https://developer.android.com/reference/android/app/Notification.html#FLAG_INSISTENT
  //   const int insistentFlag = 4;
  //   final AndroidNotificationDetails androidPlatformChannelSpecifics =
  //       AndroidNotificationDetails(
  //           'your channel id', 'your channel name', 'your channel description',
  //           importance: Importance.max,
  //           priority: Priority.high,
  //           ticker: 'ticker',
  //           additionalFlags: Int32List.fromList(<int>[insistentFlag]));
  //   final NotificationDetails platformChannelSpecifics =
  //       NotificationDetails(android: androidPlatformChannelSpecifics);
  //   await flutterLocalNotificationsPlugin.show(
  //       0, 'insistent title', 'insistent body', platformChannelSpecifics,
  //       payload: 'item x');
  // }

  // Future<String> _downloadAndSaveFile(String url, String fileName) async {
  //   final Directory directory = await getApplicationDocumentsDirectory();
  //   final String filePath = '${directory.path}/$fileName';
  //   final http.Response response = await http.get(Uri.parse(url));
  //   final File file = File(filePath);
  //   await file.writeAsBytes(response.bodyBytes);
  //   return filePath;
  // }

  // Future<void> _showBigPictureNotification() async {
  //   final String largeIconPath = await _downloadAndSaveFile(
  //       'https://via.placeholder.com/48x48', 'largeIcon');
  //   final String bigPicturePath = await _downloadAndSaveFile(
  //       'https://via.placeholder.com/400x800', 'bigPicture');
  //   final BigPictureStyleInformation bigPictureStyleInformation =
  //       BigPictureStyleInformation(FilePathAndroidBitmap(bigPicturePath),
  //           largeIcon: FilePathAndroidBitmap(largeIconPath),
  //           contentTitle: 'overridden <b>big</b> content title',
  //           htmlFormatContentTitle: true,
  //           summaryText: 'summary <i>text</i>',
  //           htmlFormatSummaryText: true);
  //   final AndroidNotificationDetails androidPlatformChannelSpecifics =
  //       AndroidNotificationDetails('big text channel id',
  //           'big text channel name', 'big text channel description',
  //           styleInformation: bigPictureStyleInformation);
  //   final NotificationDetails platformChannelSpecifics =
  //       NotificationDetails(android: androidPlatformChannelSpecifics);
  //   await flutterLocalNotificationsPlugin.show(
  //       0, 'big text title', 'silent body', platformChannelSpecifics);
  // }

  // Future<void> _showBigPictureNotificationHiddenLargeIcon() async {
  //   final String largeIconPath = await _downloadAndSaveFile(
  //       'https://via.placeholder.com/48x48', 'largeIcon');
  //   final String bigPicturePath = await _downloadAndSaveFile(
  //       'https://via.placeholder.com/400x800', 'bigPicture');
  //   final BigPictureStyleInformation bigPictureStyleInformation =
  //       BigPictureStyleInformation(FilePathAndroidBitmap(bigPicturePath),
  //           hideExpandedLargeIcon: true,
  //           contentTitle: 'overridden <b>big</b> content title',
  //           htmlFormatContentTitle: true,
  //           summaryText: 'summary <i>text</i>',
  //           htmlFormatSummaryText: true);
  //   final AndroidNotificationDetails androidPlatformChannelSpecifics =
  //       AndroidNotificationDetails('big text channel id',
  //           'big text channel name', 'big text channel description',
  //           largeIcon: FilePathAndroidBitmap(largeIconPath),
  //           styleInformation: bigPictureStyleInformation);
  //   final NotificationDetails platformChannelSpecifics =
  //       NotificationDetails(android: androidPlatformChannelSpecifics);
  //   await flutterLocalNotificationsPlugin.show(
  //       0, 'big text title', 'silent body', platformChannelSpecifics);
  // }

  // Future<void> _showNotificationMediaStyle() async {
  //   final String largeIconPath = await _downloadAndSaveFile(
  //       'https://via.placeholder.com/128x128/00FF00/000000', 'largeIcon');
  //   final AndroidNotificationDetails androidPlatformChannelSpecifics =
  //       AndroidNotificationDetails(
  //     'media channel id',
  //     'media channel name',
  //     'media channel description',
  //     largeIcon: FilePathAndroidBitmap(largeIconPath),
  //     styleInformation: const MediaStyleInformation(),
  //   );
  //   final NotificationDetails platformChannelSpecifics =
  //       NotificationDetails(android: androidPlatformChannelSpecifics);
  //   await flutterLocalNotificationsPlugin.show(
  //       0, 'notification title', 'notification body', platformChannelSpecifics);
  // }

  // Future<void> _showBigTextNotification() async {
  //   const BigTextStyleInformation bigTextStyleInformation =
  //       BigTextStyleInformation(
  //     'Lorem <i>ipsum dolor sit</i> amet, consectetur <b>adipiscing elit</b>, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
  //     htmlFormatBigText: true,
  //     contentTitle: 'overridden <b>big</b> content title',
  //     htmlFormatContentTitle: true,
  //     summaryText: 'summary <i>text</i>',
  //     htmlFormatSummaryText: true,
  //   );
  //   const AndroidNotificationDetails androidPlatformChannelSpecifics =
  //       AndroidNotificationDetails('big text channel id',
  //           'big text channel name', 'big text channel description',
  //           styleInformation: bigTextStyleInformation);
  //   const NotificationDetails platformChannelSpecifics =
  //       NotificationDetails(android: androidPlatformChannelSpecifics);
  //   await flutterLocalNotificationsPlugin.show(
  //       0, 'big text title', 'silent body', platformChannelSpecifics);
  // }

  // Future<void> _showInboxNotification() async {
  //   final List<String> lines = <String>['line <b>1</b>', 'line <i>2</i>'];
  //   final InboxStyleInformation inboxStyleInformation = InboxStyleInformation(
  //       lines,
  //       htmlFormatLines: true,
  //       contentTitle: 'overridden <b>inbox</b> context title',
  //       htmlFormatContentTitle: true,
  //       summaryText: 'summary <i>text</i>',
  //       htmlFormatSummaryText: true);
  //   final AndroidNotificationDetails androidPlatformChannelSpecifics =
  //       AndroidNotificationDetails('inbox channel id', 'inboxchannel name',
  //           'inbox channel description',
  //           styleInformation: inboxStyleInformation);
  //   final NotificationDetails platformChannelSpecifics =
  //       NotificationDetails(android: androidPlatformChannelSpecifics);
  //   await flutterLocalNotificationsPlugin.show(
  //       0, 'inbox title', 'inbox body', platformChannelSpecifics);
  // }

  // Future<void> _showMessagingNotification() async {
  //   // use a platform channel to resolve an Android drawable resource to a URI.
  //   // This is NOT part of the notifications plugin. Calls made over this
  //   /// channel is handled by the app
  //   final String? imageUri =
  //       await platform.invokeMethod('drawableToUri', 'food');

  //   /// First two person objects will use icons that part of the Android app's
  //   /// drawable resources
  //   const Person me = Person(
  //     name: 'Me',
  //     key: '1',
  //     uri: 'tel:1234567890',
  //     icon: DrawableResourceAndroidIcon('me'),
  //   );
  //   const Person coworker = Person(
  //     name: 'Coworker',
  //     key: '2',
  //     uri: 'tel:9876543210',
  //     icon: FlutterBitmapAssetAndroidIcon('icons/coworker.png'),
  //   );
  //   // download the icon that would be use for the lunch bot person
  //   final String largeIconPath = await _downloadAndSaveFile(
  //       'https://via.placeholder.com/48x48', 'largeIcon');
  //   // this person object will use an icon that was downloaded
  //   final Person lunchBot = Person(
  //     name: 'Lunch bot',
  //     key: 'bot',
  //     bot: true,
  //     icon: BitmapFilePathAndroidIcon(largeIconPath),
  //   );
  //   final List<Message> messages = <Message>[
  //     Message('Hi', DateTime.now(), null),
  //     Message("What's up?", DateTime.now().add(const Duration(minutes: 5)),
  //         coworker),
  //     Message('Lunch?', DateTime.now().add(const Duration(minutes: 10)), null,
  //         dataMimeType: 'image/png', dataUri: imageUri),
  //     Message('What kind of food would you prefer?',
  //         DateTime.now().add(const Duration(minutes: 10)), lunchBot),
  //   ];
  //   final MessagingStyleInformation messagingStyle = MessagingStyleInformation(
  //       me,
  //       groupConversation: true,
  //       conversationTitle: 'Team lunch',
  //       htmlFormatContent: true,
  //       htmlFormatTitle: true,
  //       messages: messages);
  //   final AndroidNotificationDetails androidPlatformChannelSpecifics =
  //       AndroidNotificationDetails('message channel id', 'message channel name',
  //           'message channel description',
  //           category: 'msg', styleInformation: messagingStyle);
  //   final NotificationDetails platformChannelSpecifics =
  //       NotificationDetails(android: androidPlatformChannelSpecifics);
  //   await flutterLocalNotificationsPlugin.show(
  //       0, 'message title', 'message body', platformChannelSpecifics);

  //   // wait 10 seconds and add another message to simulate another response
  //   await Future<void>.delayed(const Duration(seconds: 10), () async {
  //     messages.add(Message(
  //         'Thai', DateTime.now().add(const Duration(minutes: 11)), null));
  //     await flutterLocalNotificationsPlugin.show(
  //         0, 'message title', 'message body', platformChannelSpecifics);
  //   });
  // }

  // Future<void> _showGroupedNotifications() async {
  //   const String groupKey = 'com.android.example.WORK_EMAIL';
  //   const String groupChannelId = 'grouped channel id';
  //   const String groupChannelName = 'grouped channel name';
  //   const String groupChannelDescription = 'grouped channel description';
  //   // example based on https://developer.android.com/training/notify-user/group.html
  //   const AndroidNotificationDetails firstNotificationAndroidSpecifics =
  //       AndroidNotificationDetails(
  //           groupChannelId, groupChannelName, groupChannelDescription,
  //           importance: Importance.max,
  //           priority: Priority.high,
  //           groupKey: groupKey);
  //   const NotificationDetails firstNotificationPlatformSpecifics =
  //       NotificationDetails(android: firstNotificationAndroidSpecifics);
  //   await flutterLocalNotificationsPlugin.show(1, 'Alex Faarborg',
  //       'You will not believe...', firstNotificationPlatformSpecifics);
  //   const AndroidNotificationDetails secondNotificationAndroidSpecifics =
  //       AndroidNotificationDetails(
  //           groupChannelId, groupChannelName, groupChannelDescription,
  //           importance: Importance.max,
  //           priority: Priority.high,
  //           groupKey: groupKey);
  //   const NotificationDetails secondNotificationPlatformSpecifics =
  //       NotificationDetails(android: secondNotificationAndroidSpecifics);
  //   await flutterLocalNotificationsPlugin.show(
  //       2,
  //       'Jeff Chang',
  //       'Please join us to celebrate the...',
  //       secondNotificationPlatformSpecifics);

  //   // Create the summary notification to support older devices that pre-date
  //   /// Android 7.0 (API level 24).
  //   ///
  //   /// Recommended to create this regardless as the behaviour may vary as
  //   /// mentioned in https://developer.android.com/training/notify-user/group
  //   const List<String> lines = <String>[
  //     'Alex Faarborg  Check this out',
  //     'Jeff Chang    Launch Party'
  //   ];
  //   const InboxStyleInformation inboxStyleInformation = InboxStyleInformation(
  //       lines,
  //       contentTitle: '2 messages',
  //       summaryText: 'janedoe@example.com');
  //   const AndroidNotificationDetails androidPlatformChannelSpecifics =
  //       AndroidNotificationDetails(
  //           groupChannelId, groupChannelName, groupChannelDescription,
  //           styleInformation: inboxStyleInformation,
  //           groupKey: groupKey,
  //           setAsGroupSummary: true);
  //   const NotificationDetails platformChannelSpecifics =
  //       NotificationDetails(android: androidPlatformChannelSpecifics);
  //   await flutterLocalNotificationsPlugin.show(
  //       3, 'Attention', 'Two messages', platformChannelSpecifics);
  // }

  // Future<void> _showNotificationWithTag() async {
  //   const AndroidNotificationDetails androidPlatformChannelSpecifics =
  //       AndroidNotificationDetails(
  //           'your channel id', 'your channel name', 'your channel description',
  //           importance: Importance.max, priority: Priority.high, tag: 'tag');
  //   const NotificationDetails platformChannelSpecifics = NotificationDetails(
  //     android: androidPlatformChannelSpecifics,
  //   );
  //   await flutterLocalNotificationsPlugin.show(
  //       0, 'first notification', null, platformChannelSpecifics);
  // }

  // Future<void> _checkPendingNotificationRequests() async {
  //   final List<PendingNotificationRequest> pendingNotificationRequests =
  //       await flutterLocalNotificationsPlugin.pendingNotificationRequests();
  //   return showDialog<void>(
  //     context: context,
  //     builder: (BuildContext context) => AlertDialog(
  //       content:
  //           Text('${pendingNotificationRequests.length} pending notification '
  //               'requests'),
  //       actions: <Widget>[
  //         TextButton(
  //           onPressed: () {
  //             Navigator.of(context).pop();
  //           },
  //           child: const Text('OK'),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  // Future<void> _cancelAllNotifications() async {
  //   await flutterLocalNotificationsPlugin.cancelAll();
  // }

  // Future<void> _showOngoingNotification() async {
  //   const AndroidNotificationDetails androidPlatformChannelSpecifics =
  //       AndroidNotificationDetails(
  //           'your channel id', 'your channel name', 'your channel description',
  //           importance: Importance.max,
  //           priority: Priority.high,
  //           ongoing: true,
  //           autoCancel: false);
  //   const NotificationDetails platformChannelSpecifics =
  //       NotificationDetails(android: androidPlatformChannelSpecifics);
  //   await flutterLocalNotificationsPlugin.show(0, 'ongoing notification title',
  //       'ongoing notification body', platformChannelSpecifics);
  // }



  // /// To test we don't validate past dates when using `matchDateTimeComponents`
  

  // tz.TZDateTime _nextInstanceOfTenAMLastYear() {
  //   final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
  //   return tz.TZDateTime(tz.local, now.year - 1, now.month, now.day, 10);
  // }


  // Future<void> _showNotificationWithNoBadge() async {
  //   const AndroidNotificationDetails androidPlatformChannelSpecifics =
  //       AndroidNotificationDetails(
  //           'no badge channel', 'no badge name', 'no badge description',
  //           channelShowBadge: false,
  //           importance: Importance.max,
  //           priority: Priority.high,
  //           onlyAlertOnce: true);
  //   const NotificationDetails platformChannelSpecifics =
  //       NotificationDetails(android: androidPlatformChannelSpecifics);
  //   await flutterLocalNotificationsPlugin.show(
  //       0, 'no badge title', 'no badge body', platformChannelSpecifics,
  //       payload: 'item x');
  // }

  // Future<void> _showProgressNotification() async {
  //   const int maxProgress = 5;
  //   for (int i = 0; i <= maxProgress; i++) {
  //     await Future<void>.delayed(const Duration(seconds: 1), () async {
  //       final AndroidNotificationDetails androidPlatformChannelSpecifics =
  //           AndroidNotificationDetails('progress channel', 'progress channel',
  //               'progress channel description',
  //               channelShowBadge: false,
  //               importance: Importance.max,
  //               priority: Priority.high,
  //               onlyAlertOnce: true,
  //               showProgress: true,
  //               maxProgress: maxProgress,
  //               progress: i);
  //       final NotificationDetails platformChannelSpecifics =
  //           NotificationDetails(android: androidPlatformChannelSpecifics);
  //       await flutterLocalNotificationsPlugin.show(
  //           0,
  //           'progress notification title',
  //           'progress notification body',
  //           platformChannelSpecifics,
  //           payload: 'item x');
  //     });
  //   }
  // }

  // Future<void> _showIndeterminateProgressNotification() async {
  //   const AndroidNotificationDetails androidPlatformChannelSpecifics =
  //       AndroidNotificationDetails(
  //           'indeterminate progress channel',
  //           'indeterminate progress channel',
  //           'indeterminate progress channel description',
  //           channelShowBadge: false,
  //           importance: Importance.max,
  //           priority: Priority.high,
  //           onlyAlertOnce: true,
  //           showProgress: true,
  //           indeterminate: true);
  //   const NotificationDetails platformChannelSpecifics =
  //       NotificationDetails(android: androidPlatformChannelSpecifics);
  //   await flutterLocalNotificationsPlugin.show(
  //       0,
  //       'indeterminate progress notification title',
  //       'indeterminate progress notification body',
  //       platformChannelSpecifics,
  //       payload: 'item x');
  // }

  // Future<void> _showNotificationUpdateChannelDescription() async {
  //   const AndroidNotificationDetails androidPlatformChannelSpecifics =
  //       AndroidNotificationDetails('your channel id', 'your channel name',
  //           'your updated channel description',
  //           importance: Importance.max,
  //           priority: Priority.high,
  //           channelAction: AndroidNotificationChannelAction.update);
  //   const NotificationDetails platformChannelSpecifics =
  //       NotificationDetails(android: androidPlatformChannelSpecifics);
  //   await flutterLocalNotificationsPlugin.show(
  //       0,
  //       'updated notification channel',
  //       'check settings to see updated channel description',
  //       platformChannelSpecifics,
  //       payload: 'item x');
  // }

  // Future<void> _showPublicNotification() async {
  //   const AndroidNotificationDetails androidPlatformChannelSpecifics =
  //       AndroidNotificationDetails(
  //           'your channel id', 'your channel name', 'your channel description',
  //           importance: Importance.max,
  //           priority: Priority.high,
  //           ticker: 'ticker',
  //           visibility: NotificationVisibility.public);
  //   const NotificationDetails platformChannelSpecifics =
  //       NotificationDetails(android: androidPlatformChannelSpecifics);
  //   await flutterLocalNotificationsPlugin.show(0, 'public notification title',
  //       'public notification body', platformChannelSpecifics,
  //       payload: 'item x');
  // }

  // Future<void> _showNotificationWithSubtitle() async {
  //   const IOSNotificationDetails iOSPlatformChannelSpecifics =
  //       IOSNotificationDetails(subtitle: 'the subtitle');
  //   const MacOSNotificationDetails macOSPlatformChannelSpecifics =
  //       MacOSNotificationDetails(subtitle: 'the subtitle');
  //   const NotificationDetails platformChannelSpecifics = NotificationDetails(
  //       iOS: iOSPlatformChannelSpecifics, macOS: macOSPlatformChannelSpecifics);
  //   await flutterLocalNotificationsPlugin.show(
  //       0,
  //       'title of notification with a subtitle',
  //       'body of notification with a subtitle',
  //       platformChannelSpecifics,
  //       payload: 'item x');
  // }

  // Future<void> _showNotificationWithIconBadge() async {
  //   const IOSNotificationDetails iOSPlatformChannelSpecifics =
  //       IOSNotificationDetails(badgeNumber: 1);
  //   const MacOSNotificationDetails macOSPlatformChannelSpecifics =
  //       MacOSNotificationDetails(badgeNumber: 1);
  //   const NotificationDetails platformChannelSpecifics = NotificationDetails(
  //       iOS: iOSPlatformChannelSpecifics, macOS: macOSPlatformChannelSpecifics);
  //   await flutterLocalNotificationsPlugin.show(
  //       0, 'icon badge title', 'icon badge body', platformChannelSpecifics,
  //       payload: 'item x');
  // }

  // Future<void> _showNotificationsWithThreadIdentifier() async {
  //   NotificationDetails buildNotificationDetailsForThread(
  //     String threadIdentifier,
  //   ) {
  //     final IOSNotificationDetails iOSPlatformChannelSpecifics =
  //         IOSNotificationDetails(threadIdentifier: threadIdentifier);
  //     final MacOSNotificationDetails macOSPlatformChannelSpecifics =
  //         MacOSNotificationDetails(threadIdentifier: threadIdentifier);
  //     return NotificationDetails(
  //         iOS: iOSPlatformChannelSpecifics,
  //         macOS: macOSPlatformChannelSpecifics);
  //   }

  //   final NotificationDetails thread1PlatformChannelSpecifics =
  //       buildNotificationDetailsForThread('thread1');
  //   final NotificationDetails thread2PlatformChannelSpecifics =
  //       buildNotificationDetailsForThread('thread2');

  //   await flutterLocalNotificationsPlugin.show(
  //       0, 'thread 1', 'first notification', thread1PlatformChannelSpecifics);
  //   await flutterLocalNotificationsPlugin.show(
  //       1, 'thread 1', 'second notification', thread1PlatformChannelSpecifics);
  //   await flutterLocalNotificationsPlugin.show(
  //       2, 'thread 1', 'third notification', thread1PlatformChannelSpecifics);

  //   await flutterLocalNotificationsPlugin.show(
  //       3, 'thread 2', 'first notification', thread2PlatformChannelSpecifics);
  //   await flutterLocalNotificationsPlugin.show(
  //       4, 'thread 2', 'second notification', thread2PlatformChannelSpecifics);
  //   await flutterLocalNotificationsPlugin.show(
  //       5, 'thread 2', 'third notification', thread2PlatformChannelSpecifics);
  // }

  // Future<void> _showNotificationWithoutTimestamp() async {
  //   const AndroidNotificationDetails androidPlatformChannelSpecifics =
  //       AndroidNotificationDetails(
  //           'your channel id', 'your channel name', 'your channel description',
  //           importance: Importance.max,
  //           priority: Priority.high,
  //           showWhen: false);
  //   const NotificationDetails platformChannelSpecifics =
  //       NotificationDetails(android: androidPlatformChannelSpecifics);
  //   await flutterLocalNotificationsPlugin.show(
  //       0, 'plain title', 'plain body', platformChannelSpecifics,
  //       payload: 'item x');
  // }

  // Future<void> _showNotificationWithCustomTimestamp() async {
  //   final AndroidNotificationDetails androidPlatformChannelSpecifics =
  //       AndroidNotificationDetails(
  //     'your channel id',
  //     'your channel name',
  //     'your channel description',
  //     importance: Importance.max,
  //     priority: Priority.high,
  //     when: DateTime.now().millisecondsSinceEpoch - 120 * 1000,
  //   );
  //   final NotificationDetails platformChannelSpecifics =
  //       NotificationDetails(android: androidPlatformChannelSpecifics);
  //   await flutterLocalNotificationsPlugin.show(
  //       0, 'plain title', 'plain body', platformChannelSpecifics,
  //       payload: 'item x');
  // }

  // Future<void> _showNotificationWithCustomSubText() async {
  //   const AndroidNotificationDetails androidPlatformChannelSpecifics =
  //       AndroidNotificationDetails(
  //     'your channel id',
  //     'your channel name',
  //     'your channel description',
  //     importance: Importance.max,
  //     priority: Priority.high,
  //     showWhen: false,
  //     subText: 'custom subtext',
  //   );
  //   const NotificationDetails platformChannelSpecifics =
  //       NotificationDetails(android: androidPlatformChannelSpecifics);
  //   await flutterLocalNotificationsPlugin.show(
  //       0, 'plain title', 'plain body', platformChannelSpecifics,
  //       payload: 'item x');
  // }

  // Future<void> _showNotificationWithChronometer() async {
  //   final AndroidNotificationDetails androidPlatformChannelSpecifics =
  //       AndroidNotificationDetails(
  //     'your channel id',
  //     'your channel name',
  //     'your channel description',
  //     importance: Importance.max,
  //     priority: Priority.high,
  //     when: DateTime.now().millisecondsSinceEpoch - 120 * 1000,
  //     usesChronometer: true,
  //   );
  //   final NotificationDetails platformChannelSpecifics =
  //       NotificationDetails(android: androidPlatformChannelSpecifics);
  //   await flutterLocalNotificationsPlugin.show(
  //       0, 'plain title', 'plain body', platformChannelSpecifics,
  //       payload: 'item x');
  // }

  // Future<void> _showNotificationWithAttachment() async {
  //   final String bigPicturePath = await _downloadAndSaveFile(
  //       'https://via.placeholder.com/600x200', 'bigPicture.jpg');
  //   final IOSNotificationDetails iOSPlatformChannelSpecifics =
  //       IOSNotificationDetails(attachments: <IOSNotificationAttachment>[
  //     IOSNotificationAttachment(bigPicturePath)
  //   ]);
  //   final MacOSNotificationDetails macOSPlatformChannelSpecifics =
  //       MacOSNotificationDetails(attachments: <MacOSNotificationAttachment>[
  //     MacOSNotificationAttachment(bigPicturePath)
  //   ]);
  //   final NotificationDetails notificationDetails = NotificationDetails(
  //       iOS: iOSPlatformChannelSpecifics, macOS: macOSPlatformChannelSpecifics);
  //   await flutterLocalNotificationsPlugin.show(
  //       0,
  //       'notification with attachment title',
  //       'notification with attachment body',
  //       notificationDetails);
  // }

  // Future<void> _createNotificationChannelGroup() async {
  //   const String channelGroupId = 'your channel group id';
  //   // create the group first
  //   const AndroidNotificationChannelGroup androidNotificationChannelGroup =
  //       AndroidNotificationChannelGroup(
  //           channelGroupId, 'your channel group name',
  //           description: 'your channel group description');
  //   await flutterLocalNotificationsPlugin
  //       .resolvePlatformSpecificImplementation<
  //           AndroidFlutterLocalNotificationsPlugin>()!
  //       .createNotificationChannelGroup(androidNotificationChannelGroup);

  //   // create channels associated with the group
  //   await flutterLocalNotificationsPlugin
  //       .resolvePlatformSpecificImplementation<
  //           AndroidFlutterLocalNotificationsPlugin>()!
  //       .createNotificationChannel(const AndroidNotificationChannel(
  //           'grouped channel id 1',
  //           'grouped channel name 1',
  //           'grouped channel description 1',
  //           groupId: channelGroupId));

  //   await flutterLocalNotificationsPlugin
  //       .resolvePlatformSpecificImplementation<
  //           AndroidFlutterLocalNotificationsPlugin>()!
  //       .createNotificationChannel(const AndroidNotificationChannel(
  //           'grouped channel id 2',
  //           'grouped channel name 2',
  //           'grouped channel description 2',
  //           groupId: channelGroupId));

  //   await showDialog<void>(
  //       context: context,
  //       builder: (BuildContext context) => AlertDialog(
  //             content: Text('Channel group with name '
  //                 '${androidNotificationChannelGroup.name} created'),
  //             actions: <Widget>[
  //               TextButton(
  //                 onPressed: () {
  //                   Navigator.of(context).pop();
  //                 },
  //                 child: const Text('OK'),
  //               ),
  //             ],
  //           ));
  // }

  // Future<void> _deleteNotificationChannelGroup() async {
  //   const String channelGroupId = 'your channel group id';
  //   await flutterLocalNotificationsPlugin
  //       .resolvePlatformSpecificImplementation<
  //           AndroidFlutterLocalNotificationsPlugin>()
  //       ?.deleteNotificationChannelGroup(channelGroupId);

  //   await showDialog<void>(
  //     context: context,
  //     builder: (BuildContext context) => AlertDialog(
  //       content: const Text('Channel group with id $channelGroupId deleted'),
  //       actions: <Widget>[
  //         TextButton(
  //           onPressed: () {
  //             Navigator.of(context).pop();
  //           },
  //           child: const Text('OK'),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  // Future<void> _createNotificationChannel() async {
  //   const AndroidNotificationChannel androidNotificationChannel =
  //       AndroidNotificationChannel(
  //     'your channel id 2',
  //     'your channel name 2',
  //     'your channel description 2',
  //   );
  //   await flutterLocalNotificationsPlugin
  //       .resolvePlatformSpecificImplementation<
  //           AndroidFlutterLocalNotificationsPlugin>()
  //       ?.createNotificationChannel(androidNotificationChannel);

  //   await showDialog<void>(
  //       context: context,
  //       builder: (BuildContext context) => AlertDialog(
  //             content:
  //                 Text('Channel with name ${androidNotificationChannel.name} '
  //                     'created'),
  //             actions: <Widget>[
  //               TextButton(
  //                 onPressed: () {
  //                   Navigator.of(context).pop();
  //                 },
  //                 child: const Text('OK'),
  //               ),
  //             ],
  //           ));
  // }

  // Future<void> _deleteNotificationChannel() async {
  //   const String channelId = 'your channel id 2';
  //   await flutterLocalNotificationsPlugin
  //       .resolvePlatformSpecificImplementation<
  //           AndroidFlutterLocalNotificationsPlugin>()
  //       ?.deleteNotificationChannel(channelId);

  //   await showDialog<void>(
  //     context: context,
  //     builder: (BuildContext context) => AlertDialog(
  //       content: const Text('Channel with id $channelId deleted'),
  //       actions: <Widget>[
  //         TextButton(
  //           onPressed: () {
  //             Navigator.of(context).pop();
  //           },
  //           child: const Text('OK'),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  // Future<void> _getActiveNotifications() async {
  //   final Widget activeNotificationsDialogContent =
  //       await _getActiveNotificationsDialogContent();
  //   await showDialog<void>(
  //     context: context,
  //     builder: (BuildContext context) => AlertDialog(
  //       content: activeNotificationsDialogContent,
  //       actions: <Widget>[
  //         TextButton(
  //           onPressed: () {
  //             Navigator.of(context).pop();
  //           },
  //           child: const Text('OK'),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  // Future<Widget> _getActiveNotificationsDialogContent() async {
  //   final DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  //   final AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
  //   if (!(androidInfo.version.sdkInt >= 23)) {
  //     return const Text(
  //       '"getActiveNotifications" is available only for Android 6.0 or newer',
  //     );
  //   }

  //   try {
  //     final List<ActiveNotification>? activeNotifications =
  //         await flutterLocalNotificationsPlugin
  //             .resolvePlatformSpecificImplementation<
  //                 AndroidFlutterLocalNotificationsPlugin>()!
  //             .getActiveNotifications();

  //     return Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       mainAxisSize: MainAxisSize.min,
  //       children: <Widget>[
  //         const Text(
  //           'Active Notifications',
  //           style: TextStyle(fontWeight: FontWeight.bold),
  //         ),
  //         const Divider(color: Colors.black),
  //         if (activeNotifications!.isEmpty)
  //           const Text('No active notifications'),
  //         if (activeNotifications.isNotEmpty)
  //           for (ActiveNotification activeNotification in activeNotifications)
  //             Column(
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               children: <Widget>[
  //                 Text(
  //                   'id: ${activeNotification.id}\n'
  //                   'channelId: ${activeNotification.channelId}\n'
  //                   'title: ${activeNotification.title}\n'
  //                   'body: ${activeNotification.body}',
  //                 ),
  //                 const Divider(color: Colors.black),
  //               ],
  //             ),
  //       ],
  //     );
  //   } on PlatformException catch (error) {
  //     return Text(
  //       'Error calling "getActiveNotifications"\n'
  //       'code: ${error.code}\n'
  //       'message: ${error.message}',
  //     );
  //   }
  // }

  // Future<void> _getNotificationChannels() async {
  //   final Widget notificationChannelsDialogContent =
  //       await _getNotificationChannelsDialogContent();
  //   await showDialog<void>(
  //     context: context,
  //     builder: (BuildContext context) => AlertDialog(
  //       content: notificationChannelsDialogContent,
  //       actions: <Widget>[
  //         TextButton(
  //           onPressed: () {
  //             Navigator.of(context).pop();
  //           },
  //           child: const Text('OK'),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  // Future<Widget> _getNotificationChannelsDialogContent() async {
  //   try {
  //     final List<AndroidNotificationChannel>? channels =
  //         await flutterLocalNotificationsPlugin
  //             .resolvePlatformSpecificImplementation<
  //                 AndroidFlutterLocalNotificationsPlugin>()!
  //             .getNotificationChannels();

  //     return Container(
  //       width: double.maxFinite,
  //       child: ListView(
  //         children: <Widget>[
  //           const Text(
  //             'Notifications Channels',
  //             style: TextStyle(fontWeight: FontWeight.bold),
  //           ),
  //           const Divider(color: Colors.black),
  //           if (channels?.isEmpty ?? true)
  //             const Text('No notification channels')
  //           else
  //             for (AndroidNotificationChannel channel in channels!)
  //               Column(
  //                 crossAxisAlignment: CrossAxisAlignment.start,
  //                 children: <Widget>[
  //                   Text('id: ${channel.id}\n'
  //                       'name: ${channel.name}\n'
  //                       'description: ${channel.description}\n'
  //                       'groupId: ${channel.groupId}\n'
  //                       'importance: ${channel.importance.value}\n'
  //                       'playSound: ${channel.playSound}\n'
  //                       'sound: ${channel.sound?.sound}\n'
  //                       'enableVibration: ${channel.enableVibration}\n'
  //                       'vibrationPattern: ${channel.vibrationPattern}\n'
  //                       'showBadge: ${channel.showBadge}\n'
  //                       'enableLights: ${channel.enableLights}\n'
  //                       'ledColor: ${channel.ledColor}\n'),
  //                   const Divider(color: Colors.black),
  //                 ],
  //               ),
  //         ],
  //       ),
  //     );
  //   } on PlatformException catch (error) {
  //     return Text(
  //       'Error calling "getNotificationChannels"\n'
  //       'code: ${error.code}\n'
  //       'message: ${error.message}',
  //     );
  //   }
  // }