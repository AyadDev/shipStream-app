import 'package:flutter/material.dart';
import 'package:shipstreem_app/Core/widgets/custom_sized_box.dart';

import '../../../../../Core/utils/styles.dart';

class CustomPointLogItem extends StatelessWidget {
  final String location;
  final String? subLocation;
  final String dateTime;
  final bool isActive;

  const CustomPointLogItem({
    super.key,
    required this.location,
    this.subLocation,
    required this.dateTime,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          dateTime,
          style: Styles.textStyle11.copyWith(
            color: const Color(0xFF575757),
            fontSize: 10,
          ),
        ),
        20.SW,
        Column(
          children: [
            Container(
              width: 12,
              height: 12,
              decoration: BoxDecoration(
                color: isActive ? Colors.green : Colors.grey,
                shape: BoxShape.circle,
              ),
            ),
            if (isActive)
              Container(
                width: 2,
                height: 90,
                color: Colors.grey,
              ),
            if (!isActive)
              Container(
                width: 2,
                height: 90,
                color: Colors.grey,
              ),
          ],
        ),
        20.SW,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(location,
                  style:
                      Styles.textStyle11.copyWith(fontWeight: FontWeight.w700)),
              Text(
                subLocation ?? '',
                style: Styles.textStyle11,
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
