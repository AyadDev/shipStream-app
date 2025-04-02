import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../../Core/utils/styles.dart';
import '../../../../../constants.dart';

class CustomOTPTextField extends StatelessWidget {
  final TextEditingController controller;
  final bool autoFocus;
  final Function(String)? onChanged;

  const CustomOTPTextField({
    super.key,
    required this.controller,
    this.autoFocus = false,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      child: TextField(
        controller: controller,
        autofocus: autoFocus,
        style: Styles.textStyle16z.copyWith(
          fontSize: 24,
          fontWeight: FontWeight.w700,
        ),
        cursorColor: kPrimaryColor,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly,
        ],
        onChanged: onChanged,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderSide: const BorderSide(width: 1, color: kPrimaryColor),
            borderRadius: BorderRadius.circular(12),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 1, color: kPrimaryColor),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}
