import 'package:flutter/material.dart';
import 'package:flutter_notification/core/widget/padded_elevated_button.dart';
import 'package:flutter_notification/main.dart';

class CancelAllNotifications extends StatelessWidget {
  const CancelAllNotifications({super.key});

  @override
  Widget build(BuildContext context) {
    return PaddedElevatedButton(
      buttonText: 'Cancel all notifications',
      onPressed: () async {
        await _cancelAllNotifications();
      },
    );
  }
}

Future<void> _cancelAllNotifications() async {
  await flutterLocalNotificationsPlugin.cancelAll();
}
