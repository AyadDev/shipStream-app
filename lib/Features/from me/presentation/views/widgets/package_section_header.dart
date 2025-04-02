import 'package:flutter/material.dart';
import '../../../../../Core/utils/styles.dart';
import '../../../../../constants.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  const SectionHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          textAlign: TextAlign.center,
          style: Styles.textStyle20.copyWith(
            fontFamily: 'Inter',
            fontWeight: FontWeight.bold,
            height: 0.60,
          ),
        ),
        const SizedBox(
          width: 150,
          child: Divider(color: kPrimaryColor, thickness: 2),
        ),
      ],
    );
  }
}
