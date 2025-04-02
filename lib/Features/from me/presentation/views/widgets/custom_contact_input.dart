import 'package:flutter/material.dart';

import '../../../../../Core/utils/styles.dart';
import '../../../../../constants.dart';


// ignore: must_be_immutable
class CustomContactInput extends StatelessWidget {
  const CustomContactInput(
      {super.key,
      required this.hintText,
      this.prefixIcon,
      required this.controller,
      required this.keyboardType});

  final TextEditingController controller;
  final TextInputType keyboardType;
  final String hintText;
  final Widget? prefixIcon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.4),
        ),
        child: TextFormField(
          cursorColor: kPrimaryColor,
          controller: controller,
          style: Styles.textStyle16z,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            prefixIcon: prefixIcon,
            contentPadding:
                const EdgeInsets.only(left: 16, right: 16, bottom: 10, top: 10),
            hintText: hintText,
            hintStyle: Styles.textStyle16z,
            disabledBorder: InputBorder.none,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: kPrimaryColor),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: kPrimaryColor),
            ),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your $hintText';
            }
            return null;
          },
        ),
      ),
    );
  }
}
