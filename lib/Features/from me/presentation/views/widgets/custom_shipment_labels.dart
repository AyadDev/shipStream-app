import 'package:flutter/material.dart';

class CustomShipmentLabels extends StatelessWidget {
  final String title;
  const CustomShipmentLabels({super.key, required this.title});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 24,
      child: Text(
        title,
        textAlign: TextAlign.start,
        style: const TextStyle(
          color: Color(0xFF575757),
          fontSize: 17,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w400,
          height: 1.29,
          letterSpacing: -0.43,
        ),
      ),
    );
  }
}
