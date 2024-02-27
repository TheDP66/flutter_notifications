import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_notification/core/widget/padded_elevated_button.dart';
import 'package:flutter_notification/main.dart';

class CheckPendingNotificationRequests extends StatelessWidget {
  const CheckPendingNotificationRequests({super.key});

  @override
  Widget build(BuildContext context) {
    return PaddedElevatedButton(
      buttonText: 'Check pending notifications',
      onPressed: () async {
        await _checkPendingNotificationRequests(context);
      },
    );
  }
}

Future<void> _checkPendingNotificationRequests(BuildContext context) async {
  final List<PendingNotificationRequest> pendingNotificationRequests =
      await flutterLocalNotificationsPlugin.pendingNotificationRequests();

  return showDialog<void>(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      content:
          Text('${pendingNotificationRequests.length} pending notification '
              'requests'),
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
