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
        keyboardAppearance: Brightness.dark,
        cursorHeight: 20,
        cursorWidth: 1.5,
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
          labelStyle: Styles.textStyle17.copyWith(color: Colors.grey),
          border: customOutlinInputBorder(),
          focusedBorder: customOutlinInputBorder(),
          enabledBorder: customOutlinInputBorder(),
          errorBorder: customOutlinInputBorder(),
        ),
      ),
    );
  }

  OutlineInputBorder customOutlinInputBorder() {
    return OutlineInputBorder(
      borderSide: const BorderSide(width: 1, color: kPrimaryColor),
      borderRadius: BorderRadius.circular(12),
    );
  }
}
