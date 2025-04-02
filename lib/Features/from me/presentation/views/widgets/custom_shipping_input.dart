import 'package:flutter/material.dart';

class CustomShippingInput extends StatelessWidget {
  const CustomShippingInput({
    super.key,
    required this.controller,
    this.onTap,
    required this.hintText,
    required this.label,
  });

  final TextEditingController controller;
  final Function()? onTap;
  final String hintText;
  final String label;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      readOnly: true,
      style: const TextStyle(
        fontSize: 15,
        color: Colors.grey,
      ),
      decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          hintText: hintText,
          hintStyle: const TextStyle(
            fontSize: 15,
            color: Colors.grey,
          ),
          border: InputBorder.none),
      onTap: onTap,
      // validator: (value) {
      //   if (value == null || value.isEmpty) {
      //     return 'Please enter your $label';
      //   }
      //   return null;
      // },
    );
  }
}
