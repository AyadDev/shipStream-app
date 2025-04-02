import 'package:flutter/material.dart';

import '../notifications_screen.dart';
import 'custom_notification_card.dart';

class CustomNotificationTab extends StatelessWidget {
  final List<NotificationItem> notifications;

  const CustomNotificationTab({super.key, required this.notifications});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: notifications.length,
      itemBuilder: (context, index) {
        return NotificationCard(notificationItem: notifications[index]);
      },
    );
  }
}
