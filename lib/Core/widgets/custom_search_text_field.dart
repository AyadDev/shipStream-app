import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:shipstreem_app/Core/utils/styles.dart';
import 'package:shipstreem_app/constants.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
      child: Container(
        // margin: EdgeInsets.zero,
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          color: Colors.white.withAlpha(178),
          shape: RoundedRectangleBorder(
            side: const BorderSide(
              width: 1,
              strokeAlign: BorderSide.strokeAlignCenter,
              color: kPrimaryColor,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        child: TextFormField(
          controller: controller,
          style: Styles.textStyle13,
          cursorColor: kPrimaryColor,
          decoration: const InputDecoration(
            contentPadding: EdgeInsets.all(16),
            prefixIcon: Icon(Icons.qr_code_scanner, color: kPrimaryColor),
            suffixIcon: Icon(Icons.search, color: kPrimaryColor),
            hintText: "Enter Tracking Number or scan Barcode",
            hintStyle: Styles.textStyle13,
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}








// class CustomSearchTextField extends StatelessWidget {
//   const CustomSearchTextField({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return BackdropFilter(
//       filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10), // تأثير الضبابية
//       child: Container(
//         decoration: BoxDecoration(
//           color: Colors.white.withOpacity(0.9), // شفافية اللون الأبيض
//           borderRadius: BorderRadius.circular(15),
//           border:
//               Border.all(color: Colors.white.withOpacity(0.3)), // تأثير زجاجي
//         ),
//         child: const TextField(
//           decoration: InputDecoration(
//             contentPadding: EdgeInsets.all(16),
//             prefixIcon: Icon(Icons.qr_code_scanner, color: Colors.brown),
//             suffixIcon: Icon(Icons.search, color: Colors.brown),
//             hintText: "Enter Tracking Number or scan Barcode",
//             border: InputBorder.none,
//           ),
//         ),
//       ),
//     );
//   }
// }
