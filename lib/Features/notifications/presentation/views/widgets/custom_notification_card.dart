import 'package:flutter/material.dart';

import '../notifications_screen.dart';

class NotificationCard extends StatelessWidget {
  final NotificationItem notificationItem;

  const NotificationCard({super.key, required this.notificationItem});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16.0),
      width: 351,
      decoration: ShapeDecoration(
        color: const Color(0xfff9f9f9),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(19),
        ),
        shadows: const [
          BoxShadow(
            color: Color(0x3A000000),
            blurRadius: 9,
            offset: Offset(2, 6),
            spreadRadius: 0,
          )
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // العنوان الرئيسي للإشعار
            Text(
              notificationItem.title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0xFF575757),
              ),
            ),
            const SizedBox(height: 8),
            // الوصف أو بقية النص
            Text(
              notificationItem.description,
              style: const TextStyle(
                color: Color(0xFF575757),
                fontSize: 15,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
