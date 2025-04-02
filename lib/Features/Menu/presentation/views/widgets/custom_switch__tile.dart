import 'package:flutter/material.dart';
import 'package:shipstreem_app/Core/utils/styles.dart';
import 'package:shipstreem_app/constants.dart';

class CustomSwitchTile extends StatelessWidget {
  const CustomSwitchTile({
    super.key,
    this.title,
    this.fontSize,
    required this.value,
    required this.onChanged,
    required this.subTitle,
  });
  final String? title;
  final double? fontSize;
  final String subTitle;
  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      dense: true,
      inactiveThumbColor: kPrimaryColor,
      inactiveTrackColor: Colors.white,
      activeTrackColor: kPrimaryColor,
      trackOutlineColor: const MaterialStatePropertyAll(kPrimaryColor),
      contentPadding: const EdgeInsets.symmetric(horizontal: 8),
      title: Text(
        title ?? '',
        textAlign: TextAlign.start,
        style: TextStyle(
          color: const Color(0xFFA3968E),
          fontSize: fontSize,
          fontFamily: 'Calibri',
          fontWeight: FontWeight.w700,
        ),
      ),
      subtitle:
          Text(subTitle, style: Styles.textStyle16z.copyWith(fontSize: 22)),
      value: value,
      onChanged: onChanged,
      activeColor: const Color(0xFF8D6E63),
    );
  }
}
