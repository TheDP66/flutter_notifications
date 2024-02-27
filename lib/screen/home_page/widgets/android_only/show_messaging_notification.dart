import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_notification/core/widget/padded_elevated_button.dart';
import 'package:flutter_notification/main.dart';
import 'package:flutter_notification/util/file.dart';

class ShowMessagingNotification extends StatelessWidget {
  const ShowMessagingNotification({super.key});

  @override
  Widget build(BuildContext context) {
    return PaddedElevatedButton(
      buttonText: 'Show messaging notification',
      onPressed: () async {
        await _showMessagingNotification();
      },
    );
  }
}

Future<void> _showMessagingNotification() async {
  // use a platform channel to resolve an Android drawable resource to a URI.
  // This is NOT part of the notifications plugin. Calls made over this
  /// channel is handled by the app
  final String? imageUri = await platform.invokeMethod(
    'drawableToUri',
    'food',
  );

  /// First two person objects will use icons that part of the Android app's
  /// drawable resources
  const Person me = Person(
    name: 'Me',
    key: '1',
    uri: 'tel:1234567890',
    icon: DrawableResourceAndroidIcon('me'),
  );

  const Person coworker = Person(
    name: 'Coworker',
    key: '2',
    uri: 'tel:9876543210',
    icon: FlutterBitmapAssetAndroidIcon('assets/icons/coworker.png'),
  );

  // download the icon that would be use for the lunch bot person
  final String largeIconPath = await downloadAndSaveFile(
    'https://via.placeholder.com/48x48',
    'largeIcon',
  );

  // this person object will use an icon that was downloaded
  final Person lunchBot = Person(
    name: 'Lunch bot',
    key: 'bot',
    bot: true,
    icon: BitmapFilePathAndroidIcon(largeIconPath),
  );

  final List<Message> messages = <Message>[
    Message('Hi', DateTime.now(), null),
    Message(
      "What's up?",
      DateTime.now().add(const Duration(minutes: 5)),
      coworker,
    ),
    Message(
      'Lunch?',
      DateTime.now().add(const Duration(minutes: 10)),
      null,
      dataMimeType: 'image/png',
      dataUri: imageUri,
    ),
    Message(
      'What kind of food would you prefer?',
      DateTime.now().add(
        const Duration(
          minutes: 10,
        ),
      ),
      lunchBot,
    ),
  ];

  final MessagingStyleInformation messagingStyle = MessagingStyleInformation(
    me,
    groupConversation: true,
    conversationTitle: 'Team lunch',
    htmlFormatContent: true,
    htmlFormatTitle: true,
    messages: messages,
  );

  final AndroidNotificationDetails androidPlatformChannelSpecifics =
      AndroidNotificationDetails(
    'message channel id',
    'message channel name',
    channelDescription: 'message channel description',
    category: AndroidNotificationCategory.message,
    styleInformation: messagingStyle,
  );

  final NotificationDetails platformChannelSpecifics = NotificationDetails(
    android: androidPlatformChannelSpecifics,
  );

  await flutterLocalNotificationsPlugin.show(
    0,
    'message title',
    'message body',
    platformChannelSpecifics,
  );

  // wait 10 seconds and add another message to simulate another response
  await Future<void>.delayed(
    const Duration(seconds: 10),
    () async {
      messages.add(
        Message(
          'Thai',
          DateTime.now().add(const Duration(minutes: 11)),
          null,
        ),
      );
      await flutterLocalNotificationsPlugin.show(
        0,
        'message title',
        'message body',
        platformChannelSpecifics,
      );
    },
  );
}
