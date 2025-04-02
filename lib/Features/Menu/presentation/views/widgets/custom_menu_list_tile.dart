import 'package:flutter/material.dart';

import '../../../../../Core/utils/styles.dart';
import '../../../../../constants.dart';

class CustomMenuListTile extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onTap;

  const CustomMenuListTile(
      {super.key, required this.icon, required this.text, required this.onTap});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          ListTile(
            visualDensity: VisualDensity.compact,
            contentPadding: EdgeInsets.zero,
            leading: Icon(icon, color: kPrimaryColor),
            title: Text(
              text,
              style: Styles.textStyle20.copyWith(
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
              ),
            ),
            onTap: onTap,
          ),
          const Divider(color: kPrimaryColor, thickness: 2),
        ],
      ),
    );
  }
}
