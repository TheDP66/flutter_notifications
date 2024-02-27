import 'package:flutter/material.dart';
import 'package:flutter_notification/core/widget/padded_elevated_button.dart';
import 'package:flutter_notification/main.dart';

class CancelNotificationWithTag extends StatelessWidget {
  const CancelNotificationWithTag({super.key});

  @override
  Widget build(BuildContext context) {
    return PaddedElevatedButton(
      buttonText: 'Cancel notification with tag',
      onPressed: () async {
        await _cancelNotificationWithTag();
      },
    );
  }
}

Future<void> _cancelNotificationWithTag() async {
  await flutterLocalNotificationsPlugin.cancel(
    0,
    tag: 'tag',
  );
}
