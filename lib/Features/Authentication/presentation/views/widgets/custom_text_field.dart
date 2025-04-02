import 'package:flutter/material.dart';
import '../../../../../Core/utils/styles.dart';
import '../../../../../constants.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final bool isPassword;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final Widget? prefixIcon;
  final TextInputType keyboardType;

  const CustomTextField({
    super.key,
    required this.label,
    this.isPassword = false,
    this.controller,
    this.validator,
    this.prefixIcon,
    required this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55,
      child: TextFormField(
        style: Styles.textStyle16z,
        textAlignVertical: TextAlignVertical.top,
        cursorColor: kPrimaryColor,
        cursorOpacityAnimates: true,
        controller: controller,
        obscureText: isPassword,
        keyboardType: keyboardType,
        strutStyle: StrutStyle.fromTextStyle(
          Styles.textStyle16z.copyWith(fontWeight: FontWeight.w700),
        ),
        validator: validator,
        decoration: InputDecoration(
          prefixIcon: prefixIcon,
          labelText: label,
          labelStyle: const TextStyle(color: Colors.grey),
          border: OutlineInputBorder(
            borderSide: const BorderSide(width: 1, color: kPrimaryColor),
            borderRadius: BorderRadius.circular(12),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 1, color: kPrimaryColor),
            borderRadius: BorderRadius.circular(12),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 1, color: kPrimaryColor),
            borderRadius: BorderRadius.circular(12),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 1, color: kPrimaryColor),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}
