import 'package:flutter/material.dart';
import 'package:shipstreem_app/Core/utils/styles.dart';
import 'package:shipstreem_app/constants.dart';

void showSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Center(
          child: Text(
        message,
        style: Styles.textStyle18,
      )),
      backgroundColor: kPrimaryColor,
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.all(16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
  );
}

// void showSnackBar(BuildContext context) {
//   final snackBar = SnackBar(
//     content: Text(
//       'تم تنفيذ الإجراء بنجاح!',
//       style: TextStyle(fontSize: 16),
//     ),
//     backgroundColor: Colors.teal,
//     behavior: SnackBarBehavior.floating,
//     margin: EdgeInsets.all(16),
//     shape: RoundedRectangleBorder(
//       borderRadius: BorderRadius.circular(10),
//     ),
//     action: SnackBarAction(
//       label: 'تراجع',
//       textColor: Colors.white,
//       onPressed: () {
//         // إجراء التراجع إن لزم الأمر
//       },
//     ),
//   );
// }
