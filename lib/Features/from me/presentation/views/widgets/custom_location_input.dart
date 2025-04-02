import 'package:flutter/material.dart';
import '../../../../../Core/utils/styles.dart';

class CustomLocationInput extends StatelessWidget {
  const CustomLocationInput({
    super.key,
    required this.label,
    required this.icon,
    required this.controller,
    this.width = double.infinity,
  });
  final String label;
  final IconData icon;
  final TextEditingController controller;
  final double width;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      margin: const EdgeInsets.all(16),
      child: TextFormField(
        controller: controller,
        cursorColor: Colors.white,
        mouseCursor: MouseCursor.defer,
        decoration: InputDecoration(
          hintText: label,
          prefixIcon: Icon(icon, color: Colors.white.withOpacity(0.6)),
          border: customOutlneInputBorder(),
          enabledBorder: OutlineInputBorder(
            borderSide:
                BorderSide(width: 1, color: Colors.white.withOpacity(0.6)),
            borderRadius: BorderRadius.circular(10),
          ),
          errorBorder: customOutlneInputBorder(),
          focusedErrorBorder: customOutlneInputBorder(),
          focusedBorder: customOutlneInputBorder(),
          hintStyle: Styles.textStyle16.copyWith(
            color: Colors.white.withOpacity(0.6),
          ),
        ),
        style: const TextStyle(color: Colors.white),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter your $label';
          }
          return null;
        },
      ),
    );
  }

  OutlineInputBorder customOutlneInputBorder() {
    return OutlineInputBorder(
      borderSide: const BorderSide(width: 1, color: Colors.white),
      borderRadius: BorderRadius.circular(10),
    );
  }
}
 // latlong2     location   http+6