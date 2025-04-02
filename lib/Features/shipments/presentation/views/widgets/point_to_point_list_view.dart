import 'package:flutter/material.dart';

import 'custom_point_Log_item.dart';

class CustomPointToBointLog extends StatelessWidget {
  const CustomPointToBointLog({super.key, this.padding});
  final EdgeInsetsGeometry? padding;
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: padding,
      children: const [
        CustomPointLogItem(
          location: 'shipment is out with courier for delivery',
          subLocation: 'Hong Kong - Hong Kong SAR,China',
          dateTime: '16 Nov 2024 16:23:05',
          isActive: true,
        ),
        CustomPointLogItem(
          location: 'china flight departure',
          dateTime: '16 Nov 2024 16:23:05',
          isActive: false,
        ),
        CustomPointLogItem(
          location: 'Have been Delivered',
          dateTime: '16 Nov 2024 16:23:05',
          isActive: false,
        ),
      ],
    );
  }
}
