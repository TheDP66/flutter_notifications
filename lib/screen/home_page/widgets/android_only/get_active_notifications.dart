import 'package:device_info/device_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_notification/core/widget/padded_elevated_button.dart';
import 'package:flutter_notification/main.dart';

class GetActiveNotifications extends StatelessWidget {
  const GetActiveNotifications({super.key});

  @override
  Widget build(BuildContext context) {
    return PaddedElevatedButton(
      buttonText: 'Get active notifications',
      onPressed: () async {
        await _getActiveNotifications(context);
      },
    );
  }
}

Future<void> _getActiveNotifications(BuildContext context) async {
  final Widget activeNotificationsDialogContent =
      await _getActiveNotificationsDialogContent();
  await showDialog<void>(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      content: activeNotificationsDialogContent,
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('OK'),
        ),
      ],
    ),
  );
}

Future<Widget> _getActiveNotificationsDialogContent() async {
  final DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  final AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
  if (!(androidInfo.version.sdkInt >= 23)) {
    return const Text(
      '"getActiveNotifications" is available only for Android 6.0 or newer',
    );
  }

  try {
    final List<ActiveNotification>? activeNotifications =
        await flutterLocalNotificationsPlugin
            .resolvePlatformSpecificImplementation<
                AndroidFlutterLocalNotificationsPlugin>()!
            .getActiveNotifications();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        const Text(
          'Active Notifications',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const Divider(color: Colors.black),
        if (activeNotifications!.isEmpty) const Text('No active notifications'),
        if (activeNotifications.isNotEmpty)
          for (ActiveNotification activeNotification in activeNotifications)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'id: ${activeNotification.id}\n'
                  'channelId: ${activeNotification.channelId}\n'
                  'title: ${activeNotification.title}\n'
                  'body: ${activeNotification.body}',
                ),
                const Divider(color: Colors.black),
              ],
            ),
      ],
    );
  } on PlatformException catch (error) {
    return Text(
      'Error calling "getActiveNotifications"\n'
      'code: ${error.code}\n'
      'message: ${error.message}',
    );
  }
}
