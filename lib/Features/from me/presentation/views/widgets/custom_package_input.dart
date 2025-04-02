import 'package:flutter/material.dart';
import '../../../../../Core/utils/styles.dart';
import '../../../../../constants.dart';

class CustomPackageInput extends StatelessWidget {
  const CustomPackageInput({
    super.key,
    required this.labelText,
    this.initialValue,
    this.controller,
    this.enabled = true,
  });

  final String labelText;
  final String? initialValue;
  final TextEditingController? controller;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 5),
      height: 70,
      width: double.infinity,
      decoration: ShapeDecoration(
        color: const Color(0x2DA3968E),
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 1, color: Color(0xFFA3968E)),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Column(
        children: [
          Text(labelText, style: Styles.textStyle15z),
          SizedBox(
            height: 40,
            child: TextFormField(
              enabled: enabled,
              controller: controller,
              cursorColor: kPrimaryColor,
              initialValue: controller == null ? initialValue : null,
              keyboardType: TextInputType.number,
              style: Styles.textStyle16z.copyWith(fontWeight: FontWeight.w900),
              textAlign: TextAlign.center,
              decoration: const InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 8, horizontal: 32),
                border: InputBorder.none,
              ),
              validator: (value) => (value == null || value.isEmpty)
                  ? 'Please enter your number'
                  : null,
            ),
          ),
        ],
      ),
    );
  }
}
