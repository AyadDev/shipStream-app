import 'package:flutter/material.dart';

import '../../../../../Core/utils/styles.dart';

class InvalidTrackingDialog extends StatelessWidget {
  const InvalidTrackingDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16.0),
        decoration: ShapeDecoration(
          color: const Color(0xFFF7F7F7),
          shape: RoundedRectangleBorder(
            side: const BorderSide(width: 1, color: Color(0xFFA3968E)),
            borderRadius: BorderRadius.circular(28),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Invalid Tracking number',
              style: Styles.textStyle15z.copyWith(
                color: const Color(0xFF83736A),
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              '132545424',
              style: Styles.textStyle15z.copyWith(
                color: const Color(0xFF83736A),
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              child: const Text(
                'OK',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
