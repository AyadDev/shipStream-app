import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../Core/utils/styles.dart';
import '../../../../../constants.dart';

class CustomContactLabelTotal extends StatelessWidget {
  const CustomContactLabelTotal({
    super.key,
    required this.label,
    required this.icon,
  });
  final String label;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
      child: Row(
        children: [
          SvgPicture.asset(
            icon,
          ),
          const SizedBox(width: 5),
          Text(label, style: Styles.textStyle16z),
        ],
      ),
    );
  }
}
