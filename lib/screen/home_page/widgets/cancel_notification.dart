import 'package:flutter/material.dart';
import 'package:flutter_notification/core/widget/padded_elevated_button.dart';
import 'package:flutter_notification/main.dart';

class CancelNotification extends StatelessWidget {
  const CancelNotification({super.key});

  @override
  Widget build(BuildContext context) {
    return PaddedElevatedButton(
      buttonText: 'Cancel notification',
      onPressed: () async {
        await _cancelNotification();
      },
    );
  }
}

Future<void> _cancelNotification() async {
  await flutterLocalNotificationsPlugin.cancel(0);
}
